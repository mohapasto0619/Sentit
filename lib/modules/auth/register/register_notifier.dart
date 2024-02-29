import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentit/data/repositories/auth_repository.dart';
import 'package:sentit/modules/auth/auth_alert_message.dart';
import 'package:sentit/modules/auth/register/model/register_form.dart';

part 'register_notifier.g.dart';

@Riverpod(keepAlive: false)
class SignUpController extends _$SignUpController {
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    ref
        .read(signUpStatusProvider.notifier)
        .setConnectionMessageError(AuthAlertMessage.none);
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signUp(
            username,
            email,
            password,
          ),
    );
  }
}

@Riverpod(keepAlive: false)
class SignUpStatus extends _$SignUpStatus {
  @override
  RegisterFrom build() {
    return RegisterFrom();
  }

  void setUsername(String username) {
    state = state.copyWith(
      username: username,
    );

    isFieldsEmpty();
  }

  void setEmail(String email) {
    state = state.copyWith(
      email: email,
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
      isActive: state.username.isNotEmpty &&
          state.password.isNotEmpty &&
          state.email.isNotEmpty,
    );
  }

  void setLoading({required bool isLoading}) {
    state = state.copyWith(
      isLoading: isLoading,
    );
  }
}
