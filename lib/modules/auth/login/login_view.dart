import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sentit/core/widgets/app_button.dart';
import 'package:sentit/core/widgets/app_logo_text.dart';
import 'package:sentit/core/widgets/app_text_button.dart';
import 'package:sentit/core/widgets/app_text_input.dart';
import 'package:sentit/core/widgets/error_text_message.dart';
import 'package:sentit/modules/auth/auth_alert_message.dart';
import 'package:sentit/modules/auth/login/login_notifier.dart';
import 'package:sentit/router/app_routes.dart';
import 'package:sentit/theme/app_colors.dart';
import 'package:sentit/theme/app_padding.dart';
import 'package:sentit/theme/app_spacing.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final spacing = ref.watch(spacingThemeProvider);
    final paddings = ref.watch(paddingThemeProvider);
    final colors = ref.watch(appColorThemeProvider);
    final signInStatus = ref.watch(signInStatusProvider);

    ref.listen(
      signInControllerProvider,
      (_, next) {
        next.when(
          data: (isSignedIn) {
            ref.read(signInStatusProvider.notifier).setLoading(
                  isLoading: false,
                );
            if (isSignedIn) {
              context.goNamed(AppRoute.chatList.name);
            }
          },
          error: (error, stackTrace) {
            if (error is FirebaseAuthException) {
              ref
                  .read(signInStatusProvider.notifier)
                  .setConnectionMessageError(error.toAuthAlertMessage());
            } else {
              ref
                  .read(signInStatusProvider.notifier)
                  .setConnectionMessageError(AuthAlertMessage.unkown);
            }
            ref.read(signInStatusProvider.notifier).setLoading(
                  isLoading: false,
                );
          },
          loading: () {
            ref.read(signInStatusProvider.notifier).setLoading(
                  isLoading: true,
                );
          },
        );
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: paddings.lg,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLogo(
                      label: localizations.app,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppTextInput(
                        controller: _emailTextController,
                        title: localizations.username,
                        hintText: localizations.usernameHintText,
                        isError:
                            signInStatus.alertMessage != AuthAlertMessage.none,
                        onChanged: (value) {
                          ref
                              .read(signInStatusProvider.notifier)
                              .setUsername(value);
                        },
                      ),
                      SizedBox(height: spacing.sm),
                      AppTextInput(
                        controller: _passwordTextController,
                        title: localizations.password,
                        hintText: localizations.passwordHintText,
                        isError:
                            signInStatus.alertMessage != AuthAlertMessage.none,
                        isTextObscure: true,
                        onChanged: (value) {
                          ref
                              .read(signInStatusProvider.notifier)
                              .setPassword(value);
                        },
                      ),
                      SizedBox(height: spacing.sm),
                      if (signInStatus.isLoading)
                        Column(
                          children: [
                            CircularProgressIndicator(
                              color: colors.primary,
                            ),
                            SizedBox(height: spacing.sm),
                          ],
                        ),
                      if (signInStatus.alertMessage != AuthAlertMessage.none)
                        Column(
                          children: [
                            ErrorTextMessage(
                              message:
                                  signInStatus.alertMessage.getErrorMessage(
                                localizations: localizations,
                              ),
                            ),
                            SizedBox(height: spacing.sm),
                          ],
                        ),
                      SizedBox(
                        width: double.infinity,
                        child: AppButton(
                          isActive: signInStatus.isButtonActive,
                          onPressed: () {
                            ref.read(signInControllerProvider.notifier).signIn(
                                  signInStatus.username,
                                  signInStatus.password,
                                );
                          },
                          label: localizations.signin,
                        ),
                      ),
                      SizedBox(height: spacing.sm),
                      AppTextButton(
                        label: localizations.toRegisterText,
                        onPressed: () {
                          context.pushNamed(AppRoute.register.name);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
