part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.valid() = _Valid;
  const factory LoginState.invalid({
    String? message,
    @Default(true) bool isCloseLoading,
  }) = _Invalid;
  const factory LoginState.verifying() = _Verifying;
  const factory LoginState.verificationSuccess() = _VerificationSuccess;
  const factory LoginState.verificationFailed({String? message}) = _VerificationFailed;
  const factory LoginState.changePasswordVisibility() = _ChangePasswordVisibility;
  const factory LoginState.error(String message) = _Error;
  const factory LoginState.permissionDenied() = _PermissionDenied;
  const factory LoginState.locationFetched(double latitude, double longitude) = _LocationFetched;
}
