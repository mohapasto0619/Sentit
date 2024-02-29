import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentit/data/repositories/message_repository.dart';
part 'chat_notifier.g.dart';

@Riverpod(keepAlive: false)
class Messages extends _$Messages {
  @override
  Stream<QuerySnapshot> build(
    String userId,
    String receiverId,
    String receiverUserName,
  ) {
    final messageRepository = ref.watch(messageRepositoryProvider);
    return messageRepository.getMessages(
      userId,
      receiverId,
    );
  }

  Future<void> sendMessage(
    String receiverId,
    String message,
  ) async {
    ref.read(messageRepositoryProvider).sendMessage(receiverId, message);
  }
}

@Riverpod(keepAlive: false)
class InputMessage extends _$InputMessage {
  @override
  String build() {
    return '';
  }

  // ignore: use_setters_to_change_properties
  void setInputmessage(String message) {
    state = message;
  }
}
