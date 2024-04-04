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
    final orientation = MediaQuery.of(context).orientation;

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
      body: orientation == Orientation.portrait
          ? RegisterViewBody(
              usernameTextController: _usernameTextController,
              emailTextController: _emailTextController,
              passwordTextController: _passwordTextController,
            )
          : RegisterViewBodyLandscape(
              usernameTextController: _usernameTextController,
              emailTextController: _emailTextController,
              passwordTextController: _passwordTextController,
            ),
    );
  }
}

class RegisterViewBody extends ConsumerWidget {
  const RegisterViewBody({
    super.key,
    required TextEditingController usernameTextController,
    required TextEditingController emailTextController,
    required TextEditingController passwordTextController,
  })  : _usernameTextController = usernameTextController,
        _emailTextController = emailTextController,
        _passwordTextController = passwordTextController;

  final TextEditingController _usernameTextController;
  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final paddings = ref.watch(paddingThemeProvider);
    final spacings = ref.watch(spacingThemeProvider);
    final colors = ref.watch(appColorThemeProvider);
    final size = MediaQuery.of(context).size;
    final signUpStatus = ref.watch(signUpStatusProvider);
    return SafeArea(
      child: Column(
        children: [
          DefaultAppBar(
            screenWidth: size.width,
            onPressed: () {
              context.pop();
            },
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * paddings.lg,
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
                    flex: signUpStatus.alertMessage != AuthAlertMessage.none
                        ? 4
                        : 3,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AppTextInput(
                            controller: _usernameTextController,
                            title: localizations.username,
                            hintText: localizations.usernameHintText,
                            isError: signUpStatus.alertMessage !=
                                AuthAlertMessage.none,
                            onChanged: (value) {
                              ref
                                  .read(signUpStatusProvider.notifier)
                                  .setUsername(value);
                            },
                          ),
                          SizedBox(height: size.height * spacings.sm),
                          AppTextInput(
                            controller: _emailTextController,
                            title: localizations.email,
                            hintText: localizations.emailHintText,
                            isError: signUpStatus.alertMessage !=
                                AuthAlertMessage.none,
                            onChanged: (value) {
                              ref
                                  .read(signUpStatusProvider.notifier)
                                  .setEmail(value);
                            },
                          ),
                          SizedBox(height: size.height * spacings.sm),
                          AppTextInput(
                            controller: _passwordTextController,
                            title: localizations.password,
                            hintText: localizations.passwordHintText,
                            isTextObscure: true,
                            isError: signUpStatus.alertMessage !=
                                AuthAlertMessage.none,
                            onChanged: (value) {
                              ref
                                  .read(signUpStatusProvider.notifier)
                                  .setPassword(value);
                            },
                          ),
                          SizedBox(height: size.height * spacings.sm),
                          if (signUpStatus.isLoading)
                            Column(
                              children: [
                                CircularProgressIndicator(
                                  color: colors.primary,
                                ),
                                SizedBox(height: size.height * spacings.sm),
                              ],
                            ),
                          if (signUpStatus.alertMessage !=
                              AuthAlertMessage.none)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: paddings.base),
                              child: Column(
                                children: [
                                  ErrorTextMessage(
                                    message: signUpStatus.alertMessage
                                        .getErrorMessage(
                                      localizations: localizations,
                                    ),
                                  ),
                                  SizedBox(height: size.height * spacings.sm),
                                ],
                              ),
                            ),
                          SizedBox(
                            width: double.infinity,
                            child: AppButton(
                              isActive: signUpStatus.isButtonActive,
                              onPressed: () {
                                ref
                                    .read(signUpControllerProvider.notifier)
                                    .signUp(
                                      username: signUpStatus.username,
                                      email: signUpStatus.email,
                                      password: signUpStatus.password,
                                    );
                              },
                              label: localizations.register,
                            ),
                          ),
                          SizedBox(height: size.height * spacings.sm),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterViewBodyLandscape extends ConsumerWidget {
  const RegisterViewBodyLandscape({
    super.key,
    required TextEditingController usernameTextController,
    required TextEditingController emailTextController,
    required TextEditingController passwordTextController,
  })  : _usernameTextController = usernameTextController,
        _emailTextController = emailTextController,
        _passwordTextController = passwordTextController;

  final TextEditingController _usernameTextController;
  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final paddings = ref.watch(paddingThemeProvider);
    final spacings = ref.watch(spacingThemeProvider);
    final colors = ref.watch(appColorThemeProvider);
    final size = MediaQuery.of(context).size;
    final signUpStatus = ref.watch(signUpStatusProvider);
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                DefaultAppBar(
                  screenWidth: size.width,
                  onPressed: () {
                    context.pop();
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: size.width * paddings.xl,
                    ),
                    child: Center(
                      child: Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              AppTextInput(
                                controller: _usernameTextController,
                                title: localizations.username,
                                hintText: localizations.usernameHintText,
                                isError: signUpStatus.alertMessage !=
                                    AuthAlertMessage.none,
                                onChanged: (value) {
                                  ref
                                      .read(signUpStatusProvider.notifier)
                                      .setUsername(value);
                                },
                              ),
                              SizedBox(height: size.height * spacings.small),
                              AppTextInput(
                                controller: _emailTextController,
                                title: localizations.email,
                                hintText: localizations.emailHintText,
                                isError: signUpStatus.alertMessage !=
                                    AuthAlertMessage.none,
                                onChanged: (value) {
                                  ref
                                      .read(signUpStatusProvider.notifier)
                                      .setEmail(value);
                                },
                              ),
                              SizedBox(height: size.height * spacings.small),
                              AppTextInput(
                                controller: _passwordTextController,
                                title: localizations.password,
                                hintText: localizations.passwordHintText,
                                isTextObscure: true,
                                isError: signUpStatus.alertMessage !=
                                    AuthAlertMessage.none,
                                onChanged: (value) {
                                  ref
                                      .read(signUpStatusProvider.notifier)
                                      .setPassword(value);
                                },
                              ),
                              SizedBox(height: size.height * spacings.small),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: size.width * paddings.lg),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppLogo(
                    label: localizations.app,
                  ),
                  SizedBox(height: size.height * spacings.medium),
                  if (signUpStatus.isLoading)
                    Column(
                      children: [
                        CircularProgressIndicator(
                          color: colors.primary,
                        ),
                        SizedBox(height: size.height * spacings.medium),
                      ],
                    ),
                  if (signUpStatus.alertMessage != AuthAlertMessage.none)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: paddings.base),
                      child: Column(
                        children: [
                          ErrorTextMessage(
                            message: signUpStatus.alertMessage.getErrorMessage(
                              localizations: localizations,
                            ),
                          ),
                          SizedBox(height: size.height * spacings.medium),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
