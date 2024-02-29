import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_infos.freezed.dart';

@freezed
class ChatRoomInfos with _$ChatRoomInfos {
  factory ChatRoomInfos({
    @Default('') String userId,
    @Default('') String otherUserId,
    @Default('') String otherUserEmail,
  }) = _ChatRoomInfos;
}
