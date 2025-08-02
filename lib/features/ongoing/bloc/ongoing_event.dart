part of 'ongoing_bloc.dart';

@freezed
class OngoingEvent with _$OngoingEvent {
  const factory OngoingEvent.started() = _Started;
  const factory OngoingEvent.getAllOrder() = _GetAllOrder;

  const factory OngoingEvent.editOrder({
    required String orderId,
    required String newStatus,
  }) = _EditOrder;
  const factory OngoingEvent.cancelOrder({
    required String orderId,
    required String newStatus,
  }) = _CancelOrder;}
