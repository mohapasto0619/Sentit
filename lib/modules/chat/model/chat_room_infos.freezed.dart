// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_infos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatRoomInfos {
  String get userId => throw _privateConstructorUsedError;
  String get otherUserId => throw _privateConstructorUsedError;
  String get otherUserEmail => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatRoomInfosCopyWith<ChatRoomInfos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomInfosCopyWith<$Res> {
  factory $ChatRoomInfosCopyWith(
          ChatRoomInfos value, $Res Function(ChatRoomInfos) then) =
      _$ChatRoomInfosCopyWithImpl<$Res, ChatRoomInfos>;
  @useResult
  $Res call({String userId, String otherUserId, String otherUserEmail});
}

/// @nodoc
class _$ChatRoomInfosCopyWithImpl<$Res, $Val extends ChatRoomInfos>
    implements $ChatRoomInfosCopyWith<$Res> {
  _$ChatRoomInfosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? otherUserId = null,
    Object? otherUserEmail = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      otherUserId: null == otherUserId
          ? _value.otherUserId
          : otherUserId // ignore: cast_nullable_to_non_nullable
              as String,
      otherUserEmail: null == otherUserEmail
          ? _value.otherUserEmail
          : otherUserEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatRoomInfosImplCopyWith<$Res>
    implements $ChatRoomInfosCopyWith<$Res> {
  factory _$$ChatRoomInfosImplCopyWith(
          _$ChatRoomInfosImpl value, $Res Function(_$ChatRoomInfosImpl) then) =
      __$$ChatRoomInfosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String otherUserId, String otherUserEmail});
}

/// @nodoc
class __$$ChatRoomInfosImplCopyWithImpl<$Res>
    extends _$ChatRoomInfosCopyWithImpl<$Res, _$ChatRoomInfosImpl>
    implements _$$ChatRoomInfosImplCopyWith<$Res> {
  __$$ChatRoomInfosImplCopyWithImpl(
      _$ChatRoomInfosImpl _value, $Res Function(_$ChatRoomInfosImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? otherUserId = null,
    Object? otherUserEmail = null,
  }) {
    return _then(_$ChatRoomInfosImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      otherUserId: null == otherUserId
          ? _value.otherUserId
          : otherUserId // ignore: cast_nullable_to_non_nullable
              as String,
      otherUserEmail: null == otherUserEmail
          ? _value.otherUserEmail
          : otherUserEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChatRoomInfosImpl implements _ChatRoomInfos {
  _$ChatRoomInfosImpl(
      {this.userId = '', this.otherUserId = '', this.otherUserEmail = ''});

  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String otherUserId;
  @override
  @JsonKey()
  final String otherUserEmail;

  @override
  String toString() {
    return 'ChatRoomInfos(userId: $userId, otherUserId: $otherUserId, otherUserEmail: $otherUserEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomInfosImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.otherUserId, otherUserId) ||
                other.otherUserId == otherUserId) &&
            (identical(other.otherUserEmail, otherUserEmail) ||
                other.otherUserEmail == otherUserEmail));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, otherUserId, otherUserEmail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomInfosImplCopyWith<_$ChatRoomInfosImpl> get copyWith =>
      __$$ChatRoomInfosImplCopyWithImpl<_$ChatRoomInfosImpl>(this, _$identity);
}

abstract class _ChatRoomInfos implements ChatRoomInfos {
  factory _ChatRoomInfos(
      {final String userId,
      final String otherUserId,
      final String otherUserEmail}) = _$ChatRoomInfosImpl;

  @override
  String get userId;
  @override
  String get otherUserId;
  @override
  String get otherUserEmail;
  @override
  @JsonKey(ignore: true)
  _$$ChatRoomInfosImplCopyWith<_$ChatRoomInfosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
