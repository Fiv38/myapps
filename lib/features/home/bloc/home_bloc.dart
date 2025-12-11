import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:myapps/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/daily_cash_summary.dart';
import '../../../models/expense.dart';
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
  int totalCashByOrder = 0;
  int totalQrisByOrder = 0;
  int totalTransferByOrder = 0;
  int totalPemasukanByOrder = 0;
  int totalOrderCount = 0;

  final List<DailyCashSummary> cashFlowSummaries = [];
  final List<Expense> expenses = [];

  int totalClosingBalanceUpdate = 0;
  int totalPemasukanCashflowToday = 0;
  int totalPengeluaranCashflowToday = 0;

  //Kas
  int totalKasHariIni = 0;
  int totalExpenseHariIni = 0;
  List<ExpenseItem> exItem = [];
  bool isExpanded = false;

  DateFilterOption currentFilter = DateFilterOption.today;

  HomeBloc() : super(const HomeState.initial()) {
    on<_Started>(_onStarted);
    on<_GetTotalCount>(_onGetTotalCount);
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
    totalCashByOrder = 0;
    totalQrisByOrder = 0;
    totalTransferByOrder = 0;
    totalOrderCount = 0;
    totalKasHariIni = 0;
    totalExpenseHariIni = 0;

    // load user prefs
    final prefs = await sl.getAsync<SharedPreferences>();
    userId = prefs.getString('userId') ?? '';
    userName = prefs.getString('userName') ?? '';
    userPhone = prefs.getString('userPhone') ?? '';
    userAddress = prefs.getString('userAddress') ?? '';
    branchName = prefs.getString('branchName') ?? '';
    branchId = prefs.getString('branchId') ?? '';
    branchAddress = prefs.getString('branchAddress') ?? '';
    roleName = prefs.getString('roleName') ?? '';
    isLogin = prefs.getBool('isLogin') ?? false;
    fcmToken = prefs.getString('fcmToken') ?? '';

    // trigger get counts
    add(const HomeEvent.getTotalCount());
  }

  Future<void> _onGetTotalCount(
    _GetTotalCount event,
    Emitter<HomeState> emit,
  ) async {
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
          final name =
              item['order_status']?['order_status_name'] as String? ?? '';
          switch (name) {
            case 'New':
              totalQueue++;
              break;
            case 'On Process':
              totalProcess++;
              break;
            case 'Done':
              totalReady++;
              break;
            case 'Completed':
              totalComplete++;
              break;
          }
        }
      } else {
        emit(
          HomeState.invalid(
            message: 'Failed to fetch status counts',
            isCloseLoading: false,
          ),
        );
      }
    } catch (e) {
      emit(
        HomeState.invalid(
          message: 'Error loading status counts',
          isCloseLoading: false,
        ),
      );
    }

    try {
      final txRes = await sl<APIClient>().fetchTotalTransactionTodayWithDio();

      if (txRes.status && txRes.data != null && txRes.data is List) {
        // reset
        totalPemasukanByOrder = 0;
        totalExpenseHariIni = 0;
        totalKasHariIni = 0;

        totalCashByOrder = 0;
        totalQrisByOrder = 0;
        totalTransferByOrder = 0;

        int pemasukanTotal = 0;
        int pengeluaranTotal = 0;

        for (final raw in (txRes.data as List)) {
          final map = raw as Map<String, dynamic>;

          // Ambil nominal masuk/keluar
          final masuk =
              double.tryParse('${map['order_total_payment'] ?? 0}')?.toInt() ??
              0;
          final keluar =
              double.tryParse('${map['order_total_change'] ?? 0}')?.toInt() ??
              0;

          pemasukanTotal += masuk;
          pengeluaranTotal += keluar;

          // --- DETEKSI METODE PEMBAYARAN ---
          // Sesuaikan key berikut dgn response API kamu:
          // coba id dulu, kalau gak ada, pakai name
          final String? methodId =
              (map['payment_method_id'] ?? map['order_payment_method_id'])
                  as String?;
          final String? methodName =
              (map['payment_method_name'] ?? map['order_payment_method_name'])
                  as String?;

          // Validasi pakai whitelist hardcode
          final bool allowed =
              (methodId != null && _activeMethodIds.contains(methodId)) ||
              (methodName != null &&
                  _activeMethodNames.contains(methodName?.toUpperCase()));

          if (!allowed) {
            // skip kalau metode tidak ada di list hardcode / non-aktif
            continue;
          }

          // Normalisasi nama untuk switch
          final String key =
              (methodName ??
                      // fallback ke nama dari list hardcode berdasarkan ID
                      (kPaymentMethods.firstWhere(
                                (m) => m['payment_method_id'] == methodId,
                                orElse: () => const {"payment_method_name": ""},
                              )['payment_method_name']
                              as String? ??
                          ''))
                  .toUpperCase();

          switch (key) {
            case 'CASH':
              totalCashByOrder += masuk;
              break;
            case 'QRIS':
              totalQrisByOrder += masuk;
              break;
            case 'TRANSFER':
              totalTransferByOrder += masuk;
              break;
            default:
              // jika ada metode lain di masa depan, bisa ditangani di sini
              break;
          }
        }

        totalOrderCount = (txRes.data as List).length;
        totalPemasukanByOrder = pemasukanTotal;
        totalExpenseHariIni = pengeluaranTotal;
        totalKasHariIni = pemasukanTotal - pengeluaranTotal;
      }
    } catch (e, st) {
      emit(
        HomeState.invalid(
          message: 'Error loading daily cash summary / expenses',
          isCloseLoading: false,
        ),
      );
    }

    try {
      // 1) Fetch summaries & expenses
      final summaryResponse =
          await sl<APIClient>().fetchDailyCashSummariesWithDio();
      cashFlowSummaries
        ..clear()
        ..addAll(
          (summaryResponse.data as List).map(
            (e) => DailyCashSummary.fromJson(e as Map<String, dynamic>),
          ),
        );

      final list = (summaryResponse.data as List);
      if (list.isNotEmpty) {
        final m = list.first as Map<String, dynamic>;

        totalClosingBalanceUpdate =
            (m['closing_balance'] as num?)?.toInt() ?? 0;
        // totalPengeluaranCashflowToday = (m['total_expense']   as num?)?.toInt() ?? 0;
      }

      // expense

      final expenseResponse = await sl<APIClient>().fetchExpensesWithDio();
      final rawList =
          (expenseResponse.data as List).cast<Map<String, dynamic>>();

      final now = DateTime.now(); // Asia/Jakarta (lokal)
      final start = DateTime(
        now.year,
        now.month,
        now.day,
        0,
        59,
        59,
      ); // 00:59:59
      final end = DateTime(
        now.year,
        now.month,
        now.day,
        23,
        59,
        59,
        999,
      ); // 23:59:59.999

      // 1) filter hanya yang hari ini & kategori expense (!=100)
      final todaysExpenseMaps =
          rawList.where((m) {
            final dt = _parseDateLocal(m['created_at'] ?? m['date']);
            if (dt == null) return false;

            final catId = (m['category_id'] as num?)?.toInt() ?? -1;
            final isExpense = catId != 100;

            final inRange = !dt.isBefore(start) && !dt.isAfter(end);
            return isExpense && inRange;
          }).toList();

      // 2) kalau tetap mau simpan model `expenses` tapi hanya yg hari ini:
      expenses
        ..clear()
        ..addAll(todaysExpenseMaps.map((m) => Expense.fromJson(m)));

      // 3) AMBIL amount saja ke list `expense` (sesuai permintaanmu)
      final expense =
          todaysExpenseMaps
              .map((m) => (m['amount'] as num?)?.toInt() ?? 0)
              .toList();

      // 4) (opsional) total pengeluaran hari ini
      totalPengeluaranCashflowToday = expense.fold<int>(0, (sum, v) => sum + v);
    } catch (e) {
      exItem = [];
      emit(
        HomeState.invalid(
          message: 'Error loading daily cash summary / expenses',
          isCloseLoading: false,
        ),
      );
    }

    emit(const HomeState.initial());
    emit(const HomeState.loadedTotalCount());
  }
}

// 1) Hardcode payment methods (whitelist + mapping)
const List<Map<String, Object?>> kPaymentMethods = [
  {
    "idx": 0,
    "payment_method_id": "PM001",
    "payment_method_name": "CASH",
    "bank_id": null,
    "is_active": true,
    "created_by": "superadmin",
    "created_at": "2025-04-18 02:45:54.385586",
    "updated_by": null,
    "updated_at": null,
    "deleted_by": null,
    "deleted_at": null,
  },
  {
    "idx": 1,
    "payment_method_id": "PM002",
    "payment_method_name": "QRIS",
    "bank_id": "B001",
    "is_active": true,
    "created_by": "superadmin",
    "created_at": "2025-04-18 02:45:54.385586",
    "updated_by": null,
    "updated_at": null,
    "deleted_by": null,
    "deleted_at": null,
  },
  {
    "idx": 2,
    "payment_method_id": "PM003",
    "payment_method_name": "TRANSFER",
    "bank_id": "B001",
    "is_active": true,
    "created_by": "superadmin",
    "created_at": "2025-04-18 02:45:54.385586",
    "updated_by": null,
    "updated_at": null,
    "deleted_by": null,
    "deleted_at": null,
  },
];

// Helper cepat: set ID & NAME yang aktif
final Set<String> _activeMethodIds = {
  for (final m in kPaymentMethods)
    if ((m['is_active'] as bool? ?? false)) (m['payment_method_id'] as String),
};
final Set<String> _activeMethodNames = {
  for (final m in kPaymentMethods)
    if ((m['is_active'] as bool? ?? false))
      (m['payment_method_name'] as String),
};

DateTime? _parseDate(dynamic v) {
  if (v is DateTime) return v;
  if (v is String) return DateTime.tryParse(v);
  return null;
}

bool _isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;

DateTime? _parseDateLocal(dynamic v) {
  if (v == null) return null;
  try {
    var s = v.toString();
    // normalisasi "YYYY-MM-DD HH:mm:ss" -> ISO
    if (s.contains(' ') && !s.contains('T')) s = s.replaceFirst(' ', 'T');
    final dt = DateTime.parse(s);
    return dt.isUtc ? dt.toLocal() : dt; // pastikan lokal
  } catch (_) {
    return null;
  }
}
