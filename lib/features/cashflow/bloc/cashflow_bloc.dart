import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/api_client.dart';
import '../../../models/daily_cash_summary.dart';
import '../../../models/expense.dart';

part 'cashflow_event.dart';
part 'cashflow_state.dart';
part 'cashflow_bloc.freezed.dart';

final sl = GetIt.instance; // Service locator

class CashflowBloc extends Bloc<CashflowEvent, CashflowState> {
  /// Holds the loaded cash flow summaries
  final List<DailyCashSummary> cashFlowSummaries = [];
  /// Holds the loaded expenses
  final List<Expense> expenses = [];

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
    // Trigger data load
    add(const CashflowEvent.getAllCashFlow());
  }

  Future<void> _onGetAllCashFlow(
      _GetAllCashFlow event,
      Emitter<CashflowState> emit,
      ) async {
    emit(const CashflowState.loading());
    try {
      // Fetch daily summaries
      final summaryResponse = await sl<APIClient>().fetchDailyCashSummariesWithDio();
      cashFlowSummaries
        ..clear()
        ..addAll((summaryResponse.data as List).cast<DailyCashSummary>());

      // Fetch associated expenses
      final expenseResponse = await sl<APIClient>().fetchExpensesWithDio();
      expenses
        ..clear()
        ..addAll((expenseResponse.data as List).cast<Expense>());

      emit(const CashflowState.loaded());
    } catch (e) {
      emit(CashflowState.error(e.toString()));
    }
  }

  Future<void> _onAddCashFlow(
      _AddCashFlow event,
      Emitter<CashflowState> emit,
      ) async {
    emit(const CashflowState.loading());
    try {
      // Create summary if provided
      // if (event.summary != null) {
      //   await sl<APIClient>().createDailyCashSummary(event.summary!);
      // }
      // // Create expense if provided
      // if (event.expense != null) {
      //   await sl<APIClient>().createExpense(event.expense!);
      // }

      emit(const CashflowState.added());
      // Refresh data
      add(const CashflowEvent.getAllCashFlow());
    } catch (e) {
      emit(CashflowState.error(e.toString()));
    }
  }
}
