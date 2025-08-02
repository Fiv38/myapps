// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() submitlogin,
    required TResult Function() showHidePassword,
    required TResult Function() testConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? submitlogin,
    TResult? Function()? showHidePassword,
    TResult? Function()? testConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? submitlogin,
    TResult Function()? showHidePassword,
    TResult Function()? testConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SubmitLogin value) submitlogin,
    required TResult Function(_ShowHidePassword value) showHidePassword,
    required TResult Function(_TestConnection value) testConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SubmitLogin value)? submitlogin,
    TResult? Function(_ShowHidePassword value)? showHidePassword,
    TResult? Function(_TestConnection value)? testConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SubmitLogin value)? submitlogin,
    TResult Function(_ShowHidePassword value)? showHidePassword,
    TResult Function(_TestConnection value)? testConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'LoginEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() submitlogin,
    required TResult Function() showHidePassword,
    required TResult Function() testConnection,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? submitlogin,
    TResult? Function()? showHidePassword,
    TResult? Function()? testConnection,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? submitlogin,
    TResult Function()? showHidePassword,
    TResult Function()? testConnection,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SubmitLogin value) submitlogin,
    required TResult Function(_ShowHidePassword value) showHidePassword,
    required TResult Function(_TestConnection value) testConnection,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SubmitLogin value)? submitlogin,
    TResult? Function(_ShowHidePassword value)? showHidePassword,
    TResult? Function(_TestConnection value)? testConnection,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SubmitLogin value)? submitlogin,
    TResult Function(_ShowHidePassword value)? showHidePassword,
    TResult Function(_TestConnection value)? testConnection,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements LoginEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SubmitLoginImplCopyWith<$Res> {
  factory _$$SubmitLoginImplCopyWith(
          _$SubmitLoginImpl value, $Res Function(_$SubmitLoginImpl) then) =
      __$$SubmitLoginImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmitLoginImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$SubmitLoginImpl>
    implements _$$SubmitLoginImplCopyWith<$Res> {
  __$$SubmitLoginImplCopyWithImpl(
      _$SubmitLoginImpl _value, $Res Function(_$SubmitLoginImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SubmitLoginImpl implements _SubmitLogin {
  const _$SubmitLoginImpl();

  @override
  String toString() {
    return 'LoginEvent.submitlogin()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmitLoginImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() submitlogin,
    required TResult Function() showHidePassword,
    required TResult Function() testConnection,
  }) {
    return submitlogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? submitlogin,
    TResult? Function()? showHidePassword,
    TResult? Function()? testConnection,
  }) {
    return submitlogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? submitlogin,
    TResult Function()? showHidePassword,
    TResult Function()? testConnection,
    required TResult orElse(),
  }) {
    if (submitlogin != null) {
      return submitlogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SubmitLogin value) submitlogin,
    required TResult Function(_ShowHidePassword value) showHidePassword,
    required TResult Function(_TestConnection value) testConnection,
  }) {
    return submitlogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SubmitLogin value)? submitlogin,
    TResult? Function(_ShowHidePassword value)? showHidePassword,
    TResult? Function(_TestConnection value)? testConnection,
  }) {
    return submitlogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SubmitLogin value)? submitlogin,
    TResult Function(_ShowHidePassword value)? showHidePassword,
    TResult Function(_TestConnection value)? testConnection,
    required TResult orElse(),
  }) {
    if (submitlogin != null) {
      return submitlogin(this);
    }
    return orElse();
  }
}

abstract class _SubmitLogin implements LoginEvent {
  const factory _SubmitLogin() = _$SubmitLoginImpl;
}

/// @nodoc
abstract class _$$ShowHidePasswordImplCopyWith<$Res> {
  factory _$$ShowHidePasswordImplCopyWith(_$ShowHidePasswordImpl value,
          $Res Function(_$ShowHidePasswordImpl) then) =
      __$$ShowHidePasswordImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowHidePasswordImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$ShowHidePasswordImpl>
    implements _$$ShowHidePasswordImplCopyWith<$Res> {
  __$$ShowHidePasswordImplCopyWithImpl(_$ShowHidePasswordImpl _value,
      $Res Function(_$ShowHidePasswordImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShowHidePasswordImpl implements _ShowHidePassword {
  const _$ShowHidePasswordImpl();

  @override
  String toString() {
    return 'LoginEvent.showHidePassword()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShowHidePasswordImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() submitlogin,
    required TResult Function() showHidePassword,
    required TResult Function() testConnection,
  }) {
    return showHidePassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? submitlogin,
    TResult? Function()? showHidePassword,
    TResult? Function()? testConnection,
  }) {
    return showHidePassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? submitlogin,
    TResult Function()? showHidePassword,
    TResult Function()? testConnection,
    required TResult orElse(),
  }) {
    if (showHidePassword != null) {
      return showHidePassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SubmitLogin value) submitlogin,
    required TResult Function(_ShowHidePassword value) showHidePassword,
    required TResult Function(_TestConnection value) testConnection,
  }) {
    return showHidePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SubmitLogin value)? submitlogin,
    TResult? Function(_ShowHidePassword value)? showHidePassword,
    TResult? Function(_TestConnection value)? testConnection,
  }) {
    return showHidePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SubmitLogin value)? submitlogin,
    TResult Function(_ShowHidePassword value)? showHidePassword,
    TResult Function(_TestConnection value)? testConnection,
    required TResult orElse(),
  }) {
    if (showHidePassword != null) {
      return showHidePassword(this);
    }
    return orElse();
  }
}

abstract class _ShowHidePassword implements LoginEvent {
  const factory _ShowHidePassword() = _$ShowHidePasswordImpl;
}

/// @nodoc
abstract class _$$TestConnectionImplCopyWith<$Res> {
  factory _$$TestConnectionImplCopyWith(_$TestConnectionImpl value,
          $Res Function(_$TestConnectionImpl) then) =
      __$$TestConnectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TestConnectionImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$TestConnectionImpl>
    implements _$$TestConnectionImplCopyWith<$Res> {
  __$$TestConnectionImplCopyWithImpl(
      _$TestConnectionImpl _value, $Res Function(_$TestConnectionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TestConnectionImpl implements _TestConnection {
  const _$TestConnectionImpl();

  @override
  String toString() {
    return 'LoginEvent.testConnection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TestConnectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() submitlogin,
    required TResult Function() showHidePassword,
    required TResult Function() testConnection,
  }) {
    return testConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? submitlogin,
    TResult? Function()? showHidePassword,
    TResult? Function()? testConnection,
  }) {
    return testConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? submitlogin,
    TResult Function()? showHidePassword,
    TResult Function()? testConnection,
    required TResult orElse(),
  }) {
    if (testConnection != null) {
      return testConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SubmitLogin value) submitlogin,
    required TResult Function(_ShowHidePassword value) showHidePassword,
    required TResult Function(_TestConnection value) testConnection,
  }) {
    return testConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SubmitLogin value)? submitlogin,
    TResult? Function(_ShowHidePassword value)? showHidePassword,
    TResult? Function(_TestConnection value)? testConnection,
  }) {
    return testConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SubmitLogin value)? submitlogin,
    TResult Function(_ShowHidePassword value)? showHidePassword,
    TResult Function(_TestConnection value)? testConnection,
    required TResult orElse(),
  }) {
    if (testConnection != null) {
      return testConnection(this);
    }
    return orElse();
  }
}

abstract class _TestConnection implements LoginEvent {
  const factory _TestConnection() = _$TestConnectionImpl;
}

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() valid,
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function() verifying,
    required TResult Function() verificationSuccess,
    required TResult Function(String? message) verificationFailed,
    required TResult Function() changePasswordVisibility,
    required TResult Function(String message) error,
    required TResult Function() permissionDenied,
    required TResult Function(double latitude, double longitude)
        locationFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? valid,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function()? verifying,
    TResult? Function()? verificationSuccess,
    TResult? Function(String? message)? verificationFailed,
    TResult? Function()? changePasswordVisibility,
    TResult? Function(String message)? error,
    TResult? Function()? permissionDenied,
    TResult? Function(double latitude, double longitude)? locationFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? valid,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function()? verifying,
    TResult Function()? verificationSuccess,
    TResult Function(String? message)? verificationFailed,
    TResult Function()? changePasswordVisibility,
    TResult Function(String message)? error,
    TResult Function()? permissionDenied,
    TResult Function(double latitude, double longitude)? locationFetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Valid value) valid,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Verifying value) verifying,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_VerificationFailed value) verificationFailed,
    required TResult Function(_ChangePasswordVisibility value)
        changePasswordVisibility,
    required TResult Function(_Error value) error,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_LocationFetched value) locationFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Valid value)? valid,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Verifying value)? verifying,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_VerificationFailed value)? verificationFailed,
    TResult? Function(_ChangePasswordVisibility value)?
        changePasswordVisibility,
    TResult? Function(_Error value)? error,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_LocationFetched value)? locationFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Valid value)? valid,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Verifying value)? verifying,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_VerificationFailed value)? verificationFailed,
    TResult Function(_ChangePasswordVisibility value)? changePasswordVisibility,
    TResult Function(_Error value)? error,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_LocationFetched value)? locationFetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'LoginState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() valid,
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function() verifying,
    required TResult Function() verificationSuccess,
    required TResult Function(String? message) verificationFailed,
    required TResult Function() changePasswordVisibility,
    required TResult Function(String message) error,
    required TResult Function() permissionDenied,
    required TResult Function(double latitude, double longitude)
        locationFetched,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? valid,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function()? verifying,
    TResult? Function()? verificationSuccess,
    TResult? Function(String? message)? verificationFailed,
    TResult? Function()? changePasswordVisibility,
    TResult? Function(String message)? error,
    TResult? Function()? permissionDenied,
    TResult? Function(double latitude, double longitude)? locationFetched,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? valid,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function()? verifying,
    TResult Function()? verificationSuccess,
    TResult Function(String? message)? verificationFailed,
    TResult Function()? changePasswordVisibility,
    TResult Function(String message)? error,
    TResult Function()? permissionDenied,
    TResult Function(double latitude, double longitude)? locationFetched,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Valid value) valid,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Verifying value) verifying,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_VerificationFailed value) verificationFailed,
    required TResult Function(_ChangePasswordVisibility value)
        changePasswordVisibility,
    required TResult Function(_Error value) error,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_LocationFetched value) locationFetched,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Valid value)? valid,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Verifying value)? verifying,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_VerificationFailed value)? verificationFailed,
    TResult? Function(_ChangePasswordVisibility value)?
        changePasswordVisibility,
    TResult? Function(_Error value)? error,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_LocationFetched value)? locationFetched,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Valid value)? valid,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Verifying value)? verifying,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_VerificationFailed value)? verificationFailed,
    TResult Function(_ChangePasswordVisibility value)? changePasswordVisibility,
    TResult Function(_Error value)? error,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_LocationFetched value)? locationFetched,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LoginState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'LoginState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() valid,
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function() verifying,
    required TResult Function() verificationSuccess,
    required TResult Function(String? message) verificationFailed,
    required TResult Function() changePasswordVisibility,
    required TResult Function(String message) error,
    required TResult Function() permissionDenied,
    required TResult Function(double latitude, double longitude)
        locationFetched,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? valid,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function()? verifying,
    TResult? Function()? verificationSuccess,
    TResult? Function(String? message)? verificationFailed,
    TResult? Function()? changePasswordVisibility,
    TResult? Function(String message)? error,
    TResult? Function()? permissionDenied,
    TResult? Function(double latitude, double longitude)? locationFetched,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? valid,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function()? verifying,
    TResult Function()? verificationSuccess,
    TResult Function(String? message)? verificationFailed,
    TResult Function()? changePasswordVisibility,
    TResult Function(String message)? error,
    TResult Function()? permissionDenied,
    TResult Function(double latitude, double longitude)? locationFetched,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Valid value) valid,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Verifying value) verifying,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_VerificationFailed value) verificationFailed,
    required TResult Function(_ChangePasswordVisibility value)
        changePasswordVisibility,
    required TResult Function(_Error value) error,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_LocationFetched value) locationFetched,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Valid value)? valid,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Verifying value)? verifying,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_VerificationFailed value)? verificationFailed,
    TResult? Function(_ChangePasswordVisibility value)?
        changePasswordVisibility,
    TResult? Function(_Error value)? error,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_LocationFetched value)? locationFetched,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Valid value)? valid,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Verifying value)? verifying,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_VerificationFailed value)? verificationFailed,
    TResult Function(_ChangePasswordVisibility value)? changePasswordVisibility,
    TResult Function(_Error value)? error,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_LocationFetched value)? locationFetched,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements LoginState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ValidImplCopyWith<$Res> {
  factory _$$ValidImplCopyWith(
          _$ValidImpl value, $Res Function(_$ValidImpl) then) =
      __$$ValidImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ValidImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$ValidImpl>
    implements _$$ValidImplCopyWith<$Res> {
  __$$ValidImplCopyWithImpl(
      _$ValidImpl _value, $Res Function(_$ValidImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ValidImpl implements _Valid {
  const _$ValidImpl();

  @override
  String toString() {
    return 'LoginState.valid()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ValidImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() valid,
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function() verifying,
    required TResult Function() verificationSuccess,
    required TResult Function(String? message) verificationFailed,
    required TResult Function() changePasswordVisibility,
    required TResult Function(String message) error,
    required TResult Function() permissionDenied,
    required TResult Function(double latitude, double longitude)
        locationFetched,
  }) {
    return valid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? valid,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function()? verifying,
    TResult? Function()? verificationSuccess,
    TResult? Function(String? message)? verificationFailed,
    TResult? Function()? changePasswordVisibility,
    TResult? Function(String message)? error,
    TResult? Function()? permissionDenied,
    TResult? Function(double latitude, double longitude)? locationFetched,
  }) {
    return valid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? valid,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function()? verifying,
    TResult Function()? verificationSuccess,
    TResult Function(String? message)? verificationFailed,
    TResult Function()? changePasswordVisibility,
    TResult Function(String message)? error,
    TResult Function()? permissionDenied,
    TResult Function(double latitude, double longitude)? locationFetched,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Valid value) valid,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Verifying value) verifying,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_VerificationFailed value) verificationFailed,
    required TResult Function(_ChangePasswordVisibility value)
        changePasswordVisibility,
    required TResult Function(_Error value) error,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_LocationFetched value) locationFetched,
  }) {
    return valid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Valid value)? valid,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Verifying value)? verifying,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_VerificationFailed value)? verificationFailed,
    TResult? Function(_ChangePasswordVisibility value)?
        changePasswordVisibility,
    TResult? Function(_Error value)? error,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_LocationFetched value)? locationFetched,
  }) {
    return valid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Valid value)? valid,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Verifying value)? verifying,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_VerificationFailed value)? verificationFailed,
    TResult Function(_ChangePasswordVisibility value)? changePasswordVisibility,
    TResult Function(_Error value)? error,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_LocationFetched value)? locationFetched,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(this);
    }
    return orElse();
  }
}

abstract class _Valid implements LoginState {
  const factory _Valid() = _$ValidImpl;
}

/// @nodoc
abstract class _$$InvalidImplCopyWith<$Res> {
  factory _$$InvalidImplCopyWith(
          _$InvalidImpl value, $Res Function(_$InvalidImpl) then) =
      __$$InvalidImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message, bool isCloseLoading});
}

/// @nodoc
class __$$InvalidImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$InvalidImpl>
    implements _$$InvalidImplCopyWith<$Res> {
  __$$InvalidImplCopyWithImpl(
      _$InvalidImpl _value, $Res Function(_$InvalidImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? isCloseLoading = null,
  }) {
    return _then(_$InvalidImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      isCloseLoading: null == isCloseLoading
          ? _value.isCloseLoading
          : isCloseLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InvalidImpl implements _Invalid {
  const _$InvalidImpl({this.message, this.isCloseLoading = true});

  @override
  final String? message;
  @override
  @JsonKey()
  final bool isCloseLoading;

  @override
  String toString() {
    return 'LoginState.invalid(message: $message, isCloseLoading: $isCloseLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isCloseLoading, isCloseLoading) ||
                other.isCloseLoading == isCloseLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, isCloseLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidImplCopyWith<_$InvalidImpl> get copyWith =>
      __$$InvalidImplCopyWithImpl<_$InvalidImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() valid,
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function() verifying,
    required TResult Function() verificationSuccess,
    required TResult Function(String? message) verificationFailed,
    required TResult Function() changePasswordVisibility,
    required TResult Function(String message) error,
    required TResult Function() permissionDenied,
    required TResult Function(double latitude, double longitude)
        locationFetched,
  }) {
    return invalid(message, isCloseLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? valid,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function()? verifying,
    TResult? Function()? verificationSuccess,
    TResult? Function(String? message)? verificationFailed,
    TResult? Function()? changePasswordVisibility,
    TResult? Function(String message)? error,
    TResult? Function()? permissionDenied,
    TResult? Function(double latitude, double longitude)? locationFetched,
  }) {
    return invalid?.call(message, isCloseLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? valid,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function()? verifying,
    TResult Function()? verificationSuccess,
    TResult Function(String? message)? verificationFailed,
    TResult Function()? changePasswordVisibility,
    TResult Function(String message)? error,
    TResult Function()? permissionDenied,
    TResult Function(double latitude, double longitude)? locationFetched,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(message, isCloseLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Valid value) valid,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Verifying value) verifying,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_VerificationFailed value) verificationFailed,
    required TResult Function(_ChangePasswordVisibility value)
        changePasswordVisibility,
    required TResult Function(_Error value) error,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_LocationFetched value) locationFetched,
  }) {
    return invalid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Valid value)? valid,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Verifying value)? verifying,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_VerificationFailed value)? verificationFailed,
    TResult? Function(_ChangePasswordVisibility value)?
        changePasswordVisibility,
    TResult? Function(_Error value)? error,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_LocationFetched value)? locationFetched,
  }) {
    return invalid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Valid value)? valid,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Verifying value)? verifying,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_VerificationFailed value)? verificationFailed,
    TResult Function(_ChangePasswordVisibility value)? changePasswordVisibility,
    TResult Function(_Error value)? error,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_LocationFetched value)? locationFetched,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(this);
    }
    return orElse();
  }
}

abstract class _Invalid implements LoginState {
  const factory _Invalid({final String? message, final bool isCloseLoading}) =
      _$InvalidImpl;

  String? get message;
  bool get isCloseLoading;
  @JsonKey(ignore: true)
  _$$InvalidImplCopyWith<_$InvalidImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyingImplCopyWith<$Res> {
  factory _$$VerifyingImplCopyWith(
          _$VerifyingImpl value, $Res Function(_$VerifyingImpl) then) =
      __$$VerifyingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifyingImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$VerifyingImpl>
    implements _$$VerifyingImplCopyWith<$Res> {
  __$$VerifyingImplCopyWithImpl(
      _$VerifyingImpl _value, $Res Function(_$VerifyingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VerifyingImpl implements _Verifying {
  const _$VerifyingImpl();

  @override
  String toString() {
    return 'LoginState.verifying()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VerifyingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() valid,
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function() verifying,
    required TResult Function() verificationSuccess,
    required TResult Function(String? message) verificationFailed,
    required TResult Function() changePasswordVisibility,
    required TResult Function(String message) error,
    required TResult Function() permissionDenied,
    required TResult Function(double latitude, double longitude)
        locationFetched,
  }) {
    return verifying();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? valid,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function()? verifying,
    TResult? Function()? verificationSuccess,
    TResult? Function(String? message)? verificationFailed,
    TResult? Function()? changePasswordVisibility,
    TResult? Function(String message)? error,
    TResult? Function()? permissionDenied,
    TResult? Function(double latitude, double longitude)? locationFetched,
  }) {
    return verifying?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? valid,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function()? verifying,
    TResult Function()? verificationSuccess,
    TResult Function(String? message)? verificationFailed,
    TResult Function()? changePasswordVisibility,
    TResult Function(String message)? error,
    TResult Function()? permissionDenied,
    TResult Function(double latitude, double longitude)? locationFetched,
    required TResult orElse(),
  }) {
    if (verifying != null) {
      return verifying();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Valid value) valid,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Verifying value) verifying,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_VerificationFailed value) verificationFailed,
    required TResult Function(_ChangePasswordVisibility value)
        changePasswordVisibility,
    required TResult Function(_Error value) error,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_LocationFetched value) locationFetched,
  }) {
    return verifying(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Valid value)? valid,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Verifying value)? verifying,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_VerificationFailed value)? verificationFailed,
    TResult? Function(_ChangePasswordVisibility value)?
        changePasswordVisibility,
    TResult? Function(_Error value)? error,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_LocationFetched value)? locationFetched,
  }) {
    return verifying?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Valid value)? valid,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Verifying value)? verifying,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_VerificationFailed value)? verificationFailed,
    TResult Function(_ChangePasswordVisibility value)? changePasswordVisibility,
    TResult Function(_Error value)? error,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_LocationFetched value)? locationFetched,
    required TResult orElse(),
  }) {
    if (verifying != null) {
      return verifying(this);
    }
    return orElse();
  }
}

abstract class _Verifying implements LoginState {
  const factory _Verifying() = _$VerifyingImpl;
}

/// @nodoc
abstract class _$$VerificationSuccessImplCopyWith<$Res> {
  factory _$$VerificationSuccessImplCopyWith(_$VerificationSuccessImpl value,
          $Res Function(_$VerificationSuccessImpl) then) =
      __$$VerificationSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerificationSuccessImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$VerificationSuccessImpl>
    implements _$$VerificationSuccessImplCopyWith<$Res> {
  __$$VerificationSuccessImplCopyWithImpl(_$VerificationSuccessImpl _value,
      $Res Function(_$VerificationSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VerificationSuccessImpl implements _VerificationSuccess {
  const _$VerificationSuccessImpl();

  @override
  String toString() {
    return 'LoginState.verificationSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() valid,
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function() verifying,
    required TResult Function() verificationSuccess,
    required TResult Function(String? message) verificationFailed,
    required TResult Function() changePasswordVisibility,
    required TResult Function(String message) error,
    required TResult Function() permissionDenied,
    required TResult Function(double latitude, double longitude)
        locationFetched,
  }) {
    return verificationSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? valid,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function()? verifying,
    TResult? Function()? verificationSuccess,
    TResult? Function(String? message)? verificationFailed,
    TResult? Function()? changePasswordVisibility,
    TResult? Function(String message)? error,
    TResult? Function()? permissionDenied,
    TResult? Function(double latitude, double longitude)? locationFetched,
  }) {
    return verificationSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? valid,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function()? verifying,
    TResult Function()? verificationSuccess,
    TResult Function(String? message)? verificationFailed,
    TResult Function()? changePasswordVisibility,
    TResult Function(String message)? error,
    TResult Function()? permissionDenied,
    TResult Function(double latitude, double longitude)? locationFetched,
    required TResult orElse(),
  }) {
    if (verificationSuccess != null) {
      return verificationSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Valid value) valid,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Verifying value) verifying,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_VerificationFailed value) verificationFailed,
    required TResult Function(_ChangePasswordVisibility value)
        changePasswordVisibility,
    required TResult Function(_Error value) error,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_LocationFetched value) locationFetched,
  }) {
    return verificationSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Valid value)? valid,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Verifying value)? verifying,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_VerificationFailed value)? verificationFailed,
    TResult? Function(_ChangePasswordVisibility value)?
        changePasswordVisibility,
    TResult? Function(_Error value)? error,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_LocationFetched value)? locationFetched,
  }) {
    return verificationSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Valid value)? valid,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Verifying value)? verifying,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_VerificationFailed value)? verificationFailed,
    TResult Function(_ChangePasswordVisibility value)? changePasswordVisibility,
    TResult Function(_Error value)? error,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_LocationFetched value)? locationFetched,
    required TResult orElse(),
  }) {
    if (verificationSuccess != null) {
      return verificationSuccess(this);
    }
    return orElse();
  }
}

abstract class _VerificationSuccess implements LoginState {
  const factory _VerificationSuccess() = _$VerificationSuccessImpl;
}

/// @nodoc
abstract class _$$VerificationFailedImplCopyWith<$Res> {
  factory _$$VerificationFailedImplCopyWith(_$VerificationFailedImpl value,
          $Res Function(_$VerificationFailedImpl) then) =
      __$$VerificationFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$VerificationFailedImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$VerificationFailedImpl>
    implements _$$VerificationFailedImplCopyWith<$Res> {
  __$$VerificationFailedImplCopyWithImpl(_$VerificationFailedImpl _value,
      $Res Function(_$VerificationFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$VerificationFailedImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$VerificationFailedImpl implements _VerificationFailed {
  const _$VerificationFailedImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'LoginState.verificationFailed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationFailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationFailedImplCopyWith<_$VerificationFailedImpl> get copyWith =>
      __$$VerificationFailedImplCopyWithImpl<_$VerificationFailedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() valid,
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function() verifying,
    required TResult Function() verificationSuccess,
    required TResult Function(String? message) verificationFailed,
    required TResult Function() changePasswordVisibility,
    required TResult Function(String message) error,
    required TResult Function() permissionDenied,
    required TResult Function(double latitude, double longitude)
        locationFetched,
  }) {
    return verificationFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? valid,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function()? verifying,
    TResult? Function()? verificationSuccess,
    TResult? Function(String? message)? verificationFailed,
    TResult? Function()? changePasswordVisibility,
    TResult? Function(String message)? error,
    TResult? Function()? permissionDenied,
    TResult? Function(double latitude, double longitude)? locationFetched,
  }) {
    return verificationFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? valid,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function()? verifying,
    TResult Function()? verificationSuccess,
    TResult Function(String? message)? verificationFailed,
    TResult Function()? changePasswordVisibility,
    TResult Function(String message)? error,
    TResult Function()? permissionDenied,
    TResult Function(double latitude, double longitude)? locationFetched,
    required TResult orElse(),
  }) {
    if (verificationFailed != null) {
      return verificationFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Valid value) valid,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Verifying value) verifying,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_VerificationFailed value) verificationFailed,
    required TResult Function(_ChangePasswordVisibility value)
        changePasswordVisibility,
    required TResult Function(_Error value) error,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_LocationFetched value) locationFetched,
  }) {
    return verificationFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Valid value)? valid,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Verifying value)? verifying,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_VerificationFailed value)? verificationFailed,
    TResult? Function(_ChangePasswordVisibility value)?
        changePasswordVisibility,
    TResult? Function(_Error value)? error,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_LocationFetched value)? locationFetched,
  }) {
    return verificationFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Valid value)? valid,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Verifying value)? verifying,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_VerificationFailed value)? verificationFailed,
    TResult Function(_ChangePasswordVisibility value)? changePasswordVisibility,
    TResult Function(_Error value)? error,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_LocationFetched value)? locationFetched,
    required TResult orElse(),
  }) {
    if (verificationFailed != null) {
      return verificationFailed(this);
    }
    return orElse();
  }
}

abstract class _VerificationFailed implements LoginState {
  const factory _VerificationFailed({final String? message}) =
      _$VerificationFailedImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$VerificationFailedImplCopyWith<_$VerificationFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangePasswordVisibilityImplCopyWith<$Res> {
  factory _$$ChangePasswordVisibilityImplCopyWith(
          _$ChangePasswordVisibilityImpl value,
          $Res Function(_$ChangePasswordVisibilityImpl) then) =
      __$$ChangePasswordVisibilityImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangePasswordVisibilityImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$ChangePasswordVisibilityImpl>
    implements _$$ChangePasswordVisibilityImplCopyWith<$Res> {
  __$$ChangePasswordVisibilityImplCopyWithImpl(
      _$ChangePasswordVisibilityImpl _value,
      $Res Function(_$ChangePasswordVisibilityImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangePasswordVisibilityImpl implements _ChangePasswordVisibility {
  const _$ChangePasswordVisibilityImpl();

  @override
  String toString() {
    return 'LoginState.changePasswordVisibility()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordVisibilityImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() valid,
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function() verifying,
    required TResult Function() verificationSuccess,
    required TResult Function(String? message) verificationFailed,
    required TResult Function() changePasswordVisibility,
    required TResult Function(String message) error,
    required TResult Function() permissionDenied,
    required TResult Function(double latitude, double longitude)
        locationFetched,
  }) {
    return changePasswordVisibility();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? valid,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function()? verifying,
    TResult? Function()? verificationSuccess,
    TResult? Function(String? message)? verificationFailed,
    TResult? Function()? changePasswordVisibility,
    TResult? Function(String message)? error,
    TResult? Function()? permissionDenied,
    TResult? Function(double latitude, double longitude)? locationFetched,
  }) {
    return changePasswordVisibility?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? valid,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function()? verifying,
    TResult Function()? verificationSuccess,
    TResult Function(String? message)? verificationFailed,
    TResult Function()? changePasswordVisibility,
    TResult Function(String message)? error,
    TResult Function()? permissionDenied,
    TResult Function(double latitude, double longitude)? locationFetched,
    required TResult orElse(),
  }) {
    if (changePasswordVisibility != null) {
      return changePasswordVisibility();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Valid value) valid,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Verifying value) verifying,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_VerificationFailed value) verificationFailed,
    required TResult Function(_ChangePasswordVisibility value)
        changePasswordVisibility,
    required TResult Function(_Error value) error,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_LocationFetched value) locationFetched,
  }) {
    return changePasswordVisibility(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Valid value)? valid,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Verifying value)? verifying,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_VerificationFailed value)? verificationFailed,
    TResult? Function(_ChangePasswordVisibility value)?
        changePasswordVisibility,
    TResult? Function(_Error value)? error,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_LocationFetched value)? locationFetched,
  }) {
    return changePasswordVisibility?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Valid value)? valid,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Verifying value)? verifying,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_VerificationFailed value)? verificationFailed,
    TResult Function(_ChangePasswordVisibility value)? changePasswordVisibility,
    TResult Function(_Error value)? error,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_LocationFetched value)? locationFetched,
    required TResult orElse(),
  }) {
    if (changePasswordVisibility != null) {
      return changePasswordVisibility(this);
    }
    return orElse();
  }
}

abstract class _ChangePasswordVisibility implements LoginState {
  const factory _ChangePasswordVisibility() = _$ChangePasswordVisibilityImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LoginState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() valid,
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function() verifying,
    required TResult Function() verificationSuccess,
    required TResult Function(String? message) verificationFailed,
    required TResult Function() changePasswordVisibility,
    required TResult Function(String message) error,
    required TResult Function() permissionDenied,
    required TResult Function(double latitude, double longitude)
        locationFetched,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? valid,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function()? verifying,
    TResult? Function()? verificationSuccess,
    TResult? Function(String? message)? verificationFailed,
    TResult? Function()? changePasswordVisibility,
    TResult? Function(String message)? error,
    TResult? Function()? permissionDenied,
    TResult? Function(double latitude, double longitude)? locationFetched,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? valid,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function()? verifying,
    TResult Function()? verificationSuccess,
    TResult Function(String? message)? verificationFailed,
    TResult Function()? changePasswordVisibility,
    TResult Function(String message)? error,
    TResult Function()? permissionDenied,
    TResult Function(double latitude, double longitude)? locationFetched,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Valid value) valid,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Verifying value) verifying,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_VerificationFailed value) verificationFailed,
    required TResult Function(_ChangePasswordVisibility value)
        changePasswordVisibility,
    required TResult Function(_Error value) error,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_LocationFetched value) locationFetched,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Valid value)? valid,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Verifying value)? verifying,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_VerificationFailed value)? verificationFailed,
    TResult? Function(_ChangePasswordVisibility value)?
        changePasswordVisibility,
    TResult? Function(_Error value)? error,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_LocationFetched value)? locationFetched,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Valid value)? valid,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Verifying value)? verifying,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_VerificationFailed value)? verificationFailed,
    TResult Function(_ChangePasswordVisibility value)? changePasswordVisibility,
    TResult Function(_Error value)? error,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_LocationFetched value)? locationFetched,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements LoginState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PermissionDeniedImplCopyWith<$Res> {
  factory _$$PermissionDeniedImplCopyWith(_$PermissionDeniedImpl value,
          $Res Function(_$PermissionDeniedImpl) then) =
      __$$PermissionDeniedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PermissionDeniedImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$PermissionDeniedImpl>
    implements _$$PermissionDeniedImplCopyWith<$Res> {
  __$$PermissionDeniedImplCopyWithImpl(_$PermissionDeniedImpl _value,
      $Res Function(_$PermissionDeniedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PermissionDeniedImpl implements _PermissionDenied {
  const _$PermissionDeniedImpl();

  @override
  String toString() {
    return 'LoginState.permissionDenied()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PermissionDeniedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() valid,
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function() verifying,
    required TResult Function() verificationSuccess,
    required TResult Function(String? message) verificationFailed,
    required TResult Function() changePasswordVisibility,
    required TResult Function(String message) error,
    required TResult Function() permissionDenied,
    required TResult Function(double latitude, double longitude)
        locationFetched,
  }) {
    return permissionDenied();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? valid,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function()? verifying,
    TResult? Function()? verificationSuccess,
    TResult? Function(String? message)? verificationFailed,
    TResult? Function()? changePasswordVisibility,
    TResult? Function(String message)? error,
    TResult? Function()? permissionDenied,
    TResult? Function(double latitude, double longitude)? locationFetched,
  }) {
    return permissionDenied?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? valid,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function()? verifying,
    TResult Function()? verificationSuccess,
    TResult Function(String? message)? verificationFailed,
    TResult Function()? changePasswordVisibility,
    TResult Function(String message)? error,
    TResult Function()? permissionDenied,
    TResult Function(double latitude, double longitude)? locationFetched,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Valid value) valid,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Verifying value) verifying,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_VerificationFailed value) verificationFailed,
    required TResult Function(_ChangePasswordVisibility value)
        changePasswordVisibility,
    required TResult Function(_Error value) error,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_LocationFetched value) locationFetched,
  }) {
    return permissionDenied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Valid value)? valid,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Verifying value)? verifying,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_VerificationFailed value)? verificationFailed,
    TResult? Function(_ChangePasswordVisibility value)?
        changePasswordVisibility,
    TResult? Function(_Error value)? error,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_LocationFetched value)? locationFetched,
  }) {
    return permissionDenied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Valid value)? valid,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Verifying value)? verifying,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_VerificationFailed value)? verificationFailed,
    TResult Function(_ChangePasswordVisibility value)? changePasswordVisibility,
    TResult Function(_Error value)? error,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_LocationFetched value)? locationFetched,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied(this);
    }
    return orElse();
  }
}

abstract class _PermissionDenied implements LoginState {
  const factory _PermissionDenied() = _$PermissionDeniedImpl;
}

/// @nodoc
abstract class _$$LocationFetchedImplCopyWith<$Res> {
  factory _$$LocationFetchedImplCopyWith(_$LocationFetchedImpl value,
          $Res Function(_$LocationFetchedImpl) then) =
      __$$LocationFetchedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$LocationFetchedImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LocationFetchedImpl>
    implements _$$LocationFetchedImplCopyWith<$Res> {
  __$$LocationFetchedImplCopyWithImpl(
      _$LocationFetchedImpl _value, $Res Function(_$LocationFetchedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$LocationFetchedImpl(
      null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$LocationFetchedImpl implements _LocationFetched {
  const _$LocationFetchedImpl(this.latitude, this.longitude);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'LoginState.locationFetched(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationFetchedImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationFetchedImplCopyWith<_$LocationFetchedImpl> get copyWith =>
      __$$LocationFetchedImplCopyWithImpl<_$LocationFetchedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() valid,
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function() verifying,
    required TResult Function() verificationSuccess,
    required TResult Function(String? message) verificationFailed,
    required TResult Function() changePasswordVisibility,
    required TResult Function(String message) error,
    required TResult Function() permissionDenied,
    required TResult Function(double latitude, double longitude)
        locationFetched,
  }) {
    return locationFetched(latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? valid,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function()? verifying,
    TResult? Function()? verificationSuccess,
    TResult? Function(String? message)? verificationFailed,
    TResult? Function()? changePasswordVisibility,
    TResult? Function(String message)? error,
    TResult? Function()? permissionDenied,
    TResult? Function(double latitude, double longitude)? locationFetched,
  }) {
    return locationFetched?.call(latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? valid,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function()? verifying,
    TResult Function()? verificationSuccess,
    TResult Function(String? message)? verificationFailed,
    TResult Function()? changePasswordVisibility,
    TResult Function(String message)? error,
    TResult Function()? permissionDenied,
    TResult Function(double latitude, double longitude)? locationFetched,
    required TResult orElse(),
  }) {
    if (locationFetched != null) {
      return locationFetched(latitude, longitude);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Valid value) valid,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Verifying value) verifying,
    required TResult Function(_VerificationSuccess value) verificationSuccess,
    required TResult Function(_VerificationFailed value) verificationFailed,
    required TResult Function(_ChangePasswordVisibility value)
        changePasswordVisibility,
    required TResult Function(_Error value) error,
    required TResult Function(_PermissionDenied value) permissionDenied,
    required TResult Function(_LocationFetched value) locationFetched,
  }) {
    return locationFetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Valid value)? valid,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Verifying value)? verifying,
    TResult? Function(_VerificationSuccess value)? verificationSuccess,
    TResult? Function(_VerificationFailed value)? verificationFailed,
    TResult? Function(_ChangePasswordVisibility value)?
        changePasswordVisibility,
    TResult? Function(_Error value)? error,
    TResult? Function(_PermissionDenied value)? permissionDenied,
    TResult? Function(_LocationFetched value)? locationFetched,
  }) {
    return locationFetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Valid value)? valid,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Verifying value)? verifying,
    TResult Function(_VerificationSuccess value)? verificationSuccess,
    TResult Function(_VerificationFailed value)? verificationFailed,
    TResult Function(_ChangePasswordVisibility value)? changePasswordVisibility,
    TResult Function(_Error value)? error,
    TResult Function(_PermissionDenied value)? permissionDenied,
    TResult Function(_LocationFetched value)? locationFetched,
    required TResult orElse(),
  }) {
    if (locationFetched != null) {
      return locationFetched(this);
    }
    return orElse();
  }
}

abstract class _LocationFetched implements LoginState {
  const factory _LocationFetched(
      final double latitude, final double longitude) = _$LocationFetchedImpl;

  double get latitude;
  double get longitude;
  @JsonKey(ignore: true)
  _$$LocationFetchedImplCopyWith<_$LocationFetchedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
