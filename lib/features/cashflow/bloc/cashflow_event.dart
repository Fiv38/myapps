part of 'cashflow_bloc.dart';

@freezed
class CashflowEvent with _$CashflowEvent {
  const factory CashflowEvent.started() = _Started;
  const factory CashflowEvent.getAllCashFlow() = _GetAllCashFlow;
  const factory CashflowEvent.addCashFlow({
    required int categoryId,   // 100 = Pemasukan, selain itu = Pengeluaran
    required String description,
    required int amount,       // pakai int untuk uang
  }) = _AddCashFlow;
  // const factory CashflowEvent.getAllCashFlow() = _GetAllCashFlow;
}
