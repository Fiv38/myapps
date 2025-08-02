part of 'pos_bloc.dart';

@freezed
class PosEvent with _$PosEvent {
  const factory PosEvent.started() = _Started;

  const factory PosEvent.getCart() = _GetCart;
  const factory PosEvent.deleteCart() = _DeleteCart;
  const factory PosEvent.modifyCart() = _ModifyCart;

  //Servie Add
  const factory PosEvent.checkingService() = _CheckingService;
  const factory PosEvent.addServiceToCart({
    required String laundryTypes,   // the ID
    required String laundryNames,   // the name
    required int    qty,            // integer quantity
    required String keterangan,     // note
    required double price           // parsed double price
  }) = _AddServiceToCart;
  const factory PosEvent.submitService() = _SubmitService;

  const factory PosEvent.submitToDb() = _SubmitToDb;

  const factory PosEvent.updateCustomerName({
    required String name,
  }) = _UpdateCustomerName;

  const factory PosEvent.updateCustomerPhone({
    required String phone,
  }) = _UpdateCustomerPhone;

  const factory PosEvent.updateCustomerOrderDate({
    required DateTime date,
  }) = _UpdateCustomerOrderDate;

  const factory PosEvent.updateCustomerPayment() = _UpdateCustomerPayment;
  const factory PosEvent.updateCustomerPaymentStatus() = _UpdateCustomerPaymentStatus;

  const factory PosEvent.selectedCustomerPayment() = _SelectedCustomerPayment;

  const factory PosEvent.removeCustomerService({ required int id }) = _RemoveCustomerService;

}
