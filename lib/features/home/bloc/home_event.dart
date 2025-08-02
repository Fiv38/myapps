part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.getOrder() = _GetOrder;
  const factory HomeEvent.getTotalCount() = _GetTotalCount;
  const factory HomeEvent.toggleExpanded() = _ToggleExpanded;
  const factory HomeEvent.changeFilter(DateFilterOption option) = _ChangeFilter;

}
