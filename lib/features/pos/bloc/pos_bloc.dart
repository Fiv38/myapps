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

part 'pos_event.dart';
part 'pos_state.dart';
part 'pos_bloc.freezed.dart';

final sl = GetIt.instance;

class PosBloc extends Bloc<PosEvent, PosState> {
  // Controllers for customer inputs
  final TextEditingController userCustomerNameTEC             = TextEditingController();
  final TextEditingController userCustomerPhoneTEC            = TextEditingController();
  final TextEditingController userCustomerDateTEC             = TextEditingController();
  final TextEditingController userCustomerAlamatTEC           = TextEditingController();
  final TextEditingController userCustomerPaymentMethodTEC     = TextEditingController();
  final TextEditingController userCustomerPaymentStatusTEC    = TextEditingController();
  final TextEditingController userCustomerDibayarkanTEC       = TextEditingController();

  // Store user & order info
  String userId = '';
  String orderIds = '';
  Cart cartOrder = Cart.empty();
  List<DetailCart> detailCart = [];
  String paymentMethodIds = '';
  String paymentStatusIds = '';

  // Totals
  double totalPayment     = 0.0;
  double totalTransaction = 0.0;
  double totalChange      = 0.0;

  // Lookup data
  List<Bank> listBank                 = [];
  List<LaundryType> listLaundryType   = [];
  List<PaymentMethod> listPaymentMethod = [];
  List<PaymentStatus> listPaymentStatusMethod = [];

  PosBloc() : super(const PosState.initial()) {
    on<_Started>(_onStarted);
    on<_AddServiceToCart>(_onAddServiceToCart);
    on<_SubmitService>(_onSubmitServiceToCart);
    on<_UpdateCustomerPayment>(_onUpdateCustomerPayment);
    on<_UpdateCustomerPaymentStatus>(_onUpdateCustomerPaymentStatus);
    on<_SubmitToDb>(_onSubmitToDb);
    on<_RemoveCustomerService>(_onRemoveCustomerService);
  }

  Future<void> _onStarted(_Started event, Emitter<PosState> emit) async {
    emit(const PosState.loading());

    if (!await _initializeSession()) {
      emit(const PosState.error());
      return;
    }

    await _initializeControllers();
    await _fetchInitialDropdowns();
    await _generateInitialCart();

    emit(const PosState.addedCart());
  }

  /* Service */

  void _onAddServiceToCart(_AddServiceToCart event, Emitter<PosState> emit) {
    final nextId = detailCart.isNotEmpty
        ? detailCart.map((d) => d.id).reduce((a, b) => a > b ? a : b) + 1
        : 1;

    final detail = DetailCart(
      id:          nextId,
      orderId:     orderIds,
      serviceId:   event.laundryTypes,
      serviceName: event.laundryNames,
      keterangan:  event.keterangan,
      quantity:    event.qty,
      price:       event.price,
    );
    detailCart.add(detail);
    totalTransaction += detail.price * detail.quantity;

    cartOrder = cartOrder.copyWith(
      orderTotalTransaction: totalTransaction,
      cartDetails:          List.from(detailCart),
    );


    emit(const PosState.reset());
    emit(const PosState.addedService());
  }

  void _onRemoveCustomerService(_RemoveCustomerService event, Emitter<PosState> emit) {
    final toRemove = detailCart.firstWhere((d) => d.id == event.id);
    totalTransaction -= toRemove.subTotal;
    if (totalTransaction < 0) totalTransaction = 0;
    detailCart.removeWhere((d) => d.id == event.id);
    cartOrder = cartOrder.copyWith(
      orderTotalTransaction: totalTransaction,
      cartDetails:          List.from(detailCart),
    );
    emit(const PosState.deleteService());
  }

  void _onUpdateCustomerPayment(_UpdateCustomerPayment event, Emitter<PosState> emit) {
    final raw     = userCustomerDibayarkanTEC.text;
    final digitsOnly = raw.replaceAll(RegExp(r'[^0-9]'), '');
    final payment = double.tryParse(digitsOnly) ?? 0.0;
    double changeTemp;
    if (cartOrder.orderTotalTransaction > 0) {
      changeTemp = payment - cartOrder.orderTotalTransaction;
    } else {
      changeTemp = 0.0;
    }

    cartOrder = cartOrder.copyWith(
      orderTotalPayment: payment,
      orderTotalChange:  changeTemp < 0 ? 0.0 : changeTemp,
    );
    totalPayment = payment;
    totalChange = changeTemp;
    emit(const PosState.done());
  }

  void _onUpdateCustomerPaymentStatus(_UpdateCustomerPaymentStatus event, Emitter<PosState> emit) {
    final raw     = userCustomerDibayarkanTEC.text;
    final digitsOnly = raw.replaceAll(RegExp(r'[^0-9]'), '');
    final payment = double.tryParse(digitsOnly) ?? 0.0;
    double changeTemp;
    if (cartOrder.orderTotalTransaction > 0) {
      changeTemp = payment - cartOrder.orderTotalTransaction;
    } else {
      changeTemp = 0.0;
    }

    cartOrder = cartOrder.copyWith(
      orderTotalPayment: payment,
      orderTotalChange:  changeTemp < 0 ? 0.0 : changeTemp,
    );
    totalPayment = payment;
    totalChange = changeTemp;
    emit(const PosState.done());
  }

  Future<void> _onSubmitServiceToCart(_SubmitService event, Emitter<PosState> emit) async {
    emit(const PosState.loading());
    final payment = double.tryParse(userCustomerDibayarkanTEC.text.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
    final change  = payment - cartOrder.orderTotalTransaction;

    cartOrder = cartOrder.copyWith(
      orderCustUsername:     userCustomerNameTEC.text,
      orderCustNohp:         userCustomerPhoneTEC.text,
      orderCustAddress:      userCustomerAlamatTEC.text,
      orderTotalPayment:     payment,
      orderTotalChange:      change < 0 ? 0.0 : change,
      cartDetails:           List.from(detailCart),
    );

    emit(const PosState.addedCart());
  }

  /* submission data */

  Future<void> _onSubmitToDb(_SubmitToDb event, Emitter<PosState> emit) async {
    emit(const PosState.loadingSaveToDB());
    try {
      // Fetch last id and build new primary and orderIds
      final lastRes = await sl<APIClient>().fetchLastOrderId();
      int lastId = lastRes.status && lastRes.data != null
          ? int.tryParse(lastRes.data.toString()) ?? 0
          : 0;
      final newId = lastId + 1;
      final today = DateFormat('ddMMyyyy').format(DateTime.now());
      orderIds = 'ORD_${today}_${newId.toString().padLeft(5, '0')}';

      final jakartaNow = DateTime.now().toUtc().add(const Duration(hours: 7));
      final jakartaEnd = jakartaNow.add(const Duration(days: 3));

      // Build and send main order
      final orderPayload = {
        'id':                      newId.toString(),
        'order_id':                orderIds,
        'order_cust_username':     userCustomerNameTEC.text,
        'order_cust_nohp':         userCustomerPhoneTEC.text,
        'order_cust_address':      userCustomerAlamatTEC.text,
        'order_tgl_masuk':         jakartaNow.toIso8601String(),
        'order_tgl_keluar':        jakartaEnd.toIso8601String(),
        'order_total_payment':     cartOrder.orderTotalPayment.toString(),
        'order_total_change':      cartOrder.orderTotalChange.toString(),
        'order_total_transaction': cartOrder.orderTotalTransaction.toString(),
        'order_payment_method_id': cartOrder.orderPaymentMethodId,
        'order_payment_status_id': cartOrder.orderPaymentStatusId,
        'order_status_id':         cartOrder.orderStatusId,
        'created_at':              jakartaNow.toIso8601String(),
        'created_by':              userId,
      };
      debugPrint('$orderPayload');
      final mainRes = await sl<APIClient>().submitCartToDB(orderPayload);
      if (!mainRes.status) {
        emit(PosState.updated(message: "Error while add cart!"));
        return;
      }

      // Insert each order detail row
      for (final d in detailCart) {
        final detailPayload = {
          'order_id':               orderIds,
          'order_laundry_type_id': d.serviceId,
          'order_quantity':        d.quantity.toString(),
          'order_price':           d.price.toString(),
          'created_at':            jakartaNow.toIso8601String(),
          'created_by':            userId,
        };
        debugPrint('$detailPayload');
        final detailRes = await sl<APIClient>().submitOrderDetail(detailPayload);
        if (!detailRes.status) {
          emit(PosState.updated(message: "Error while add detail!"));
          return;
        }
      }

      emit(const PosState.finishSaveToDB());
    } catch (e) {
      emit(PosState.updated(message: "Error while submit data!"));
    }
  }

  /* Initializing Data */

  Future<bool> _initializeSession() async {
    final prefs = await sl.getAsync<SharedPreferences>();
    userId = prefs.getString("userId") ?? '';
    if (cartOrder.orderId.isNotEmpty) return false;

    cartOrder = Cart.empty();
    detailCart = [];
    orderIds = '';
    paymentMethodIds = '';
    paymentStatusIds = '';
    totalPayment = 0.0;
    totalTransaction = 0.0;
    totalChange = 0.0;

    return true;
  }

  Future<void> _initializeControllers() async {
    userCustomerNameTEC.clear();
    userCustomerPhoneTEC.clear();
    userCustomerAlamatTEC.clear();
    userCustomerPaymentMethodTEC.clear();
    userCustomerPaymentStatusTEC.clear();
    userCustomerDibayarkanTEC.clear();

    final jakartaUTC = DateTime.now().toUtc().add(const Duration(hours: 7));
    userCustomerDateTEC.text = DateFormat('yyyy-MM-dd HH:mm:ss').format(jakartaUTC);
  }

  Future<void> _fetchInitialDropdowns() async {
    final banksRes = await sl<APIClient>().fetchBanksWithDio();
    final typesRes = await sl<APIClient>().fetchLaundryTypesWithDio();
    final methodsRes = await sl<APIClient>().fetchPaymentMethodWithDio();
    final statusRes = await sl<APIClient>().fetchPaymentStatusWithDio();

    listBank = (banksRes.data as List).map((e) => Bank.fromJson(e)).toList();
    debugPrint("🏦 Parsed Banks: ${listBank.map((e) => e.toJson()).toList()}");

    listLaundryType = (typesRes.data as List).map((e) => LaundryType.fromJson(e)).toList();
    debugPrint("🧺 Parsed Laundry Types: ${listLaundryType.map((e) => e.toJson()).toList()}");

    listPaymentMethod = (methodsRes.data as List).map((e) => PaymentMethod.fromJson(e)).toList();
    debugPrint("💳 Parsed Payment Methods: ${listPaymentMethod.map((e) => e.toJson()).toList()}");

    listPaymentStatusMethod = (statusRes.data as List).map((e) => PaymentStatus.fromJson(e)).toList();
    debugPrint("📄 Parsed Payment Statuses: ${listPaymentStatusMethod.map((e) => e.toJson()).toList()}");


    if (listPaymentMethod.isNotEmpty) {
      userCustomerPaymentMethodTEC.text = listPaymentMethod.first.paymentMethodId;
    }
  }

  Future<void> _generateInitialCart() async {
    final lastRes = await sl<APIClient>().fetchLastOrderId();
    int lastId = lastRes.status && lastRes.data != null
        ? int.tryParse(lastRes.data.toString()) ?? 0
        : 0;
    final newId = lastId + 1;
    final today = DateFormat('ddMMyyyy').format(DateTime.now());
    orderIds = 'ORD_${today}_${newId.toString().padLeft(5, '0')}';

    final utcDate = DateTime.parse(userCustomerDateTEC.text).toUtc();

    cartOrder = Cart.empty().copyWith(
      orderId: orderIds,
      orderCustUsername: userCustomerNameTEC.text,
      orderCustNohp: userCustomerPhoneTEC.text,
      orderCustAddress: userCustomerAlamatTEC.text,
      orderTglMasuk: utcDate.toLocal(),
      orderTglKeluar: DateTime.now().add(const Duration(days: 3)),
      orderTotalPayment: 0.0,
      orderTotalTransaction: 0.0,
      orderTotalChange: 0.0,
      orderTotalDiscount: 0.0,
      orderPaymentMethodId: "CASH",
      orderPaymentStatusId: "PS001",
      orderStatusId: "OS001",
      cartDetails: [],
    );
    debugPrint("🛒 Cart Initialized: ${cartOrder.toJson()}");
  }

  /* close pos screen */

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



}
