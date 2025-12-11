part of 'pos_bloc.dart';

@freezed
class PosEvent with _$PosEvent {
  /// lifecycle
  const factory PosEvent.initialized() = _Initialized;

  /// cart
  const factory PosEvent.fetchCart() = _FetchCart;
  const factory PosEvent.deleteCart() = _DeleteCart;
  const factory PosEvent.modifyCart() = _ModifyCart;

  /// Get Username
  const factory PosEvent.getAllUsername() = _GetAllUsername;

  /// services
  const factory PosEvent.validateService() = _ValidateService;
  const factory PosEvent.addService({
    required String laundryTypeId,
    required String laundryTypeName,
    required int qty,
    required String note,
    required double price,
  }) = _AddService;
  const factory PosEvent.commitServices() = _CommitServices;
  const factory PosEvent.removeService({required int id}) = _RemoveService;

  /// submit
  const factory PosEvent.submitOrder() = _SubmitOrder;

  /// customer
  const factory PosEvent.setCustomerName({required String name}) = _SetCustomerName;
  const factory PosEvent.setCustomerPhone({required String phone}) = _SetCustomerPhone;
  const factory PosEvent.setOrderDate({required DateTime date}) = _SetOrderDate;

  /// payment
  const factory PosEvent.recalculatePayment() = _RecalculatePayment;
  const factory PosEvent.setPaymentStatus({required String paymentStatusId}) = _SetPaymentStatus;
  const factory PosEvent.setPaymentMethod({required String paymentMethodId}) = _SetPaymentMethod;
  const factory PosEvent.confirmCustomerPayment() = _ConfirmCustomerPayment;

  /// WhatsApp (opsional bila kirim struk via BLoC)
  const factory PosEvent.sendWhatsAppReceipt() = _SendWhatsAppReceipt;
}
