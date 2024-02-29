import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentit/data/repositories/auth_repository.dart';
import 'package:sentit/modules/auth/auth_alert_message.dart';
import 'package:sentit/modules/auth/login/model/login_form.dart';

part 'login_notifier.g.dart';

@Riverpod(keepAlive: false)
class SignInController extends _$SignInController {
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<void> signIn(
    String email,
    String password,
  ) async {
    state = const AsyncValue.loading();
    ref
        .read(signInStatusProvider.notifier)
        .setConnectionMessageError(AuthAlertMessage.none);
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signIn(email, password),
    );
  }
}

@Riverpod(keepAlive: false)
class SignInStatus extends _$SignInStatus {
  @override
  LoginFrom build() {
    return LoginFrom();
  }

  void setUsername(String username) {
    state = state.copyWith(
      username: username,
    );

    isFieldsEmpty();
  }

  void setPassword(String passsword) {
    state = state.copyWith(
      password: passsword,
    );

    isFieldsEmpty();
  }

  void setConnectionMessageError(
    AuthAlertMessage alertMessage,
  ) {
    state = state.copyWith(
      alertMessage: alertMessage,
    );
  }

  void setIsButtonActive({required bool isActive}) {
    state = state.copyWith(
      isButtonActive: isActive,
    );
  }

  bool isError() {
    return state.alertMessage != AuthAlertMessage.none;
  }

  void isFieldsEmpty() {
    setIsButtonActive(
      isActive: state.username.isNotEmpty && state.password.isNotEmpty,
    );
  }

  void setLoading({required bool isLoading}) {
    state = state.copyWith(
      isLoading: isLoading,
    );
  }
}
