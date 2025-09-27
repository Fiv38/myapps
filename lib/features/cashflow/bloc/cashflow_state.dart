part of 'cashflow_bloc.dart';

@freezed
class CashflowState with _$CashflowState {
  const factory CashflowState.initial() = _Initial;
  const factory CashflowState.loading() = _Loading;
  const factory CashflowState.loaded() = _Loaded;

  const factory CashflowState.added() = _Added;

  const factory CashflowState.error({required String message}) = _Error;
  const factory CashflowState.reset() = _Reset;
}
