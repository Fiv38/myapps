part of 'ongoing_bloc.dart';

@freezed
class OngoingState with _$OngoingState {
  const factory OngoingState.initial() = _Initial;
  const factory OngoingState.loading() = _Loading;
  const factory OngoingState.loaded() = _Loaded;
  const factory OngoingState.error(String message)   = _Error;
  const factory OngoingState.reset() = _Reset;
  const factory OngoingState.changeStatus() = _ChangeStatus;
}
