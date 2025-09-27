import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:myapps/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/expense_items.dart';
import '../../../models/orders.dart';
import 'package:myapps/utils/date_filter_option.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

final sl = GetIt.instance; // Service locator instance

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // user & branch fields...
  String userId = '';
  String userName = '';
  String userPhone = '';
  String userAddress = '';
  String userBranch = '';
  String roleName = '';
  String branchId = '';
  String branchName = '';
  String branchAddress = '';
  String fcmToken = '';
  bool isLogin = false;

  // dashboard counters
  int totalQueue = 0;
  int totalProcess = 0;
  int totalReady = 0;
  int totalComplete = 0;

  //Order
  int totalPemasukanByOrder = 0;
  int totalOrderCount = 0;

  //Kas
  int totalKasHariIni = 0;
  int totalExpenseHariIni = 0;
  List<ExpenseItem> exItem = [];
  bool isExpanded = false;

  DateFilterOption currentFilter = DateFilterOption.today;


  HomeBloc() : super(const HomeState.initial()) {
    on<_Started>(_onStarted);
    on<_GetTotalCount>(
      _onGetTotalCount
    );
    on<_ChangeFilter>(_onChangeFilter);

  }

  Future<void> _onChangeFilter(
      _ChangeFilter event,
      Emitter<HomeState> emit,
      ) async {
    currentFilter = event.option;
    add(const HomeEvent.getTotalCount());
  }


  Future<void> _onStarted(_Started event, Emitter<HomeState> emit) async {
    // reset all dashboard counters
    totalQueue = 0;
    totalProcess = 0;
    totalReady = 0;
    totalComplete = 0;

    // reset order & cash
    totalPemasukanByOrder = 0;
    totalOrderCount = 0;
    totalKasHariIni = 0;
    totalExpenseHariIni = 0;

    // load user prefs
    final prefs = await sl.getAsync<SharedPreferences>();
    userId        = prefs.getString('userId')        ?? '';
    userName      = prefs.getString('userName')      ?? '';
    userPhone     = prefs.getString('userPhone')     ?? '';
    userAddress   = prefs.getString('userAddress')   ?? '';
    branchName    = prefs.getString('branchName')    ?? '';
    branchId      = prefs.getString('branchId')      ?? '';
    branchAddress = prefs.getString('branchAddress') ?? '';
    roleName      = prefs.getString('roleName')      ?? '';
    isLogin       = prefs.getBool('isLogin')         ?? false;
    fcmToken      = prefs.getString('fcmToken')      ?? '';

    // trigger get counts
    add(const HomeEvent.getTotalCount());
  }


  Future<void> _onGetTotalCount(_GetTotalCount event, Emitter<HomeState> emit) async {
    emit(const HomeState.loadingTotalCount());
    await Future.delayed(const Duration(milliseconds: 300));

    try {
      // 1️⃣ Get Order Status Counts
      final countRes = await sl<APIClient>().fetchTotalCountWithDio();
      if (countRes.status && countRes.data != null) {
        totalQueue = 0;
        totalProcess = 0;
        totalReady = 0;
        totalComplete = 0;

        for (final item in countRes.data as List) {
          final name = item['order_status']?['order_status_name'] as String? ?? '';
          switch (name) {
            case 'New':        totalQueue++;    break;
            case 'On Process': totalProcess++;  break;
            case 'Done':       totalReady++;    break;
            case 'Completed':  totalComplete++; break;
          }
        }
      } else {
        emit(HomeState.invalid(
          message: 'Failed to fetch status counts',
          isCloseLoading: false,
        ));
      }
    } catch (e) {
      emit(HomeState.invalid(
        message: 'Error loading status counts',
        isCloseLoading: false,
      ));
    }

    try {
      // 2️⃣ Get Order/Transaction Totals
      final txRes = await sl<APIClient>().fetchTotalTransactionTodayWithDio();
      if (txRes.status && txRes.data != null) {
        int pemasukan = 0;
        int pengeluaran = 0;

        for (final item in txRes.data as List) {
          pemasukan = double.tryParse(item['order_total_payment'].toString())?.toInt() ?? 0;
          pengeluaran  = double.tryParse(item['order_total_change'].toString())?.toInt() ?? 0;
        }

        totalOrderCount = txRes.data.length;
        totalPemasukanByOrder = pemasukan;
        totalExpenseHariIni = pengeluaran;
        totalKasHariIni = pemasukan - pengeluaran;
      }
    } catch (e) {
      emit(HomeState.invalid(
        message: 'Error loading transactions',
        isCloseLoading: false,
      ));
    }

    try {
      // 3️⃣ Get Daily Cash Summary
      final dailyCashRes = await sl<APIClient>().fetchTodayDailyCashSummary(branchId: branchId);
      if (dailyCashRes.status && dailyCashRes.data != null) {
        final daily = dailyCashRes.data as Map<String, dynamic>;

        totalKasHariIni = (daily['closing_balance'] ?? 0).toInt();
        totalExpenseHariIni = (daily['total_expense'] ?? 0).toInt();

        final todayDcsId = daily['dcs_id'] as String?;

        // 4️⃣ Fetch Expense Detail
        if (todayDcsId != null) {
          final expenseRes = await sl<APIClient>().fetchExpensesByDcsId(todayDcsId);
          if (expenseRes.status && expenseRes.data != null) {
            exItem = (expenseRes.data as List)
                .map((e) => ExpenseItem.fromJson(e))
                .toList();
          } else {
            exItem = [];
          }
        }
      } else {
        totalKasHariIni = 0;
        totalExpenseHariIni = 0;
        exItem = [];
      }
    } catch (e) {
      exItem = [];
      emit(HomeState.invalid(
        message: 'Error loading daily cash summary / expenses',
        isCloseLoading: false,
      ));
    }

    emit(const HomeState.initial());
    emit(const HomeState.loadedTotalCount());
  }


}

