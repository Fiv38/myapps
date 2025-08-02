part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = _Started;
  const factory LoginEvent.submitlogin() = _SubmitLogin;
  const factory LoginEvent.showHidePassword() = _ShowHidePassword;
  const factory LoginEvent.testConnection() = _TestConnection;
}
