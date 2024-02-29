import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  final firebaseAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  return AuthService(
    firebaseAuth: firebaseAuth,
    fireStore: fireStore,
  );
}

class AuthService {
  AuthService({
    required this.firebaseAuth,
    required this.fireStore,
  });

  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore fireStore;

  Future<UserCredential> signIn(
    String email,
    String password,
  ) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  Future<UserCredential> signUp(
    String username,
    String email,
    String password,
  ) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await fireStore.collection('users').doc(userCredential.user?.uid).set(
      {
        'uid': userCredential.user?.uid,
        'username': username,
        'email': email,
      },
    );
    return userCredential;
  }

  String? getUserId() {
    return firebaseAuth.currentUser?.uid;
  }

  bool isAuthenticated() {
    return firebaseAuth.currentUser != null;
  }
}
