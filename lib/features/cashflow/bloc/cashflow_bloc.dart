import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/api_client.dart';
import '../../../models/daily_cash_summary.dart';
import '../../../models/expense.dart';

part 'cashflow_event.dart';
part 'cashflow_state.dart';
part 'cashflow_bloc.freezed.dart';

final sl = GetIt.instance; // Service locator

class CashflowBloc extends Bloc<CashflowEvent, CashflowState> {
  final List<DailyCashSummary> cashFlowSummaries = [];
  final List<Expense> expenses = [];

  int totalClosingBalanceUpdate = 0;
  int totalPemasukanCashflowToday = 0;
  int totalPengeluaranCashflowToday = 0;

  String userId = '';
  String userName = '';
  String userPhone = '';
  String userAddress = '';
  String userBranch = '';
  String roleName = '';
  String branchId = '';
  String branchName = '';
  String branchAddress = '';

  CashflowBloc() : super(const CashflowState.initial()) {
    on<_Started>(_onStarted);
    on<_GetAllCashFlow>(_onGetAllCashFlow);
    on<_AddCashFlow>(_onAddCashFlow);
  }

  Future<void> _onStarted(
      _Started event,
      Emitter<CashflowState> emit,
      ) async {
    emit(const CashflowState.loading());
    final prefs = await sl.getAsync<SharedPreferences>();
    userId        = prefs.getString('userId')        ?? '';
    userName      = prefs.getString('userName')      ?? '';
    userPhone     = prefs.getString('userPhone')     ?? '';
    userAddress   = prefs.getString('userAddress')   ?? '';
    branchName    = prefs.getString('branchName')    ?? '';
    branchId      = prefs.getString('branchId')      ?? '';
    branchAddress = prefs.getString('branchAddress') ?? '';
    add(const CashflowEvent.getAllCashFlow());
  }

  Future<void> _onGetAllCashFlow(
      _GetAllCashFlow event,
      Emitter<CashflowState> emit,
      ) async {
    emit(const CashflowState.loading());
    await Future.delayed(const Duration(seconds: 3));
    try {
      final summaryResponse = await sl<APIClient>().fetchDailyCashSummariesWithDio();
      cashFlowSummaries
        ..clear()
        ..addAll(
          (summaryResponse.data as List)
              .map((e) => DailyCashSummary.fromJson(e as Map<String, dynamic>)),
        );

      final expenseResponse = await sl<APIClient>().fetchExpensesWithDio();
      expenses
        ..clear()
        ..addAll(
          (expenseResponse.data as List)
              .map((e) => Expense.fromJson(e as Map<String, dynamic>)),
        );

      // ✅ Recompute totals for TODAY
      final now = DateTime.now();
      totalPemasukanCashflowToday = 0;
      totalPengeluaranCashflowToday = 0;

      for (final ex in expenses) {
        final dt = _parseDate(ex.createdAt ?? ex.date);
        if (dt == null || !_isSameDay(dt, now)) continue;

        // pastikan amount jadi int
        final amount = ((ex.amount) as num).toInt();
        final catId = ex.categoryId;

        if (catId == 100) {
          totalPemasukanCashflowToday += amount;
        } else {
          totalPengeluaranCashflowToday += amount;
        }
      }

      totalClosingBalanceUpdate = cashFlowSummaries.isEmpty
          ? 0
          : (cashFlowSummaries.first.closingBalance).toInt();

      emit(const CashflowState.loaded());
    } catch (e) {
      emit(const CashflowState.error(message: "Error while Get Data Cash Summary!"));
    }
  }

  // Future<void> _onAddCashFlow(
  //     _AddCashFlow event,
  //     Emitter<CashflowState> emit,
  //     ) async {
  //   emit(const CashflowState.loading());
  //   try {
  //     // 1) Ambil DCS aktif
  //     final onCurrent = await sl<APIClient>().fetchDailyCashSummariesWithDio();
  //     if (!onCurrent.status || onCurrent.data == null || (onCurrent.data as List).isEmpty) {
  //       emit(const CashflowState.error(message: "Error Get DCS (kosong/invalid)."));
  //       return;
  //     }
  //     final dcsRow              = (onCurrent.data as List).first as Map<String, dynamic>;
  //     final dcsId               = dcsRow['dcs_id'] as String;
  //     final closingBalance      = (dcsRow['opening_balance'] ?? 0) as int;
  //     final totalExpense        = (dcsRow['total_expense'] ?? 0) as int;
  //
  //     //2 step for add to expense table from data event
  //     final now = DateTime.now();
  //     final dateStr = DateFormat('yyyy-MM-dd').format(now); // simpan DATE harian
  //     final jakartaNow = DateTime.now().toUtc().add(const Duration(hours: 7));
  //
  //     final expensePayload = <String, dynamic>{
  //       'dcs_id'     : dcsId,
  //       'date'       : dateStr,                // tipe DATE/string di DB
  //       'branch_id'  : branchId,
  //       'category_id': event.categoryId,       // 100 = pemasukan
  //       'description': event.description,
  //       'amount'     : event.amount,           // int/num
  //       'created_by' : userName,                 // isi dari session kamu
  //       'created_at' : now.toIso8601String(),
  //       // jangan kirim expense_id/idx kalau auto-increment
  //     };
  //
  //     final ins = await sl<APIClient>().createExpense(payload: expensePayload);
  //     if (!ins.status) {
  //       emit(CashflowState.error(message: 'Gagal insert expense: ${ins.message}'));
  //       return;
  //     }
  //
  //     // 2) Hitung dari event
  //     final isIncome          = event.categoryId == 100;
  //     final newPemasukan      = isIncome ? event.amount : 0;
  //     final newPengeluaran    = isIncome ? totalExpense : totalExpense + event.amount;
  //     final newClosing        = closingBalance + newPemasukan - newPengeluaran;
  //
  //     final dcsUpdatePayload = {
  //       'date': dateStr,
  //       'total_expense': newPengeluaran,   // ← hanya ini
  //       'closing_balance': newClosing, // ← dan ini
  //       'updated_by': userId,
  //       'updated_at': now.toIso8601String(),
  //     };
  //
  //     debugPrint('$dcsUpdatePayload');
  //     // 3) Update DCS (pakai argumen!)
  //     final onUpdate = await sl<APIClient>().updateDailyCashSummaries(
  //       dcsId: dcsId,
  //       payload: dcsUpdatePayload,
  //     );
  //     if (!onUpdate.status) {
  //       emit(CashflowState.error(message: "Error Update DCS: ${onUpdate.message}"));
  //       return;
  //     }
  //
  //     emit(const CashflowState.added());
  //     add(const CashflowEvent.getAllCashFlow());
  //   } catch (e) {
  //     emit(CashflowState.error(message: "Add cashflow failed: $e"));
  //   }
  // }
  Future<void> _onAddCashFlow(
      _AddCashFlow event,
      Emitter<CashflowState> emit,
      ) async {
    emit(const CashflowState.loading());
    try {
      // 1) Ambil DCS aktif (pakai elemen pertama dari summaries)
      final onCurrent = await sl<APIClient>().fetchDailyCashSummariesWithDio();
      if (!onCurrent.status || onCurrent.data == null || (onCurrent.data as List).isEmpty) {
        emit(const CashflowState.error(message: "Error Get DCS (kosong/invalid)."));
        return;
      }
      final dcsRow = (onCurrent.data as List).first as Map<String, dynamic>;
      final dcsId  = (dcsRow['dcs_id'] ?? '') as String;

      final int openingBalance  = (dcsRow['opening_balance'] as num?)?.toInt() ?? 0;
      final int totalExpenseNow = (dcsRow['total_expense']   as num?)?.toInt() ?? 0;
      final int closingBalance  = (dcsRow['closing_balance'] as num?)?.toInt() ?? 0;

      // 2) Insert ke tabel expense dari event
      final now = DateTime.now();
      final dateStr = DateFormat('yyyy-MM-dd').format(now); // disimpan sebagai DATE

      final expensePayload = <String, dynamic>{
        'dcs_id'     : dcsId,
        'date'       : dateStr,
        'branch_id'  : branchId,
        'category_id': event.categoryId,   // 100 = pemasukan
        'description': event.description,
        'amount'     : event.amount,
        'created_by' : userName,
        'created_at' : now.toIso8601String(),
      };

      final ins = await sl<APIClient>().createExpense(payload: expensePayload);
      if (!ins.status) {
        emit(CashflowState.error(message: 'Gagal insert expense: ${ins.message}'));
        return;
      }

      // 3) Hitung update DCS berdasar aturan:
      //    - income (100): opening += amount, total_expense (tetap), closing += amount
      //    - expense (!=100): opening (tetap), total_expense += amount, closing -= amount
      final bool isIncome = event.categoryId == 100;
      final int amount = (event.amount as num).toInt();

      final int newOpeningBalance  = isIncome ? (openingBalance + amount) : openingBalance;
      final int newTotalExpense    = isIncome ? totalExpenseNow : (totalExpenseNow + amount);
      final int newClosingBalance  = isIncome ? (closingBalance + amount) : (closingBalance - amount);

      final dcsUpdatePayload = <String, dynamic>{
        'date'            : dateStr,
        'opening_balance' : newOpeningBalance,  // ↑ saat income
        'total_expense'   : newTotalExpense,    // ↑ saat expense
        'closing_balance' : newClosingBalance,  // +amount (income) / -amount (expense)
        'updated_by'      : userId,
        'updated_at'      : now.toIso8601String(),
      };

      debugPrint('DCS UPDATE -> $dcsUpdatePayload');

      // 4) Update DCS
      final onUpdate = await sl<APIClient>().updateDailyCashSummaries(
        dcsId: dcsId,
        payload: dcsUpdatePayload,
      );
      if (!onUpdate.status) {
        emit(CashflowState.error(message: "Error Update DCS: ${onUpdate.message}"));
        return;
      }

      emit(const CashflowState.added());
      add(const CashflowEvent.getAllCashFlow());
    } catch (e) {
      emit(CashflowState.error(message: "Add cashflow failed: $e"));
    }
  }


  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  DateTime? _parseDate(dynamic v) {
    if (v is DateTime) return v;
    if (v is String) return DateTime.tryParse(v);
    return null;
  }
}
