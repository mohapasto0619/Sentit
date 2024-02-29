import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentit/modules/auth/auth_alert_message.dart';

part 'login_form.freezed.dart';

@freezed
class LoginFrom with _$LoginFrom {
  factory LoginFrom({
    @Default('') String username,
    @Default('') String password,
    @Default(AuthAlertMessage.none) AuthAlertMessage alertMessage,
    @Default(false) bool isButtonActive,
    @Default(false) bool isLoading,
  }) = _LoginFrom;
}
