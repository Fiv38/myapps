import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import '../../../api/api_client.dart';
import '../../../models/banks.dart';
import '../../../models/carts.dart';
import '../../../models/detail_carts.dart';
import '../../../models/laundry_types.dart';
import '../../../models/payment_method.dart';
import '../../../models/payment_status.dart';
import '../../../models/user.dart';
import '../../../services/receipt_builder_service.dart';
import '../../../services/wa_service.dart';

// ✅ ganti path ini sesuai lokasi helper kamu
import '../../../utils/helper.dart';

part 'pos_event.dart';
part 'pos_state.dart';
part 'pos_bloc.freezed.dart';

final sl = GetIt.instance;

class PosBloc extends Bloc<PosEvent, PosState> {
  // Controllers untuk input customer
  final TextEditingController userCustomerNameTEC          = TextEditingController();
  final TextEditingController userCustomerPhoneTEC         = TextEditingController();
  final TextEditingController userCustomerDateTEC          = TextEditingController();
  final TextEditingController userCustomerAlamatTEC        = TextEditingController();
  final TextEditingController userCustomerPaymentMethodTEC = TextEditingController();
  final TextEditingController userCustomerPaymentStatusTEC = TextEditingController();
  final TextEditingController userCustomerDibayarkanTEC    = TextEditingController();

  //Preference
  String userId = '';
  String userName = '';
  String userPhone = '';
  String userAddress = '';
  String userBranch = '';
  String roleName = '';
  String branchId = '';
  String branchName = '';
  String branchAddress = '';

  //Order
  String orderIds = '';
  Cart cartOrder = Cart.empty();
  List<DetailCart> detailCart = [];

  // Cache total untuk UI
  double totalPayment     = 0.0;
  double totalTransaction = 0.0;
  double totalChange      = 0.0;

  // Lookup data
  List<Bank>          listBank                = [];
  List<LaundryType>   listLaundryType         = [];
  List<PaymentMethod> listPaymentMethod       = [];
  List<PaymentStatus> listPaymentStatusMethod = [];

  // Customer Lists
  List<User> allUser = [];
  List<User> filteredUser = [];

  // Services
  late final WaService wa;
  late final ReceiptBuilder receipt;

  PosBloc() : super(const PosState.initial()) {
    // resolve DI
    wa      = sl<WaService>();
    receipt = sl<ReceiptBuilder>();

    // lifecycle
    on<_Initialized>(_onInitialized);

    // services
    on<_AddService>(_onAddService);
    on<_RemoveService>(_onRemoveService);
    on<_CommitServices>(_onCommitServices);

    // // get customer
    // on<_GetAllUsername>(_onGetAllUsername);

    // payment
    on<_SetPaymentMethod>(_onSetPaymentMethod);
    on<_SetPaymentStatus>(_onSetPaymentStatus);
    on<_RecalculatePayment>(_onRecalculatePayment);

    // submit
    on<_SubmitOrder>(_onSubmitOrder);

    // optional
    on<_FetchCart>((e, emit) => emit(const PosState.ready()));
    on<_DeleteCart>(_onDeleteCart);
    on<_ModifyCart>((e, emit) => emit(const PosState.ready()));
  }

  /* =========================
     Lifecycle
  ==========================*/

  Future<void> _onInitialized(_Initialized event, Emitter<PosState> emit) async {
    emit(const PosState.loading());

    if (!await _initializeSession()) {
      emit(const PosState.failure(message: 'Failed to initialize session'));
      return;
    }

    await _initializeControllers();
    await _fetchInitialDropdowns();
    await _generateInitialCart();

    final okUsers = await _onGetAllUsername();
    if (!okUsers) {
      emit(const PosState.failure(message: 'Failed to fetch users'));
      return;
    }

    emit(const PosState.ready());
  }

  Future<bool> _onGetAllUsername() async {
    try {
      final raw = await sl<APIClient>().fetchAllUsersWithDio();
      if (!raw.status || raw.data == null) return false;

      allUser = (raw.data as List)
          .map((json) => User.fromJson(json as Map<String, dynamic>))
          .toList();
      filteredUser = List.from(allUser);
      return true;
    } catch (e) {
      return false;
    }
  }


  /* =========================
     Services
  ==========================*/

  void _onAddService(_AddService event, Emitter<PosState> emit) {
    emit(const PosState.loading());
    final nextId = detailCart.isNotEmpty
        ? detailCart.map((d) => d.id).reduce((a, b) => a > b ? a : b) + 1
        : 1;

    final detail = DetailCart(
      id:          nextId,
      orderId:     orderIds,
      serviceId:   event.laundryTypeId,
      serviceName: event.laundryTypeName,
      keterangan:  event.note,
      quantity:    event.qty,
      price:       event.price,
    );

    detailCart.add(detail);

    _recomputeTotalsFromDetails();
    emit(const PosState.reset());
    emit(const PosState.serviceAdded());
  }

  void _onRemoveService(_RemoveService event, Emitter<PosState> emit) {
    final idx = detailCart.indexWhere((d) => d.id == event.id);
    if (idx == -1) {
      emit(const PosState.failure(message: 'Item not found'));
      return;
    }
    detailCart.removeAt(idx);

    _recomputeTotalsFromDetails();
    emit(const PosState.serviceDeleted());
  }

  Future<void> _onCommitServices(_CommitServices event, Emitter<PosState> emit) async {
    cartOrder = cartOrder.copyWith(cartDetails: List.from(detailCart));
    emit(const PosState.ready());
  }

  /* =========================
     Payment
  ==========================*/

  void _onSetPaymentMethod(_SetPaymentMethod event, Emitter<PosState> emit) {
    cartOrder = cartOrder.copyWith(orderPaymentMethodId: event.paymentMethodId);

    final res = Helper.onMethodSelected(
      methods:          listPaymentMethod,
      statuses:         listPaymentStatusMethod,
      selectedMethodId: event.paymentMethodId,
      totalTransaction: Helper.totalTransactionOf(detailCart),
    );

    if (res.nextStatusId != null) {
      cartOrder = cartOrder.copyWith(orderPaymentStatusId: res.nextStatusId);
      userCustomerPaymentStatusTEC.text = res.nextStatusId!;
    }

    cartOrder = cartOrder.copyWith(
      orderTotalPayment: res.nextPayment,
      orderTotalChange:  res.nextChange,
    );
    totalPayment = res.nextPayment;
    totalChange  = res.nextChange;

    userCustomerDibayarkanTEC
      ..text = res.controllerText
      ..selection = TextSelection.collapsed(offset: res.controllerText.length);

    emit(const PosState.paymentUpdated());
  }

  void _onSetPaymentStatus(_SetPaymentStatus event, Emitter<PosState> emit) {
    cartOrder = cartOrder.copyWith(orderPaymentStatusId: event.paymentStatusId);
    userCustomerPaymentStatusTEC.text = event.paymentStatusId;

    final res = Helper.onStatusSelected(
      statuses:        listPaymentStatusMethod,
      selectedStatusId: event.paymentStatusId,
      totalTransaction: Helper.totalTransactionOf(detailCart),
      currentPayment:   cartOrder.orderTotalPayment,
    );

    cartOrder = cartOrder.copyWith(
      orderTotalPayment: res.nextPayment,
      orderTotalChange:  res.nextChange,
    );
    totalPayment = res.nextPayment;
    totalChange  = res.nextChange;

    userCustomerDibayarkanTEC
      ..text = res.controllerText
      ..selection = TextSelection.collapsed(offset: res.controllerText.length);

    emit(const PosState.paymentUpdated());
  }

  void _onRecalculatePayment(_RecalculatePayment event, Emitter<PosState> emit) {
    final payment = Helper.parseRupiahToDouble(userCustomerDibayarkanTEC.text);
    final calc = Helper.applyPayment(
      payment:          payment,
      totalTransaction: Helper.totalTransactionOf(detailCart),
    );

    cartOrder = cartOrder.copyWith(
      orderTotalPayment: calc.payment,
      orderTotalChange:  calc.change,
    );
    totalPayment = calc.payment;
    totalChange  = calc.change;

    emit(const PosState.paymentUpdated());
  }

  /* =========================
     Submit order to DB
  ==========================*/

  Future<void> _onSubmitOrder(_SubmitOrder event, Emitter<PosState> emit) async {
    emit(const PosState.savingOrder());
    try {
      //Check dulu data customer
      //insert user kalo ga ada based on userCustomerPhoneTEC
      // final valid = await sl<APIClient>().submitCartToDB();

      final nowUtc = DateTime.now().toUtc();
      final endUtc = nowUtc.add(const Duration(days: 3));
      final lastRes = await sl<APIClient>().fetchLastOrderId();
      int lastId = lastRes.status && lastRes.data != null
          ? int.tryParse(lastRes.data.toString()) ?? 0
          : 0;
      final newId = lastId + 1;
      // payload order utama
      final orderPayload = {
        'id':                      newId.toString(),
        'order_id':                orderIds,
        'order_cust_username':     userCustomerNameTEC.text,
        'order_cust_nohp':         userCustomerPhoneTEC.text,
        'order_cust_address':      userCustomerAlamatTEC.text,
        'order_tgl_masuk':         nowUtc.toIso8601String(),
        'order_tgl_keluar':        endUtc.toIso8601String(),
        'order_total_payment':     cartOrder.orderTotalPayment.toString(),
        'order_total_change':      cartOrder.orderTotalChange.toString(),
        'order_total_transaction': cartOrder.orderTotalTransaction.toString(),
        'order_payment_method_id': cartOrder.orderPaymentMethodId,
        'order_payment_status_id': cartOrder.orderPaymentStatusId,
        'order_status_id':         cartOrder.orderStatusId,
        'created_at':              nowUtc.toIso8601String(),
        'created_by':              userName,
      };

      final mainRes = await sl<APIClient>().submitCartToDB(orderPayload);
      if (!mainRes.status) {
        emit(const PosState.failure(message: "Error while add cart!"));
        return;
      }

      // detail rows
      for (final d in detailCart) {
        final detailPayload = {
          'order_id':               orderIds,
          'order_laundry_type_id':  d.serviceId,
          'order_quantity':         d.quantity.toString(),
          'order_keterangan':       d.keterangan,
          'order_price':            d.price.toString(),
          'created_at':             nowUtc.toIso8601String(),
          'created_by':             userName,
        };
        final detailRes = await sl<APIClient>().submitOrderDetail(detailPayload);
        if (!detailRes.status) {
          emit(const PosState.failure(message: "Error while add detail!"));
          return;
        }
      }

      //insert pemasukan yang transaksi cash dengan detail CASH/QRIS/TRANSFER - Nomor Order
      //insert change to cashflow CHANGE - Nomor Order

      emit(const PosState.orderSaved());
    } catch (e) {
      emit(const PosState.failure(message: "Error while submit data!"));
    }
  }

  /* =========================
     Others
  ==========================*/

  void _onDeleteCart(_DeleteCart event, Emitter<PosState> emit) {
    cartOrder = Cart.empty();
    detailCart.clear();
    orderIds = '';
    totalPayment = totalTransaction = totalChange = 0.0;
    emit(const PosState.ready());
  }

  /* =========================
     Init
  ==========================*/

  Future<bool> _initializeSession() async {
    final prefs = await sl.getAsync<SharedPreferences>();
    userId = prefs.getString('userId') ?? '';
    userName = prefs.getString('userName') ?? '';
    userPhone = prefs.getString('userPhone') ?? '';
    userAddress = prefs.getString('userAddress') ?? '';
    branchName = prefs.getString('branchName') ?? '';
    branchId = prefs.getString('branchId') ?? '';
    branchAddress = prefs.getString('branchAddress') ?? '';
    roleName = prefs.getString('roleName') ?? '';

    cartOrder = Cart.empty();
    detailCart = [];
    orderIds = '';
    totalPayment = 0.0;
    totalTransaction = 0.0;
    totalChange = 0.0;

    return true;
  }

  Future<void> _initializeControllers() async {
    // generate final order id
    final lastRes = await sl<APIClient>().fetchLastOrderId();
    int lastId = lastRes.status && lastRes.data != null
        ? int.tryParse(lastRes.data.toString()) ?? 0
        : 0;
    final newId = lastId + 1;
    final today = DateFormat('ddMMyyyy').format(DateTime.now());
    orderIds = 'ORD_${today}_${newId.toString().padLeft(5, '0')}';
    userCustomerNameTEC.clear();
    userCustomerPhoneTEC.clear();
    userCustomerAlamatTEC.clear();
    userCustomerPaymentMethodTEC.clear();
    userCustomerPaymentStatusTEC.clear();
    userCustomerDibayarkanTEC.clear();

    final nowUtc = DateTime.now().toUtc();
    userCustomerDateTEC.text = DateFormat('yyyy-MM-dd HH:mm:ss').format(nowUtc);
  }

  Future<void> _fetchInitialDropdowns() async {
    final banksRes   = await sl<APIClient>().fetchBanksWithDio();
    final typesRes   = await sl<APIClient>().fetchLaundryTypesWithDio();
    final methodsRes = await sl<APIClient>().fetchPaymentMethodWithDio();
    final statusRes  = await sl<APIClient>().fetchPaymentStatusWithDio();

    listBank                = (banksRes.data as List).map((e) => Bank.fromJson(e)).toList();
    listLaundryType         = (typesRes.data as List).map((e) => LaundryType.fromJson(e)).toList();
    listPaymentMethod       = (methodsRes.data as List).map((e) => PaymentMethod.fromJson(e)).toList();
    listPaymentStatusMethod = (statusRes.data as List).map((e) => PaymentStatus.fromJson(e)).toList();

    // default pilih method pertama (kalau ada)
    if (listPaymentMethod.isNotEmpty) {
      final first = listPaymentMethod.first;
      userCustomerPaymentMethodTEC.text = first.paymentMethodId;
      cartOrder = cartOrder.copyWith(orderPaymentMethodId: first.paymentMethodId);
    }

    // default status: Pending kalau ada
    final pendingId = Helper.statusIdByNameContains(listPaymentStatusMethod, 'Belum Bayar');
    if (pendingId != null) {
      userCustomerPaymentStatusTEC.text = pendingId;
      cartOrder = cartOrder.copyWith(orderPaymentStatusId: pendingId);
    }
  }

  Future<void> _generateInitialCart() async {
    final nowUtc = DateTime.now().toUtc();

    cartOrder = Cart.empty().copyWith(
      orderId: orderIds,
      orderCustUsername: userCustomerNameTEC.text,
      orderCustNohp: userCustomerPhoneTEC.text,
      orderCustAddress: userCustomerAlamatTEC.text,
      orderTglMasuk: nowUtc,
      orderTglKeluar: nowUtc.add(const Duration(days: 3)),
      orderTotalPayment: 0.0,
      orderTotalTransaction: 0.0,
      orderTotalChange: 0.0,
      orderTotalDiscount: 0.0,
      orderPaymentMethodId: cartOrder.orderPaymentMethodId, // default dari fetch
      orderPaymentStatusId: cartOrder.orderPaymentStatusId, // default dari fetch
      orderStatusId: "OS001",
      cartDetails: [],
    );
  }

  /* =========================
     Util
  ==========================*/

  void _recomputeTotalsFromDetails() {
    totalTransaction = Helper.totalTransactionOf(detailCart);

    final paymentText = userCustomerDibayarkanTEC.text;
    final payment     = Helper.parseRupiahToDouble(paymentText);

    final calc = Helper.applyPayment(payment: payment, totalTransaction: totalTransaction);

    totalPayment = calc.payment;
    totalChange  = calc.change;

    cartOrder = cartOrder.copyWith(
      orderTotalTransaction: totalTransaction,
      orderTotalPayment:     totalPayment,
      orderTotalChange:      totalChange,
      cartDetails:           List.from(detailCart),
    );
  }

  /* =========================
     Close
  ==========================*/
  @override
  Future<void> close() {
    userCustomerNameTEC.dispose();
    userCustomerPhoneTEC.dispose();
    userCustomerDateTEC.dispose();
    userCustomerAlamatTEC.dispose();
    userCustomerPaymentMethodTEC.dispose();
    userCustomerPaymentStatusTEC.dispose();
    userCustomerDibayarkanTEC.dispose();
    return super.close();
  }

  /// Normalisasi nomor HP Indonesia ke format '62' + nsn (tanpa '0' depan).
  /// - Buang spasi/tanda baca
  /// - Terima variasi: +628xx, 008xx, 62 08xx, 0812..., 812...
  String normalizeIdPhone(String input) {
    if (input.isEmpty) return '';

    // Ambil digit (+ untuk deteksi awal) lalu buang '+'
    var s = input.replaceAll(RegExp(r'[^0-9+]'), '').replaceAll('+', '');

    // 0062xxxx -> 62xxxx
    if (s.startsWith('00')) s = s.substring(2);

    if (s.startsWith('62')) {
      // 620812... / 6200812... -> 62 + (tanpa nol berlebih)
      s = s.replaceFirst(RegExp(r'^620+'), '62');
    } else if (s.startsWith('0')) {
      // 0812... -> 62812...
      s = '62${s.substring(1)}';
    } else if (s.startsWith('8')) {
      // 812... -> 62812...
      s = '62$s';
    }
    // Batasi panjang maks E.164 (15 digit total utk ID)
    if (s.length > 15) s = s.substring(0, 15);
    return s;
  }

  /// Bandingkan dua nomor setelah normalisasi.
  bool isSamePhone(String a, String b) {
    return normalizeIdPhone(a) == normalizeIdPhone(b);
  }

}
