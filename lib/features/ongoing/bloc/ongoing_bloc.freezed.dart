// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ongoing_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OngoingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllOrder,
    required TResult Function() getAllOrderWithDetail,
    required TResult Function(String orderId, String newStatus) editOrder,
    required TResult Function(String orderId, String newStatus) cancelOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllOrder,
    TResult? Function()? getAllOrderWithDetail,
    TResult? Function(String orderId, String newStatus)? editOrder,
    TResult? Function(String orderId, String newStatus)? cancelOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllOrder,
    TResult Function()? getAllOrderWithDetail,
    TResult Function(String orderId, String newStatus)? editOrder,
    TResult Function(String orderId, String newStatus)? cancelOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAllOrder value) getAllOrder,
    required TResult Function(_GetAllOrderWithDetail value)
        getAllOrderWithDetail,
    required TResult Function(_EditOrder value) editOrder,
    required TResult Function(_CancelOrder value) cancelOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllOrder value)? getAllOrder,
    TResult? Function(_GetAllOrderWithDetail value)? getAllOrderWithDetail,
    TResult? Function(_EditOrder value)? editOrder,
    TResult? Function(_CancelOrder value)? cancelOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllOrder value)? getAllOrder,
    TResult Function(_GetAllOrderWithDetail value)? getAllOrderWithDetail,
    TResult Function(_EditOrder value)? editOrder,
    TResult Function(_CancelOrder value)? cancelOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OngoingEventCopyWith<$Res> {
  factory $OngoingEventCopyWith(
          OngoingEvent value, $Res Function(OngoingEvent) then) =
      _$OngoingEventCopyWithImpl<$Res, OngoingEvent>;
}

/// @nodoc
class _$OngoingEventCopyWithImpl<$Res, $Val extends OngoingEvent>
    implements $OngoingEventCopyWith<$Res> {
  _$OngoingEventCopyWithImpl(this._value, this._then);

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
    extends _$OngoingEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'OngoingEvent.started()';
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
    required TResult Function() getAllOrder,
    required TResult Function() getAllOrderWithDetail,
    required TResult Function(String orderId, String newStatus) editOrder,
    required TResult Function(String orderId, String newStatus) cancelOrder,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllOrder,
    TResult? Function()? getAllOrderWithDetail,
    TResult? Function(String orderId, String newStatus)? editOrder,
    TResult? Function(String orderId, String newStatus)? cancelOrder,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllOrder,
    TResult Function()? getAllOrderWithDetail,
    TResult Function(String orderId, String newStatus)? editOrder,
    TResult Function(String orderId, String newStatus)? cancelOrder,
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
    required TResult Function(_GetAllOrder value) getAllOrder,
    required TResult Function(_GetAllOrderWithDetail value)
        getAllOrderWithDetail,
    required TResult Function(_EditOrder value) editOrder,
    required TResult Function(_CancelOrder value) cancelOrder,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllOrder value)? getAllOrder,
    TResult? Function(_GetAllOrderWithDetail value)? getAllOrderWithDetail,
    TResult? Function(_EditOrder value)? editOrder,
    TResult? Function(_CancelOrder value)? cancelOrder,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllOrder value)? getAllOrder,
    TResult Function(_GetAllOrderWithDetail value)? getAllOrderWithDetail,
    TResult Function(_EditOrder value)? editOrder,
    TResult Function(_CancelOrder value)? cancelOrder,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements OngoingEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetAllOrderImplCopyWith<$Res> {
  factory _$$GetAllOrderImplCopyWith(
          _$GetAllOrderImpl value, $Res Function(_$GetAllOrderImpl) then) =
      __$$GetAllOrderImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllOrderImplCopyWithImpl<$Res>
    extends _$OngoingEventCopyWithImpl<$Res, _$GetAllOrderImpl>
    implements _$$GetAllOrderImplCopyWith<$Res> {
  __$$GetAllOrderImplCopyWithImpl(
      _$GetAllOrderImpl _value, $Res Function(_$GetAllOrderImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllOrderImpl implements _GetAllOrder {
  const _$GetAllOrderImpl();

  @override
  String toString() {
    return 'OngoingEvent.getAllOrder()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllOrderImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllOrder,
    required TResult Function() getAllOrderWithDetail,
    required TResult Function(String orderId, String newStatus) editOrder,
    required TResult Function(String orderId, String newStatus) cancelOrder,
  }) {
    return getAllOrder();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllOrder,
    TResult? Function()? getAllOrderWithDetail,
    TResult? Function(String orderId, String newStatus)? editOrder,
    TResult? Function(String orderId, String newStatus)? cancelOrder,
  }) {
    return getAllOrder?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllOrder,
    TResult Function()? getAllOrderWithDetail,
    TResult Function(String orderId, String newStatus)? editOrder,
    TResult Function(String orderId, String newStatus)? cancelOrder,
    required TResult orElse(),
  }) {
    if (getAllOrder != null) {
      return getAllOrder();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAllOrder value) getAllOrder,
    required TResult Function(_GetAllOrderWithDetail value)
        getAllOrderWithDetail,
    required TResult Function(_EditOrder value) editOrder,
    required TResult Function(_CancelOrder value) cancelOrder,
  }) {
    return getAllOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllOrder value)? getAllOrder,
    TResult? Function(_GetAllOrderWithDetail value)? getAllOrderWithDetail,
    TResult? Function(_EditOrder value)? editOrder,
    TResult? Function(_CancelOrder value)? cancelOrder,
  }) {
    return getAllOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllOrder value)? getAllOrder,
    TResult Function(_GetAllOrderWithDetail value)? getAllOrderWithDetail,
    TResult Function(_EditOrder value)? editOrder,
    TResult Function(_CancelOrder value)? cancelOrder,
    required TResult orElse(),
  }) {
    if (getAllOrder != null) {
      return getAllOrder(this);
    }
    return orElse();
  }
}

abstract class _GetAllOrder implements OngoingEvent {
  const factory _GetAllOrder() = _$GetAllOrderImpl;
}

/// @nodoc
abstract class _$$GetAllOrderWithDetailImplCopyWith<$Res> {
  factory _$$GetAllOrderWithDetailImplCopyWith(
          _$GetAllOrderWithDetailImpl value,
          $Res Function(_$GetAllOrderWithDetailImpl) then) =
      __$$GetAllOrderWithDetailImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllOrderWithDetailImplCopyWithImpl<$Res>
    extends _$OngoingEventCopyWithImpl<$Res, _$GetAllOrderWithDetailImpl>
    implements _$$GetAllOrderWithDetailImplCopyWith<$Res> {
  __$$GetAllOrderWithDetailImplCopyWithImpl(_$GetAllOrderWithDetailImpl _value,
      $Res Function(_$GetAllOrderWithDetailImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllOrderWithDetailImpl implements _GetAllOrderWithDetail {
  const _$GetAllOrderWithDetailImpl();

  @override
  String toString() {
    return 'OngoingEvent.getAllOrderWithDetail()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllOrderWithDetailImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllOrder,
    required TResult Function() getAllOrderWithDetail,
    required TResult Function(String orderId, String newStatus) editOrder,
    required TResult Function(String orderId, String newStatus) cancelOrder,
  }) {
    return getAllOrderWithDetail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllOrder,
    TResult? Function()? getAllOrderWithDetail,
    TResult? Function(String orderId, String newStatus)? editOrder,
    TResult? Function(String orderId, String newStatus)? cancelOrder,
  }) {
    return getAllOrderWithDetail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllOrder,
    TResult Function()? getAllOrderWithDetail,
    TResult Function(String orderId, String newStatus)? editOrder,
    TResult Function(String orderId, String newStatus)? cancelOrder,
    required TResult orElse(),
  }) {
    if (getAllOrderWithDetail != null) {
      return getAllOrderWithDetail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAllOrder value) getAllOrder,
    required TResult Function(_GetAllOrderWithDetail value)
        getAllOrderWithDetail,
    required TResult Function(_EditOrder value) editOrder,
    required TResult Function(_CancelOrder value) cancelOrder,
  }) {
    return getAllOrderWithDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllOrder value)? getAllOrder,
    TResult? Function(_GetAllOrderWithDetail value)? getAllOrderWithDetail,
    TResult? Function(_EditOrder value)? editOrder,
    TResult? Function(_CancelOrder value)? cancelOrder,
  }) {
    return getAllOrderWithDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllOrder value)? getAllOrder,
    TResult Function(_GetAllOrderWithDetail value)? getAllOrderWithDetail,
    TResult Function(_EditOrder value)? editOrder,
    TResult Function(_CancelOrder value)? cancelOrder,
    required TResult orElse(),
  }) {
    if (getAllOrderWithDetail != null) {
      return getAllOrderWithDetail(this);
    }
    return orElse();
  }
}

abstract class _GetAllOrderWithDetail implements OngoingEvent {
  const factory _GetAllOrderWithDetail() = _$GetAllOrderWithDetailImpl;
}

/// @nodoc
abstract class _$$EditOrderImplCopyWith<$Res> {
  factory _$$EditOrderImplCopyWith(
          _$EditOrderImpl value, $Res Function(_$EditOrderImpl) then) =
      __$$EditOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId, String newStatus});
}

/// @nodoc
class __$$EditOrderImplCopyWithImpl<$Res>
    extends _$OngoingEventCopyWithImpl<$Res, _$EditOrderImpl>
    implements _$$EditOrderImplCopyWith<$Res> {
  __$$EditOrderImplCopyWithImpl(
      _$EditOrderImpl _value, $Res Function(_$EditOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? newStatus = null,
  }) {
    return _then(_$EditOrderImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      newStatus: null == newStatus
          ? _value.newStatus
          : newStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EditOrderImpl implements _EditOrder {
  const _$EditOrderImpl({required this.orderId, required this.newStatus});

  @override
  final String orderId;
  @override
  final String newStatus;

  @override
  String toString() {
    return 'OngoingEvent.editOrder(orderId: $orderId, newStatus: $newStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditOrderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.newStatus, newStatus) ||
                other.newStatus == newStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, newStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditOrderImplCopyWith<_$EditOrderImpl> get copyWith =>
      __$$EditOrderImplCopyWithImpl<_$EditOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllOrder,
    required TResult Function() getAllOrderWithDetail,
    required TResult Function(String orderId, String newStatus) editOrder,
    required TResult Function(String orderId, String newStatus) cancelOrder,
  }) {
    return editOrder(orderId, newStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllOrder,
    TResult? Function()? getAllOrderWithDetail,
    TResult? Function(String orderId, String newStatus)? editOrder,
    TResult? Function(String orderId, String newStatus)? cancelOrder,
  }) {
    return editOrder?.call(orderId, newStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllOrder,
    TResult Function()? getAllOrderWithDetail,
    TResult Function(String orderId, String newStatus)? editOrder,
    TResult Function(String orderId, String newStatus)? cancelOrder,
    required TResult orElse(),
  }) {
    if (editOrder != null) {
      return editOrder(orderId, newStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAllOrder value) getAllOrder,
    required TResult Function(_GetAllOrderWithDetail value)
        getAllOrderWithDetail,
    required TResult Function(_EditOrder value) editOrder,
    required TResult Function(_CancelOrder value) cancelOrder,
  }) {
    return editOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllOrder value)? getAllOrder,
    TResult? Function(_GetAllOrderWithDetail value)? getAllOrderWithDetail,
    TResult? Function(_EditOrder value)? editOrder,
    TResult? Function(_CancelOrder value)? cancelOrder,
  }) {
    return editOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllOrder value)? getAllOrder,
    TResult Function(_GetAllOrderWithDetail value)? getAllOrderWithDetail,
    TResult Function(_EditOrder value)? editOrder,
    TResult Function(_CancelOrder value)? cancelOrder,
    required TResult orElse(),
  }) {
    if (editOrder != null) {
      return editOrder(this);
    }
    return orElse();
  }
}

abstract class _EditOrder implements OngoingEvent {
  const factory _EditOrder(
      {required final String orderId,
      required final String newStatus}) = _$EditOrderImpl;

  String get orderId;
  String get newStatus;
  @JsonKey(ignore: true)
  _$$EditOrderImplCopyWith<_$EditOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelOrderImplCopyWith<$Res> {
  factory _$$CancelOrderImplCopyWith(
          _$CancelOrderImpl value, $Res Function(_$CancelOrderImpl) then) =
      __$$CancelOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId, String newStatus});
}

/// @nodoc
class __$$CancelOrderImplCopyWithImpl<$Res>
    extends _$OngoingEventCopyWithImpl<$Res, _$CancelOrderImpl>
    implements _$$CancelOrderImplCopyWith<$Res> {
  __$$CancelOrderImplCopyWithImpl(
      _$CancelOrderImpl _value, $Res Function(_$CancelOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? newStatus = null,
  }) {
    return _then(_$CancelOrderImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      newStatus: null == newStatus
          ? _value.newStatus
          : newStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CancelOrderImpl implements _CancelOrder {
  const _$CancelOrderImpl({required this.orderId, required this.newStatus});

  @override
  final String orderId;
  @override
  final String newStatus;

  @override
  String toString() {
    return 'OngoingEvent.cancelOrder(orderId: $orderId, newStatus: $newStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelOrderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.newStatus, newStatus) ||
                other.newStatus == newStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, newStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelOrderImplCopyWith<_$CancelOrderImpl> get copyWith =>
      __$$CancelOrderImplCopyWithImpl<_$CancelOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllOrder,
    required TResult Function() getAllOrderWithDetail,
    required TResult Function(String orderId, String newStatus) editOrder,
    required TResult Function(String orderId, String newStatus) cancelOrder,
  }) {
    return cancelOrder(orderId, newStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllOrder,
    TResult? Function()? getAllOrderWithDetail,
    TResult? Function(String orderId, String newStatus)? editOrder,
    TResult? Function(String orderId, String newStatus)? cancelOrder,
  }) {
    return cancelOrder?.call(orderId, newStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllOrder,
    TResult Function()? getAllOrderWithDetail,
    TResult Function(String orderId, String newStatus)? editOrder,
    TResult Function(String orderId, String newStatus)? cancelOrder,
    required TResult orElse(),
  }) {
    if (cancelOrder != null) {
      return cancelOrder(orderId, newStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAllOrder value) getAllOrder,
    required TResult Function(_GetAllOrderWithDetail value)
        getAllOrderWithDetail,
    required TResult Function(_EditOrder value) editOrder,
    required TResult Function(_CancelOrder value) cancelOrder,
  }) {
    return cancelOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllOrder value)? getAllOrder,
    TResult? Function(_GetAllOrderWithDetail value)? getAllOrderWithDetail,
    TResult? Function(_EditOrder value)? editOrder,
    TResult? Function(_CancelOrder value)? cancelOrder,
  }) {
    return cancelOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllOrder value)? getAllOrder,
    TResult Function(_GetAllOrderWithDetail value)? getAllOrderWithDetail,
    TResult Function(_EditOrder value)? editOrder,
    TResult Function(_CancelOrder value)? cancelOrder,
    required TResult orElse(),
  }) {
    if (cancelOrder != null) {
      return cancelOrder(this);
    }
    return orElse();
  }
}

abstract class _CancelOrder implements OngoingEvent {
  const factory _CancelOrder(
      {required final String orderId,
      required final String newStatus}) = _$CancelOrderImpl;

  String get orderId;
  String get newStatus;
  @JsonKey(ignore: true)
  _$$CancelOrderImplCopyWith<_$CancelOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OngoingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String message) error,
    required TResult Function() reset,
    required TResult Function() changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? reset,
    TResult? Function()? changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    TResult Function()? reset,
    TResult Function()? changeStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Reset value) reset,
    required TResult Function(_ChangeStatus value) changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_ChangeStatus value)? changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Reset value)? reset,
    TResult Function(_ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OngoingStateCopyWith<$Res> {
  factory $OngoingStateCopyWith(
          OngoingState value, $Res Function(OngoingState) then) =
      _$OngoingStateCopyWithImpl<$Res, OngoingState>;
}

/// @nodoc
class _$OngoingStateCopyWithImpl<$Res, $Val extends OngoingState>
    implements $OngoingStateCopyWith<$Res> {
  _$OngoingStateCopyWithImpl(this._value, this._then);

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
    extends _$OngoingStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'OngoingState.initial()';
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
    required TResult Function() loaded,
    required TResult Function(String message) error,
    required TResult Function() reset,
    required TResult Function() changeStatus,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? reset,
    TResult? Function()? changeStatus,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    TResult Function()? reset,
    TResult Function()? changeStatus,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Reset value) reset,
    required TResult Function(_ChangeStatus value) changeStatus,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_ChangeStatus value)? changeStatus,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Reset value)? reset,
    TResult Function(_ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OngoingState {
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
    extends _$OngoingStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'OngoingState.loading()';
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
    required TResult Function() loaded,
    required TResult Function(String message) error,
    required TResult Function() reset,
    required TResult Function() changeStatus,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? reset,
    TResult? Function()? changeStatus,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    TResult Function()? reset,
    TResult Function()? changeStatus,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Reset value) reset,
    required TResult Function(_ChangeStatus value) changeStatus,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_ChangeStatus value)? changeStatus,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Reset value)? reset,
    TResult Function(_ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements OngoingState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$OngoingStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl();

  @override
  String toString() {
    return 'OngoingState.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String message) error,
    required TResult Function() reset,
    required TResult Function() changeStatus,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? reset,
    TResult? Function()? changeStatus,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    TResult Function()? reset,
    TResult Function()? changeStatus,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Reset value) reset,
    required TResult Function(_ChangeStatus value) changeStatus,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_ChangeStatus value)? changeStatus,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Reset value)? reset,
    TResult Function(_ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements OngoingState {
  const factory _Loaded() = _$LoadedImpl;
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
    extends _$OngoingStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'OngoingState.error(message: $message)';
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
    required TResult Function() loaded,
    required TResult Function(String message) error,
    required TResult Function() reset,
    required TResult Function() changeStatus,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? reset,
    TResult? Function()? changeStatus,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    TResult Function()? reset,
    TResult Function()? changeStatus,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Reset value) reset,
    required TResult Function(_ChangeStatus value) changeStatus,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_ChangeStatus value)? changeStatus,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Reset value)? reset,
    TResult Function(_ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements OngoingState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$OngoingStateCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetImpl implements _Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'OngoingState.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String message) error,
    required TResult Function() reset,
    required TResult Function() changeStatus,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? reset,
    TResult? Function()? changeStatus,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    TResult Function()? reset,
    TResult Function()? changeStatus,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Reset value) reset,
    required TResult Function(_ChangeStatus value) changeStatus,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_ChangeStatus value)? changeStatus,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Reset value)? reset,
    TResult Function(_ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements OngoingState {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
abstract class _$$ChangeStatusImplCopyWith<$Res> {
  factory _$$ChangeStatusImplCopyWith(
          _$ChangeStatusImpl value, $Res Function(_$ChangeStatusImpl) then) =
      __$$ChangeStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangeStatusImplCopyWithImpl<$Res>
    extends _$OngoingStateCopyWithImpl<$Res, _$ChangeStatusImpl>
    implements _$$ChangeStatusImplCopyWith<$Res> {
  __$$ChangeStatusImplCopyWithImpl(
      _$ChangeStatusImpl _value, $Res Function(_$ChangeStatusImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangeStatusImpl implements _ChangeStatus {
  const _$ChangeStatusImpl();

  @override
  String toString() {
    return 'OngoingState.changeStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChangeStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String message) error,
    required TResult Function() reset,
    required TResult Function() changeStatus,
  }) {
    return changeStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? reset,
    TResult? Function()? changeStatus,
  }) {
    return changeStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    TResult Function()? reset,
    TResult Function()? changeStatus,
    required TResult orElse(),
  }) {
    if (changeStatus != null) {
      return changeStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Reset value) reset,
    required TResult Function(_ChangeStatus value) changeStatus,
  }) {
    return changeStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_ChangeStatus value)? changeStatus,
  }) {
    return changeStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Reset value)? reset,
    TResult Function(_ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (changeStatus != null) {
      return changeStatus(this);
    }
    return orElse();
  }
}

abstract class _ChangeStatus implements OngoingState {
  const factory _ChangeStatus() = _$ChangeStatusImpl;
}
