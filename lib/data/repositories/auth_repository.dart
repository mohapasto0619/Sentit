import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentit/data/sources/preferences/preferences.dart';
import 'package:sentit/services/auth_service.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  final authService = ref.watch(authServiceProvider);
  final preferences = ref.watch(preferencesProvider);
  return AuthRepository(
    authService: authService,
    preferences: preferences,
  );
}

class AuthRepository {
  AuthRepository({
    required this.authService,
    required this.preferences,
  });

  final AuthService authService;
  final Preferences preferences;

  Future<bool> signIn(
    String email,
    String password,
  ) async {
    final userCredentials = await authService.signIn(email, password);
    preferences.accessTokenPreferences
        .save(userCredentials.credential?.accessToken);
    return true;
  }

  Future<bool> signUp(
    String username,
    String email,
    String password,
  ) async {
    await authService.signUp(
      username,
      email,
      password,
    );
    return true;
  }

  Future<bool> signOut() async {
    return authService.signOut();
  }

  String? getUserId() {
    return authService.getUserId();
  }

  bool isAuthenticated() {
    return authService.isAuthenticated();
  }
}
