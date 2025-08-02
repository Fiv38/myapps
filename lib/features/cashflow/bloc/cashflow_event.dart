part of 'cashflow_bloc.dart';

@freezed
class CashflowEvent with _$CashflowEvent {
  const factory CashflowEvent.started() = _Started;
  const factory CashflowEvent.getAllCashFlow() = _GetAllCashFlow;
  const factory CashflowEvent.addCashFlow() = _AddCashFlow;
  // const factory CashflowEvent.getAllCashFlow() = _GetAllCashFlow;
}
