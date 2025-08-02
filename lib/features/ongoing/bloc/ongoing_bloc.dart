import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import '../../../api/api_client.dart';
import '../../../models/orders.dart';

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

  OngoingBloc() : super(const OngoingState.initial()) {
    on<_Started>(_onStarted);
    on<_GetAllOrder>(_onGetAllOrder);
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
    add(const OngoingEvent.getAllOrder());
  }

  Future<void> _onGetAllOrder(
      _GetAllOrder event,
      Emitter<OngoingState> emit,
      ) async {
    emit(const OngoingState.loading());
    await Future.delayed(const Duration(seconds: 3));
    try {
      final raw = await sl<APIClient>().fetchListOrderAllWithDio();
      myOrders = [];
      myOrders = (raw.data as List).cast<Order>();

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
