part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loaded() = _Loaded;

  const factory HomeState.invalid({
    String? message,
    @Default(true) bool isCloseLoading,
  }) = _Invalid;
  const factory HomeState.error(String message) = _Error;

  const factory HomeState.loadingTotalCount() = _LoadingTotalCount;
  const factory HomeState.loadedTotalCount() = _LoadedTotalCount;

  const factory HomeState.checkToggleExpanded() = _CheckToggleExpanded;
}
