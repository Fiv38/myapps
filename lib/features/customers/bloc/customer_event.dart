part of 'customer_bloc.dart';

@freezed
class CustomerEvent with _$CustomerEvent {
  const factory CustomerEvent.started() = _Started;
  const factory CustomerEvent.getAllCustomer() = _GetAllCustomer;
  const factory CustomerEvent.filterCustomer(String query) = _FilterCustomer;
  const factory CustomerEvent.rebuild() = _Rebuild;
}

