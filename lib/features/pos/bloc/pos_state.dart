part of 'pos_bloc.dart';

@freezed
class PosState with _$PosState {
  // lifecycle
  const factory PosState.initial() = _Initial;
  const factory PosState.loading() = _Loading;
  const factory PosState.ready() = _Ready;

  // generic outcomes
  const factory PosState.failure({required String message}) = _Failure;
  const factory PosState.finished() = _Finished;
  const factory PosState.paymentUpdated() = _PaymentUpdated;
  const factory PosState.reset() = _Reset;

  // cart
  const factory PosState.cartRemoving() = _CartRemoving;
  const factory PosState.cartAdded() = _CartAdded;

  // service
  const factory PosState.serviceAdding() = _ServiceAdding;
  const factory PosState.serviceAdded() = _ServiceAdded;
  const factory PosState.serviceDeleted() = _ServiceDeleted;
  const factory PosState.serviceEdited() = _ServiceEdited;

  // submit to DB
  const factory PosState.savingOrder() = _SavingOrder;
  const factory PosState.orderSaved() = _OrderSaved;

  // Get state username
  const factory PosState.gettingAllUsername() = _GettingAllUsername;
  const factory PosState.loadedAllUsername() = _LoadedAllUsername;

  // WhatsApp
  const factory PosState.sendingWhatsApp() = _SendingWhatsApp;
  const factory PosState.whatsAppSent() = _WhatsAppSent;
}
