import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sentit/core/widgets/app_button.dart';
import 'package:sentit/core/widgets/app_logo_text.dart';
import 'package:sentit/core/widgets/app_text_input.dart';
import 'package:sentit/core/widgets/default_app_bar.dart';
import 'package:sentit/core/widgets/error_text_message.dart';
import 'package:sentit/modules/auth/auth_alert_message.dart';
import 'package:sentit/modules/auth/register/register_notifier.dart';
import 'package:sentit/router/app_routes.dart';
import 'package:sentit/theme/app_colors.dart';
import 'package:sentit/theme/app_padding.dart';
import 'package:sentit/theme/app_spacing.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  late TextEditingController _usernameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
    _usernameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameTextController.dispose();
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
    final signUpStatus = ref.watch(signUpStatusProvider);

    ref.listen(
      signUpControllerProvider,
      (_, next) {
        next.when(
          data: (isSignedUp) {
            ref.read(signUpStatusProvider.notifier).setLoading(
                  isLoading: false,
                );
            if (isSignedUp) {
              context.goNamed(AppRoute.login.name);
            }
          },
          error: (error, stackTrace) {
            if (error is FirebaseAuthException) {
              ref
                  .read(signUpStatusProvider.notifier)
                  .setConnectionMessageError(error.toAuthAlertMessage());
            } else {
              ref
                  .read(signUpStatusProvider.notifier)
                  .setConnectionMessageError(AuthAlertMessage.unkown);
            }
            ref.read(signUpStatusProvider.notifier).setLoading(
                  isLoading: false,
                );
          },
          loading: () {
            ref.read(signUpStatusProvider.notifier).setLoading(
                  isLoading: true,
                );
          },
        );
      },
    );

    return Scaffold(
      appBar: DefaultAppBar(
        onPressed: () {
          context.pop();
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddings.lg,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLogo(
                      label: localizations.app,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppTextInput(
                      controller: _usernameTextController,
                      title: localizations.username,
                      hintText: localizations.usernameHintText,
                      isError:
                          signUpStatus.alertMessage != AuthAlertMessage.none,
                      onChanged: (value) {
                        ref
                            .read(signUpStatusProvider.notifier)
                            .setUsername(value);
                      },
                    ),
                    SizedBox(height: spacing.sm),
                    AppTextInput(
                      controller: _emailTextController,
                      title: localizations.email,
                      hintText: localizations.emailHintText,
                      isError:
                          signUpStatus.alertMessage != AuthAlertMessage.none,
                      onChanged: (value) {
                        ref.read(signUpStatusProvider.notifier).setEmail(value);
                      },
                    ),
                    SizedBox(height: spacing.sm),
                    AppTextInput(
                      controller: _passwordTextController,
                      title: localizations.password,
                      hintText: localizations.passwordHintText,
                      isTextObscure: true,
                      isError:
                          signUpStatus.alertMessage != AuthAlertMessage.none,
                      onChanged: (value) {
                        ref
                            .read(signUpStatusProvider.notifier)
                            .setPassword(value);
                      },
                    ),
                    SizedBox(height: spacing.sm),
                    if (signUpStatus.isLoading)
                      Column(
                        children: [
                          CircularProgressIndicator(
                            color: colors.primary,
                          ),
                          SizedBox(height: spacing.sm),
                        ],
                      ),
                    if (signUpStatus.alertMessage != AuthAlertMessage.none)
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: paddings.base),
                        child: Column(
                          children: [
                            ErrorTextMessage(
                              message:
                                  signUpStatus.alertMessage.getErrorMessage(
                                localizations: localizations,
                              ),
                            ),
                            SizedBox(height: spacing.sm),
                          ],
                        ),
                      ),
                    SizedBox(
                      width: double.infinity,
                      child: AppButton(
                        isActive: signUpStatus.isButtonActive,
                        onPressed: () {
                          ref.read(signUpControllerProvider.notifier).signUp(
                                username: signUpStatus.username,
                                email: signUpStatus.email,
                                password: signUpStatus.password,
                              );
                        },
                        label: localizations.register,
                      ),
                    ),
                    SizedBox(height: spacing.sm),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
