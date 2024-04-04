import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentit/data/repositories/auth_repository.dart';
import 'package:sentit/data/repositories/message_repository.dart';

part 'chat_list_notifier.g.dart';

@riverpod
Stream<QuerySnapshot> chatList(ChatListRef ref) async* {
  final messageRepository = ref.watch(messageRepositoryProvider);
  final authrepository = ref.watch(authRepositoryProvider);
  final userUid = authrepository.getUserId();
  yield* messageRepository.getUsers().where(
        (data) => data.docs.any((user) {
          return user['uid'] != userUid;
        }),
      );
}

@Riverpod(keepAlive: false)
class SignOutController extends _$SignOutController {
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signOut(),
    );
  }
}
