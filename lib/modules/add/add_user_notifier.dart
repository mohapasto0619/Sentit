import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentit/data/repositories/auth_repository.dart';
import 'package:sentit/data/repositories/message_repository.dart';

part 'add_user_notifier.g.dart';

@riverpod
Stream<QuerySnapshot> userList(UserListRef ref) async* {
  final messageRepository = ref.watch(messageRepositoryProvider);
  final authrepository = ref.watch(authRepositoryProvider);
  final userUid = authrepository.getUserId();
  print('user uid : $userUid');
  yield* messageRepository.getUsers().where(
        (data) => data.docs.any((user) {
          print(user['uid']);
          return user['uid'] != userUid;
        }),
      );
}
