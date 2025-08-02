import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/api_client.dart';
import '../../../models/orders.dart';

part 'report_event.dart';
part 'report_state.dart';
part 'report_bloc.freezed.dart';

final sl = GetIt.instance; // Service locator instance

class ReportBloc extends Bloc<ReportEvent, ReportState> {

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
  List<Order> historyOrders = [];

  ReportBloc() : super(const ReportState.initial()) {
    on<_Started>(_onStarted);
    on<_GetAllOrderWithDetail>(_onGetAllOrderWithDetail);
  }

  Future<void> _onStarted(
      _Started event,
      Emitter<ReportState> emit,
      ) async {
    emit(const ReportState.loading());

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
    historyOrders = [];

    add(const ReportEvent.getAllOrderWithDetail());
  }

  Future<void> _onGetAllOrderWithDetail(
      _GetAllOrderWithDetail event,
      Emitter<ReportState> emit,
      ) async {
    emit(const ReportState.loading());
    await Future.delayed(const Duration(seconds: 3));
    try {
      final raw = await sl<APIClient>().fetchListOrderAllWithDio();
      historyOrders = [];
      historyOrders = (raw.data as List).cast<Order>();

      emit(const ReportState.loaded());
    } catch (e) {
      emit(ReportState.error(e.toString()));
    }
  }

}
