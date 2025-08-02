part of 'config_bloc.dart';

@freezed
class ConfigEvent with _$ConfigEvent {
  const factory ConfigEvent.started() = _Started;
}
