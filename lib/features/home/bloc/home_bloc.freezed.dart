// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOrder,
    required TResult Function() getTotalCount,
    required TResult Function() toggleExpanded,
    required TResult Function(DateFilterOption option) changeFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOrder,
    TResult? Function()? getTotalCount,
    TResult? Function()? toggleExpanded,
    TResult? Function(DateFilterOption option)? changeFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOrder,
    TResult Function()? getTotalCount,
    TResult Function()? toggleExpanded,
    TResult Function(DateFilterOption option)? changeFilter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetOrder value) getOrder,
    required TResult Function(_GetTotalCount value) getTotalCount,
    required TResult Function(_ToggleExpanded value) toggleExpanded,
    required TResult Function(_ChangeFilter value) changeFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetOrder value)? getOrder,
    TResult? Function(_GetTotalCount value)? getTotalCount,
    TResult? Function(_ToggleExpanded value)? toggleExpanded,
    TResult? Function(_ChangeFilter value)? changeFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetOrder value)? getOrder,
    TResult Function(_GetTotalCount value)? getTotalCount,
    TResult Function(_ToggleExpanded value)? toggleExpanded,
    TResult Function(_ChangeFilter value)? changeFilter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

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
    extends _$HomeEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'HomeEvent.started()';
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
    required TResult Function() getOrder,
    required TResult Function() getTotalCount,
    required TResult Function() toggleExpanded,
    required TResult Function(DateFilterOption option) changeFilter,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOrder,
    TResult? Function()? getTotalCount,
    TResult? Function()? toggleExpanded,
    TResult? Function(DateFilterOption option)? changeFilter,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOrder,
    TResult Function()? getTotalCount,
    TResult Function()? toggleExpanded,
    TResult Function(DateFilterOption option)? changeFilter,
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
    required TResult Function(_GetOrder value) getOrder,
    required TResult Function(_GetTotalCount value) getTotalCount,
    required TResult Function(_ToggleExpanded value) toggleExpanded,
    required TResult Function(_ChangeFilter value) changeFilter,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetOrder value)? getOrder,
    TResult? Function(_GetTotalCount value)? getTotalCount,
    TResult? Function(_ToggleExpanded value)? toggleExpanded,
    TResult? Function(_ChangeFilter value)? changeFilter,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetOrder value)? getOrder,
    TResult Function(_GetTotalCount value)? getTotalCount,
    TResult Function(_ToggleExpanded value)? toggleExpanded,
    TResult Function(_ChangeFilter value)? changeFilter,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements HomeEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetOrderImplCopyWith<$Res> {
  factory _$$GetOrderImplCopyWith(
          _$GetOrderImpl value, $Res Function(_$GetOrderImpl) then) =
      __$$GetOrderImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetOrderImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetOrderImpl>
    implements _$$GetOrderImplCopyWith<$Res> {
  __$$GetOrderImplCopyWithImpl(
      _$GetOrderImpl _value, $Res Function(_$GetOrderImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetOrderImpl implements _GetOrder {
  const _$GetOrderImpl();

  @override
  String toString() {
    return 'HomeEvent.getOrder()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetOrderImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOrder,
    required TResult Function() getTotalCount,
    required TResult Function() toggleExpanded,
    required TResult Function(DateFilterOption option) changeFilter,
  }) {
    return getOrder();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOrder,
    TResult? Function()? getTotalCount,
    TResult? Function()? toggleExpanded,
    TResult? Function(DateFilterOption option)? changeFilter,
  }) {
    return getOrder?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOrder,
    TResult Function()? getTotalCount,
    TResult Function()? toggleExpanded,
    TResult Function(DateFilterOption option)? changeFilter,
    required TResult orElse(),
  }) {
    if (getOrder != null) {
      return getOrder();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetOrder value) getOrder,
    required TResult Function(_GetTotalCount value) getTotalCount,
    required TResult Function(_ToggleExpanded value) toggleExpanded,
    required TResult Function(_ChangeFilter value) changeFilter,
  }) {
    return getOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetOrder value)? getOrder,
    TResult? Function(_GetTotalCount value)? getTotalCount,
    TResult? Function(_ToggleExpanded value)? toggleExpanded,
    TResult? Function(_ChangeFilter value)? changeFilter,
  }) {
    return getOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetOrder value)? getOrder,
    TResult Function(_GetTotalCount value)? getTotalCount,
    TResult Function(_ToggleExpanded value)? toggleExpanded,
    TResult Function(_ChangeFilter value)? changeFilter,
    required TResult orElse(),
  }) {
    if (getOrder != null) {
      return getOrder(this);
    }
    return orElse();
  }
}

abstract class _GetOrder implements HomeEvent {
  const factory _GetOrder() = _$GetOrderImpl;
}

/// @nodoc
abstract class _$$GetTotalCountImplCopyWith<$Res> {
  factory _$$GetTotalCountImplCopyWith(
          _$GetTotalCountImpl value, $Res Function(_$GetTotalCountImpl) then) =
      __$$GetTotalCountImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetTotalCountImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetTotalCountImpl>
    implements _$$GetTotalCountImplCopyWith<$Res> {
  __$$GetTotalCountImplCopyWithImpl(
      _$GetTotalCountImpl _value, $Res Function(_$GetTotalCountImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetTotalCountImpl implements _GetTotalCount {
  const _$GetTotalCountImpl();

  @override
  String toString() {
    return 'HomeEvent.getTotalCount()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetTotalCountImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOrder,
    required TResult Function() getTotalCount,
    required TResult Function() toggleExpanded,
    required TResult Function(DateFilterOption option) changeFilter,
  }) {
    return getTotalCount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOrder,
    TResult? Function()? getTotalCount,
    TResult? Function()? toggleExpanded,
    TResult? Function(DateFilterOption option)? changeFilter,
  }) {
    return getTotalCount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOrder,
    TResult Function()? getTotalCount,
    TResult Function()? toggleExpanded,
    TResult Function(DateFilterOption option)? changeFilter,
    required TResult orElse(),
  }) {
    if (getTotalCount != null) {
      return getTotalCount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetOrder value) getOrder,
    required TResult Function(_GetTotalCount value) getTotalCount,
    required TResult Function(_ToggleExpanded value) toggleExpanded,
    required TResult Function(_ChangeFilter value) changeFilter,
  }) {
    return getTotalCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetOrder value)? getOrder,
    TResult? Function(_GetTotalCount value)? getTotalCount,
    TResult? Function(_ToggleExpanded value)? toggleExpanded,
    TResult? Function(_ChangeFilter value)? changeFilter,
  }) {
    return getTotalCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetOrder value)? getOrder,
    TResult Function(_GetTotalCount value)? getTotalCount,
    TResult Function(_ToggleExpanded value)? toggleExpanded,
    TResult Function(_ChangeFilter value)? changeFilter,
    required TResult orElse(),
  }) {
    if (getTotalCount != null) {
      return getTotalCount(this);
    }
    return orElse();
  }
}

abstract class _GetTotalCount implements HomeEvent {
  const factory _GetTotalCount() = _$GetTotalCountImpl;
}

/// @nodoc
abstract class _$$ToggleExpandedImplCopyWith<$Res> {
  factory _$$ToggleExpandedImplCopyWith(_$ToggleExpandedImpl value,
          $Res Function(_$ToggleExpandedImpl) then) =
      __$$ToggleExpandedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleExpandedImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$ToggleExpandedImpl>
    implements _$$ToggleExpandedImplCopyWith<$Res> {
  __$$ToggleExpandedImplCopyWithImpl(
      _$ToggleExpandedImpl _value, $Res Function(_$ToggleExpandedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleExpandedImpl implements _ToggleExpanded {
  const _$ToggleExpandedImpl();

  @override
  String toString() {
    return 'HomeEvent.toggleExpanded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleExpandedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOrder,
    required TResult Function() getTotalCount,
    required TResult Function() toggleExpanded,
    required TResult Function(DateFilterOption option) changeFilter,
  }) {
    return toggleExpanded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOrder,
    TResult? Function()? getTotalCount,
    TResult? Function()? toggleExpanded,
    TResult? Function(DateFilterOption option)? changeFilter,
  }) {
    return toggleExpanded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOrder,
    TResult Function()? getTotalCount,
    TResult Function()? toggleExpanded,
    TResult Function(DateFilterOption option)? changeFilter,
    required TResult orElse(),
  }) {
    if (toggleExpanded != null) {
      return toggleExpanded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetOrder value) getOrder,
    required TResult Function(_GetTotalCount value) getTotalCount,
    required TResult Function(_ToggleExpanded value) toggleExpanded,
    required TResult Function(_ChangeFilter value) changeFilter,
  }) {
    return toggleExpanded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetOrder value)? getOrder,
    TResult? Function(_GetTotalCount value)? getTotalCount,
    TResult? Function(_ToggleExpanded value)? toggleExpanded,
    TResult? Function(_ChangeFilter value)? changeFilter,
  }) {
    return toggleExpanded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetOrder value)? getOrder,
    TResult Function(_GetTotalCount value)? getTotalCount,
    TResult Function(_ToggleExpanded value)? toggleExpanded,
    TResult Function(_ChangeFilter value)? changeFilter,
    required TResult orElse(),
  }) {
    if (toggleExpanded != null) {
      return toggleExpanded(this);
    }
    return orElse();
  }
}

abstract class _ToggleExpanded implements HomeEvent {
  const factory _ToggleExpanded() = _$ToggleExpandedImpl;
}

/// @nodoc
abstract class _$$ChangeFilterImplCopyWith<$Res> {
  factory _$$ChangeFilterImplCopyWith(
          _$ChangeFilterImpl value, $Res Function(_$ChangeFilterImpl) then) =
      __$$ChangeFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateFilterOption option});
}

/// @nodoc
class __$$ChangeFilterImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$ChangeFilterImpl>
    implements _$$ChangeFilterImplCopyWith<$Res> {
  __$$ChangeFilterImplCopyWithImpl(
      _$ChangeFilterImpl _value, $Res Function(_$ChangeFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? option = null,
  }) {
    return _then(_$ChangeFilterImpl(
      null == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as DateFilterOption,
    ));
  }
}

/// @nodoc

class _$ChangeFilterImpl implements _ChangeFilter {
  const _$ChangeFilterImpl(this.option);

  @override
  final DateFilterOption option;

  @override
  String toString() {
    return 'HomeEvent.changeFilter(option: $option)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeFilterImpl &&
            (identical(other.option, option) || other.option == option));
  }

  @override
  int get hashCode => Object.hash(runtimeType, option);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeFilterImplCopyWith<_$ChangeFilterImpl> get copyWith =>
      __$$ChangeFilterImplCopyWithImpl<_$ChangeFilterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOrder,
    required TResult Function() getTotalCount,
    required TResult Function() toggleExpanded,
    required TResult Function(DateFilterOption option) changeFilter,
  }) {
    return changeFilter(option);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOrder,
    TResult? Function()? getTotalCount,
    TResult? Function()? toggleExpanded,
    TResult? Function(DateFilterOption option)? changeFilter,
  }) {
    return changeFilter?.call(option);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOrder,
    TResult Function()? getTotalCount,
    TResult Function()? toggleExpanded,
    TResult Function(DateFilterOption option)? changeFilter,
    required TResult orElse(),
  }) {
    if (changeFilter != null) {
      return changeFilter(option);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetOrder value) getOrder,
    required TResult Function(_GetTotalCount value) getTotalCount,
    required TResult Function(_ToggleExpanded value) toggleExpanded,
    required TResult Function(_ChangeFilter value) changeFilter,
  }) {
    return changeFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetOrder value)? getOrder,
    TResult? Function(_GetTotalCount value)? getTotalCount,
    TResult? Function(_ToggleExpanded value)? toggleExpanded,
    TResult? Function(_ChangeFilter value)? changeFilter,
  }) {
    return changeFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetOrder value)? getOrder,
    TResult Function(_GetTotalCount value)? getTotalCount,
    TResult Function(_ToggleExpanded value)? toggleExpanded,
    TResult Function(_ChangeFilter value)? changeFilter,
    required TResult orElse(),
  }) {
    if (changeFilter != null) {
      return changeFilter(this);
    }
    return orElse();
  }
}

abstract class _ChangeFilter implements HomeEvent {
  const factory _ChangeFilter(final DateFilterOption option) =
      _$ChangeFilterImpl;

  DateFilterOption get option;
  @JsonKey(ignore: true)
  _$$ChangeFilterImplCopyWith<_$ChangeFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function(String message) error,
    required TResult Function() loadingTotalCount,
    required TResult Function() loadedTotalCount,
    required TResult Function() checkToggleExpanded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function(String message)? error,
    TResult? Function()? loadingTotalCount,
    TResult? Function()? loadedTotalCount,
    TResult? Function()? checkToggleExpanded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function(String message)? error,
    TResult Function()? loadingTotalCount,
    TResult Function()? loadedTotalCount,
    TResult Function()? checkToggleExpanded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Error value) error,
    required TResult Function(_LoadingTotalCount value) loadingTotalCount,
    required TResult Function(_LoadedTotalCount value) loadedTotalCount,
    required TResult Function(_CheckToggleExpanded value) checkToggleExpanded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Error value)? error,
    TResult? Function(_LoadingTotalCount value)? loadingTotalCount,
    TResult? Function(_LoadedTotalCount value)? loadedTotalCount,
    TResult? Function(_CheckToggleExpanded value)? checkToggleExpanded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Error value)? error,
    TResult Function(_LoadingTotalCount value)? loadingTotalCount,
    TResult Function(_LoadedTotalCount value)? loadedTotalCount,
    TResult Function(_CheckToggleExpanded value)? checkToggleExpanded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

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
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'HomeState.initial()';
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
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function(String message) error,
    required TResult Function() loadingTotalCount,
    required TResult Function() loadedTotalCount,
    required TResult Function() checkToggleExpanded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function(String message)? error,
    TResult? Function()? loadingTotalCount,
    TResult? Function()? loadedTotalCount,
    TResult? Function()? checkToggleExpanded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function(String message)? error,
    TResult Function()? loadingTotalCount,
    TResult Function()? loadedTotalCount,
    TResult Function()? checkToggleExpanded,
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
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Error value) error,
    required TResult Function(_LoadingTotalCount value) loadingTotalCount,
    required TResult Function(_LoadedTotalCount value) loadedTotalCount,
    required TResult Function(_CheckToggleExpanded value) checkToggleExpanded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Error value)? error,
    TResult? Function(_LoadingTotalCount value)? loadingTotalCount,
    TResult? Function(_LoadedTotalCount value)? loadedTotalCount,
    TResult? Function(_CheckToggleExpanded value)? checkToggleExpanded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Error value)? error,
    TResult Function(_LoadingTotalCount value)? loadingTotalCount,
    TResult Function(_LoadedTotalCount value)? loadedTotalCount,
    TResult Function(_CheckToggleExpanded value)? checkToggleExpanded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
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
    extends _$HomeStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'HomeState.loading()';
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
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function(String message) error,
    required TResult Function() loadingTotalCount,
    required TResult Function() loadedTotalCount,
    required TResult Function() checkToggleExpanded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function(String message)? error,
    TResult? Function()? loadingTotalCount,
    TResult? Function()? loadedTotalCount,
    TResult? Function()? checkToggleExpanded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function(String message)? error,
    TResult Function()? loadingTotalCount,
    TResult Function()? loadedTotalCount,
    TResult Function()? checkToggleExpanded,
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
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Error value) error,
    required TResult Function(_LoadingTotalCount value) loadingTotalCount,
    required TResult Function(_LoadedTotalCount value) loadedTotalCount,
    required TResult Function(_CheckToggleExpanded value) checkToggleExpanded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Error value)? error,
    TResult? Function(_LoadingTotalCount value)? loadingTotalCount,
    TResult? Function(_LoadedTotalCount value)? loadedTotalCount,
    TResult? Function(_CheckToggleExpanded value)? checkToggleExpanded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Error value)? error,
    TResult Function(_LoadingTotalCount value)? loadingTotalCount,
    TResult Function(_LoadedTotalCount value)? loadedTotalCount,
    TResult Function(_CheckToggleExpanded value)? checkToggleExpanded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements HomeState {
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
    extends _$HomeStateCopyWithImpl<$Res, _$LoadedImpl>
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
    return 'HomeState.loaded()';
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
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function(String message) error,
    required TResult Function() loadingTotalCount,
    required TResult Function() loadedTotalCount,
    required TResult Function() checkToggleExpanded,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function(String message)? error,
    TResult? Function()? loadingTotalCount,
    TResult? Function()? loadedTotalCount,
    TResult? Function()? checkToggleExpanded,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function(String message)? error,
    TResult Function()? loadingTotalCount,
    TResult Function()? loadedTotalCount,
    TResult Function()? checkToggleExpanded,
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
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Error value) error,
    required TResult Function(_LoadingTotalCount value) loadingTotalCount,
    required TResult Function(_LoadedTotalCount value) loadedTotalCount,
    required TResult Function(_CheckToggleExpanded value) checkToggleExpanded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Error value)? error,
    TResult? Function(_LoadingTotalCount value)? loadingTotalCount,
    TResult? Function(_LoadedTotalCount value)? loadedTotalCount,
    TResult? Function(_CheckToggleExpanded value)? checkToggleExpanded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Error value)? error,
    TResult Function(_LoadingTotalCount value)? loadingTotalCount,
    TResult Function(_LoadedTotalCount value)? loadedTotalCount,
    TResult Function(_CheckToggleExpanded value)? checkToggleExpanded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements HomeState {
  const factory _Loaded() = _$LoadedImpl;
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
    extends _$HomeStateCopyWithImpl<$Res, _$InvalidImpl>
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
    return 'HomeState.invalid(message: $message, isCloseLoading: $isCloseLoading)';
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
    required TResult Function() loaded,
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function(String message) error,
    required TResult Function() loadingTotalCount,
    required TResult Function() loadedTotalCount,
    required TResult Function() checkToggleExpanded,
  }) {
    return invalid(message, isCloseLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function(String message)? error,
    TResult? Function()? loadingTotalCount,
    TResult? Function()? loadedTotalCount,
    TResult? Function()? checkToggleExpanded,
  }) {
    return invalid?.call(message, isCloseLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function(String message)? error,
    TResult Function()? loadingTotalCount,
    TResult Function()? loadedTotalCount,
    TResult Function()? checkToggleExpanded,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Error value) error,
    required TResult Function(_LoadingTotalCount value) loadingTotalCount,
    required TResult Function(_LoadedTotalCount value) loadedTotalCount,
    required TResult Function(_CheckToggleExpanded value) checkToggleExpanded,
  }) {
    return invalid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Error value)? error,
    TResult? Function(_LoadingTotalCount value)? loadingTotalCount,
    TResult? Function(_LoadedTotalCount value)? loadedTotalCount,
    TResult? Function(_CheckToggleExpanded value)? checkToggleExpanded,
  }) {
    return invalid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Error value)? error,
    TResult Function(_LoadingTotalCount value)? loadingTotalCount,
    TResult Function(_LoadedTotalCount value)? loadedTotalCount,
    TResult Function(_CheckToggleExpanded value)? checkToggleExpanded,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(this);
    }
    return orElse();
  }
}

abstract class _Invalid implements HomeState {
  const factory _Invalid({final String? message, final bool isCloseLoading}) =
      _$InvalidImpl;

  String? get message;
  bool get isCloseLoading;
  @JsonKey(ignore: true)
  _$$InvalidImplCopyWith<_$InvalidImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$HomeStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'HomeState.error(message: $message)';
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
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function(String message) error,
    required TResult Function() loadingTotalCount,
    required TResult Function() loadedTotalCount,
    required TResult Function() checkToggleExpanded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function(String message)? error,
    TResult? Function()? loadingTotalCount,
    TResult? Function()? loadedTotalCount,
    TResult? Function()? checkToggleExpanded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function(String message)? error,
    TResult Function()? loadingTotalCount,
    TResult Function()? loadedTotalCount,
    TResult Function()? checkToggleExpanded,
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
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Error value) error,
    required TResult Function(_LoadingTotalCount value) loadingTotalCount,
    required TResult Function(_LoadedTotalCount value) loadedTotalCount,
    required TResult Function(_CheckToggleExpanded value) checkToggleExpanded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Error value)? error,
    TResult? Function(_LoadingTotalCount value)? loadingTotalCount,
    TResult? Function(_LoadedTotalCount value)? loadedTotalCount,
    TResult? Function(_CheckToggleExpanded value)? checkToggleExpanded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Error value)? error,
    TResult Function(_LoadingTotalCount value)? loadingTotalCount,
    TResult Function(_LoadedTotalCount value)? loadedTotalCount,
    TResult Function(_CheckToggleExpanded value)? checkToggleExpanded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements HomeState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingTotalCountImplCopyWith<$Res> {
  factory _$$LoadingTotalCountImplCopyWith(_$LoadingTotalCountImpl value,
          $Res Function(_$LoadingTotalCountImpl) then) =
      __$$LoadingTotalCountImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingTotalCountImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$LoadingTotalCountImpl>
    implements _$$LoadingTotalCountImplCopyWith<$Res> {
  __$$LoadingTotalCountImplCopyWithImpl(_$LoadingTotalCountImpl _value,
      $Res Function(_$LoadingTotalCountImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingTotalCountImpl implements _LoadingTotalCount {
  const _$LoadingTotalCountImpl();

  @override
  String toString() {
    return 'HomeState.loadingTotalCount()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingTotalCountImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function(String message) error,
    required TResult Function() loadingTotalCount,
    required TResult Function() loadedTotalCount,
    required TResult Function() checkToggleExpanded,
  }) {
    return loadingTotalCount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function(String message)? error,
    TResult? Function()? loadingTotalCount,
    TResult? Function()? loadedTotalCount,
    TResult? Function()? checkToggleExpanded,
  }) {
    return loadingTotalCount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function(String message)? error,
    TResult Function()? loadingTotalCount,
    TResult Function()? loadedTotalCount,
    TResult Function()? checkToggleExpanded,
    required TResult orElse(),
  }) {
    if (loadingTotalCount != null) {
      return loadingTotalCount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Error value) error,
    required TResult Function(_LoadingTotalCount value) loadingTotalCount,
    required TResult Function(_LoadedTotalCount value) loadedTotalCount,
    required TResult Function(_CheckToggleExpanded value) checkToggleExpanded,
  }) {
    return loadingTotalCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Error value)? error,
    TResult? Function(_LoadingTotalCount value)? loadingTotalCount,
    TResult? Function(_LoadedTotalCount value)? loadedTotalCount,
    TResult? Function(_CheckToggleExpanded value)? checkToggleExpanded,
  }) {
    return loadingTotalCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Error value)? error,
    TResult Function(_LoadingTotalCount value)? loadingTotalCount,
    TResult Function(_LoadedTotalCount value)? loadedTotalCount,
    TResult Function(_CheckToggleExpanded value)? checkToggleExpanded,
    required TResult orElse(),
  }) {
    if (loadingTotalCount != null) {
      return loadingTotalCount(this);
    }
    return orElse();
  }
}

abstract class _LoadingTotalCount implements HomeState {
  const factory _LoadingTotalCount() = _$LoadingTotalCountImpl;
}

/// @nodoc
abstract class _$$LoadedTotalCountImplCopyWith<$Res> {
  factory _$$LoadedTotalCountImplCopyWith(_$LoadedTotalCountImpl value,
          $Res Function(_$LoadedTotalCountImpl) then) =
      __$$LoadedTotalCountImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadedTotalCountImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$LoadedTotalCountImpl>
    implements _$$LoadedTotalCountImplCopyWith<$Res> {
  __$$LoadedTotalCountImplCopyWithImpl(_$LoadedTotalCountImpl _value,
      $Res Function(_$LoadedTotalCountImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadedTotalCountImpl implements _LoadedTotalCount {
  const _$LoadedTotalCountImpl();

  @override
  String toString() {
    return 'HomeState.loadedTotalCount()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadedTotalCountImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function(String message) error,
    required TResult Function() loadingTotalCount,
    required TResult Function() loadedTotalCount,
    required TResult Function() checkToggleExpanded,
  }) {
    return loadedTotalCount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function(String message)? error,
    TResult? Function()? loadingTotalCount,
    TResult? Function()? loadedTotalCount,
    TResult? Function()? checkToggleExpanded,
  }) {
    return loadedTotalCount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function(String message)? error,
    TResult Function()? loadingTotalCount,
    TResult Function()? loadedTotalCount,
    TResult Function()? checkToggleExpanded,
    required TResult orElse(),
  }) {
    if (loadedTotalCount != null) {
      return loadedTotalCount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Error value) error,
    required TResult Function(_LoadingTotalCount value) loadingTotalCount,
    required TResult Function(_LoadedTotalCount value) loadedTotalCount,
    required TResult Function(_CheckToggleExpanded value) checkToggleExpanded,
  }) {
    return loadedTotalCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Error value)? error,
    TResult? Function(_LoadingTotalCount value)? loadingTotalCount,
    TResult? Function(_LoadedTotalCount value)? loadedTotalCount,
    TResult? Function(_CheckToggleExpanded value)? checkToggleExpanded,
  }) {
    return loadedTotalCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Error value)? error,
    TResult Function(_LoadingTotalCount value)? loadingTotalCount,
    TResult Function(_LoadedTotalCount value)? loadedTotalCount,
    TResult Function(_CheckToggleExpanded value)? checkToggleExpanded,
    required TResult orElse(),
  }) {
    if (loadedTotalCount != null) {
      return loadedTotalCount(this);
    }
    return orElse();
  }
}

abstract class _LoadedTotalCount implements HomeState {
  const factory _LoadedTotalCount() = _$LoadedTotalCountImpl;
}

/// @nodoc
abstract class _$$CheckToggleExpandedImplCopyWith<$Res> {
  factory _$$CheckToggleExpandedImplCopyWith(_$CheckToggleExpandedImpl value,
          $Res Function(_$CheckToggleExpandedImpl) then) =
      __$$CheckToggleExpandedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckToggleExpandedImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$CheckToggleExpandedImpl>
    implements _$$CheckToggleExpandedImplCopyWith<$Res> {
  __$$CheckToggleExpandedImplCopyWithImpl(_$CheckToggleExpandedImpl _value,
      $Res Function(_$CheckToggleExpandedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckToggleExpandedImpl implements _CheckToggleExpanded {
  const _$CheckToggleExpandedImpl();

  @override
  String toString() {
    return 'HomeState.checkToggleExpanded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckToggleExpandedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String? message, bool isCloseLoading) invalid,
    required TResult Function(String message) error,
    required TResult Function() loadingTotalCount,
    required TResult Function() loadedTotalCount,
    required TResult Function() checkToggleExpanded,
  }) {
    return checkToggleExpanded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String? message, bool isCloseLoading)? invalid,
    TResult? Function(String message)? error,
    TResult? Function()? loadingTotalCount,
    TResult? Function()? loadedTotalCount,
    TResult? Function()? checkToggleExpanded,
  }) {
    return checkToggleExpanded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String? message, bool isCloseLoading)? invalid,
    TResult Function(String message)? error,
    TResult Function()? loadingTotalCount,
    TResult Function()? loadedTotalCount,
    TResult Function()? checkToggleExpanded,
    required TResult orElse(),
  }) {
    if (checkToggleExpanded != null) {
      return checkToggleExpanded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Error value) error,
    required TResult Function(_LoadingTotalCount value) loadingTotalCount,
    required TResult Function(_LoadedTotalCount value) loadedTotalCount,
    required TResult Function(_CheckToggleExpanded value) checkToggleExpanded,
  }) {
    return checkToggleExpanded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Error value)? error,
    TResult? Function(_LoadingTotalCount value)? loadingTotalCount,
    TResult? Function(_LoadedTotalCount value)? loadedTotalCount,
    TResult? Function(_CheckToggleExpanded value)? checkToggleExpanded,
  }) {
    return checkToggleExpanded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Error value)? error,
    TResult Function(_LoadingTotalCount value)? loadingTotalCount,
    TResult Function(_LoadedTotalCount value)? loadedTotalCount,
    TResult Function(_CheckToggleExpanded value)? checkToggleExpanded,
    required TResult orElse(),
  }) {
    if (checkToggleExpanded != null) {
      return checkToggleExpanded(this);
    }
    return orElse();
  }
}

abstract class _CheckToggleExpanded implements HomeState {
  const factory _CheckToggleExpanded() = _$CheckToggleExpandedImpl;
}
