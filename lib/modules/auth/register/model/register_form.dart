import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentit/modules/auth/auth_alert_message.dart';

part 'register_form.freezed.dart';

@freezed
class RegisterFrom with _$RegisterFrom {
  factory RegisterFrom({
    @Default('') String username,
    @Default('') String email,
    @Default('') String password,
    @Default(AuthAlertMessage.none) AuthAlertMessage alertMessage,
    @Default(false) bool isButtonActive,
    @Default(false) bool isLoading,
  }) = _RegisterFrom;
}
