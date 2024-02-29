// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterFrom {
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  AuthAlertMessage get alertMessage => throw _privateConstructorUsedError;
  bool get isButtonActive => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterFromCopyWith<RegisterFrom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterFromCopyWith<$Res> {
  factory $RegisterFromCopyWith(
          RegisterFrom value, $Res Function(RegisterFrom) then) =
      _$RegisterFromCopyWithImpl<$Res, RegisterFrom>;
  @useResult
  $Res call(
      {String username,
      String email,
      String password,
      AuthAlertMessage alertMessage,
      bool isButtonActive,
      bool isLoading});
}

/// @nodoc
class _$RegisterFromCopyWithImpl<$Res, $Val extends RegisterFrom>
    implements $RegisterFromCopyWith<$Res> {
  _$RegisterFromCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? alertMessage = null,
    Object? isButtonActive = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      alertMessage: null == alertMessage
          ? _value.alertMessage
          : alertMessage // ignore: cast_nullable_to_non_nullable
              as AuthAlertMessage,
      isButtonActive: null == isButtonActive
          ? _value.isButtonActive
          : isButtonActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterFromImplCopyWith<$Res>
    implements $RegisterFromCopyWith<$Res> {
  factory _$$RegisterFromImplCopyWith(
          _$RegisterFromImpl value, $Res Function(_$RegisterFromImpl) then) =
      __$$RegisterFromImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String email,
      String password,
      AuthAlertMessage alertMessage,
      bool isButtonActive,
      bool isLoading});
}

/// @nodoc
class __$$RegisterFromImplCopyWithImpl<$Res>
    extends _$RegisterFromCopyWithImpl<$Res, _$RegisterFromImpl>
    implements _$$RegisterFromImplCopyWith<$Res> {
  __$$RegisterFromImplCopyWithImpl(
      _$RegisterFromImpl _value, $Res Function(_$RegisterFromImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? alertMessage = null,
    Object? isButtonActive = null,
    Object? isLoading = null,
  }) {
    return _then(_$RegisterFromImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      alertMessage: null == alertMessage
          ? _value.alertMessage
          : alertMessage // ignore: cast_nullable_to_non_nullable
              as AuthAlertMessage,
      isButtonActive: null == isButtonActive
          ? _value.isButtonActive
          : isButtonActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RegisterFromImpl implements _RegisterFrom {
  _$RegisterFromImpl(
      {this.username = '',
      this.email = '',
      this.password = '',
      this.alertMessage = AuthAlertMessage.none,
      this.isButtonActive = false,
      this.isLoading = false});

  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final AuthAlertMessage alertMessage;
  @override
  @JsonKey()
  final bool isButtonActive;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'RegisterFrom(username: $username, email: $email, password: $password, alertMessage: $alertMessage, isButtonActive: $isButtonActive, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterFromImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.alertMessage, alertMessage) ||
                other.alertMessage == alertMessage) &&
            (identical(other.isButtonActive, isButtonActive) ||
                other.isButtonActive == isButtonActive) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, email, password,
      alertMessage, isButtonActive, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterFromImplCopyWith<_$RegisterFromImpl> get copyWith =>
      __$$RegisterFromImplCopyWithImpl<_$RegisterFromImpl>(this, _$identity);
}

abstract class _RegisterFrom implements RegisterFrom {
  factory _RegisterFrom(
      {final String username,
      final String email,
      final String password,
      final AuthAlertMessage alertMessage,
      final bool isButtonActive,
      final bool isLoading}) = _$RegisterFromImpl;

  @override
  String get username;
  @override
  String get email;
  @override
  String get password;
  @override
  AuthAlertMessage get alertMessage;
  @override
  bool get isButtonActive;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$RegisterFromImplCopyWith<_$RegisterFromImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
