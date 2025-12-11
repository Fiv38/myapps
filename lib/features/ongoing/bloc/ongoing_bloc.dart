import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import '../../../api/api_client.dart';
import '../../../models/detail_carts.dart';
import '../../../models/order_with_detail.dart';
import '../../../models/orders.dart';
import '../../../utils/helper.dart';

part 'ongoing_event.dart';
part 'ongoing_state.dart';
part 'ongoing_bloc.freezed.dart';

final sl = GetIt.instance;

class OngoingBloc extends Bloc<OngoingEvent, OngoingState> {
  // Store prefs
  String userId = '';
  String userName = '';
  String userPhone = '';
  String userAddress = '';
  String userBranch = '';
  String roleName = '';
  String branchName = '';
  String branchAddress = '';
  String fcmToken = '';
  bool isLogin = false;

  //List Order
  List<Order> myOrders = [];
  List<DetailCart> myOrderDetails = [];
  List<OrderWithDetails> myOrdersWithDetails = [];

  OngoingBloc() : super(const OngoingState.initial()) {
    on<_Started>(_onStarted);
    on<_GetAllOrder>(_onGetAllOrder);
    on<_GetAllOrderWithDetail>(_onGetAllOrderWithDetail);
    on<_EditOrder>(_onEditOrder);
    on<_CancelOrder>(_onCancelOrder);
  }

  Future<void> _onStarted(
      _Started event,
      Emitter<OngoingState> emit,
      ) async {
    emit(const OngoingState.loading());

    final prefs = await sl.getAsync<SharedPreferences>();
    userId        = prefs.getString('userId')        ?? '';
    userName      = prefs.getString('userName')      ?? '';
    userPhone     = prefs.getString('userPhone')     ?? '';
    userAddress   = prefs.getString('userAddress')   ?? '';
    branchName    = prefs.getString('branchName')    ?? '';
    branchAddress = prefs.getString('branchAddress') ?? '';
    roleName      = prefs.getString('roleName')      ?? '';
    isLogin       = prefs.getBool('isLogin')         ?? false;
    fcmToken      = prefs.getString('fcmToken')      ?? '';
    myOrders = [];
    // add(const OngoingEvent.getAllOrder());
    add(const OngoingEvent.getAllOrderWithDetail());
  }

  Future<void> _onGetAllOrderWithDetail(
      _GetAllOrderWithDetail event,
      Emitter<OngoingState> emit,
      ) async {
    try {
      final resHeader  = await sl<APIClient>().fetchListOrderAllWithDio();
      final resDetails = await sl<APIClient>().fetchOrderDetailWithDio();

      // --- Guard: header wajib OK ---
      if (resHeader.status != true || resHeader.data == null || resHeader.data is! List) {
        debugPrint('[ONGOING] Header fetch failed');
        myOrdersWithDetails = [];
        return;
      }

      // --- Parse header ---
      myOrders = (resHeader.data as List).cast<Order>();

      // --- Parse details (JANGAN cast langsung) ---
      final List<DetailCart> parsedDetails = [];
      if (resDetails.data is List) {
        for (final item in (resDetails.data as List)) {
          if (item is Map) {
            final map = Map<String, dynamic>.from(item as Map);
            parsedDetails.add(Helper.parseDetailCartFromApi(map));
          } else if (item is DetailCart) {
            parsedDetails.add(item);
          } else {
            debugPrint('[ONGOING] skip detail item type=${item.runtimeType}');
          }
        }
      }
      myOrderDetails = parsedDetails;

      // --- Lookup orderId -> Order (pakai instance yang sama dengan myOrders) ---
      final Map<String, Order> orderById = {
        for (final o in myOrders) o.orderId: o,
      };

      // --- Group detail: key = Order ---
      final Map<Order, List<DetailCart>> byOrder = {
        for (final o in myOrders) o: <DetailCart>[],
      };

      for (final d in myOrderDetails) {
        final order = orderById[d.orderId];
        if (order != null) {
          byOrder[order]!.add(d);
        } else {
          debugPrint('[ONGOING] detail tanpa header: ${d.orderId}');
        }
      }

      // --- Gabungkan header + detail ---
      myOrdersWithDetails = [
        for (final h in myOrders)
          OrderWithDetails(
            header: h,
            details: byOrder[h] ?? const <DetailCart>[],
          )
      ];

      debugPrint('[ONGOING] ✅ Fetched ${myOrdersWithDetails.length} orders '
          'with ${myOrderDetails.length} details');
      emit(const OngoingState.loaded());
    } catch (e, st) {
      debugPrint('[ONGOING][ERR] $e\n$st');
      myOrdersWithDetails = [];
    }

  }

  Future<void> _onGetAllOrder(
      _GetAllOrder event,
      Emitter<OngoingState> emit,
      ) async {
    emit(const OngoingState.loading());
    await Future.delayed(const Duration(seconds: 1));
    try {
      final raw = await sl<APIClient>().fetchListOrderAllWithDio();
      myOrders = [];
      myOrders = (raw.data as List).cast<Order>();


      // DetailCart
      emit(const OngoingState.loaded());
    } catch (e) {
      emit(OngoingState.error(e.toString()));
    }
  }
  //
  Future<void> _onEditOrder(
      _EditOrder event,
      Emitter<OngoingState> emit,
      ) async {
    emit(const OngoingState.loading());
    try {
      // 1) Siapkan payload untuk PATCH
      final updates = <String, dynamic>{
        'order_status_id': event.newStatus,
      };

      // 2) Panggil API
      final raw = await sl<APIClient>().updateOrderWithDio(
        orderId: event.orderId,
        updates: updates,
      );

      add(const OngoingEvent.getAllOrder());
    } catch (e) {
      emit(OngoingState.error(e.toString()));
    }
  }

  Future<void> _onCancelOrder(
      _CancelOrder event,
      Emitter<OngoingState> emit,
      ) async {
    emit(const OngoingState.loading());
    try {
      // Jika cancel berarti delete dari DB:
      final raw = await sl<APIClient>().deleteOrderWithDio(
        orderId: event.orderId,
      );

      add(const OngoingEvent.getAllOrder());
    } catch (e) {
      emit(OngoingState.error(e.toString()));
    }
  }
}
