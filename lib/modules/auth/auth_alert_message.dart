import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum AuthAlertMessage {
  none,
  //login
  invalidCredentials,
  userDisabled,
  //register
  emailAlreadyInUse,
  invalidEmail,
  operationNotAllwoed,
  weakPassword,
  unkown,
}

extension TranslatedMessageExtension on AuthAlertMessage {
  String getErrorMessage({
    required AppLocalizations localizations,
  }) {
    late String errorMessage;
    switch (this) {
      case AuthAlertMessage.invalidCredentials:
        errorMessage = localizations.inavlidCredentialsError;
      case AuthAlertMessage.invalidEmail:
        errorMessage = localizations.invalidEmailError;
      case AuthAlertMessage.weakPassword:
        errorMessage = localizations.weakPasswordError;
      case AuthAlertMessage.emailAlreadyInUse:
        errorMessage = localizations.emailAlreadyInUseError;
      case AuthAlertMessage.userDisabled:
        errorMessage = localizations.userDisabledError;
      case AuthAlertMessage.operationNotAllwoed:
        errorMessage = localizations.operationNotAllwoed;
      default:
        errorMessage = localizations.unkownError;
    }
    return errorMessage;
  }
}

extension ToAuthMessageExtension on FirebaseAuthException {
  AuthAlertMessage toAuthAlertMessage() {
    switch (code) {
      case 'email-already-in-use':
        return AuthAlertMessage.emailAlreadyInUse;
      case 'invalid-email':
        return AuthAlertMessage.invalidEmail;
      case 'operation-not-allowed':
        return AuthAlertMessage.operationNotAllwoed;
      case 'weak-password':
        return AuthAlertMessage.weakPassword;
      case 'wrong-password':
        return AuthAlertMessage.invalidCredentials;
      case 'user-disabled':
        return AuthAlertMessage.userDisabled;
      case 'user-not-found':
        return AuthAlertMessage.invalidCredentials;
      default:
        return AuthAlertMessage.unkown;
    }
  }
}
