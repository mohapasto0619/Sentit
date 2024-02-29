import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentit/services/chat_service.dart';

part 'message_repository.g.dart';

@Riverpod(keepAlive: true)
MessageRepository messageRepository(MessageRepositoryRef ref) {
  final chatService = ref.watch(chatServiceProvider);
  return MessageRepository(
    chatService: chatService,
  );
}

class MessageRepository {
  MessageRepository({
    required this.chatService,
  });

  final ChatService chatService;

  Stream<QuerySnapshot> getUsers() {
    return chatService.getUsers();
  }

  Future<void> sendMessage(
    String receiverId,
    String message,
  ) async {
    await chatService.sendMessage(receiverId, message);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(
    String userId,
    String otherUserId,
  ) {
    return chatService.getMessages(userId, otherUserId);
  }
}
