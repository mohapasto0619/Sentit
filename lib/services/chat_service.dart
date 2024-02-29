import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentit/services/model/message.dart';

part 'chat_service.g.dart';

@Riverpod(keepAlive: true)
ChatService chatService(ChatServiceRef ref) {
  final fireStore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;
  return ChatService(
    fireStore: fireStore,
    firebaseAuth: firebaseAuth,
  );
}

class ChatService {
  ChatService({
    required this.fireStore,
    required this.firebaseAuth,
  });

  final FirebaseFirestore fireStore;
  final FirebaseAuth firebaseAuth;

  Stream<QuerySnapshot> getUsers() {
    return fireStore.collection('users').snapshots();
  }

  Future<void> sendMessage(String receiverId, String message) async {
    final String? currentUserId = firebaseAuth.currentUser?.uid;
    final String? currentUserEmail = firebaseAuth.currentUser?.email;
    final Timestamp timestamp = Timestamp.now();

    final messageInfos = Message(
      senderId: currentUserId!,
      senderEmail: currentUserEmail!,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
    );

    final ids = [currentUserId, receiverId];
    ids.sort();
    final chatRoomId = ids.join('_');

    await fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(messageInfos.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(
      String userId, String otherUserId) {
    final ids = [userId, otherUserId];
    ids.sort();
    final chatRoomId = ids.join('_');

    return fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
