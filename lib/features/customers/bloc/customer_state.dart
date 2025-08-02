part of 'customer_bloc.dart';

@freezed
class CustomerState with _$CustomerState {
  const factory CustomerState.initial() = _Initial;
  const factory CustomerState.loading() = _Loading;
  const factory CustomerState.loaded() = _Loaded;
  const factory CustomerState.error(String message)   = _Error;
  const factory CustomerState.reset() = _Reset;
}
