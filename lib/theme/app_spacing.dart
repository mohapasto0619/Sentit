import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_spacing.g.dart';
part 'app_spacing.freezed.dart';

/// The AppRadiusTheme of the app.
/// It will be created directly here.
@Riverpod(keepAlive: true)
AppSpacingTheme spacingTheme(SpacingThemeRef ref) {
  return AppSpacingTheme.regular();
}

@freezed
class AppSpacingTheme with _$AppSpacingTheme {
  const factory AppSpacingTheme({
    required double xxs,
    required double xs,
    required double ms,
    required double small,
    required double sm,
    required double medium,
    required double large,
    required double xl,
    required double xxl,
    required double xxxl,
    required double xxxxl,
  }) = _AppSpacingTheme;

  factory AppSpacingTheme.regular() => const AppSpacingTheme(
        xxs: 0.005,
        xs: 0.01,
        ms: 0.02,
        small: 0.03,
        sm: 0.04,
        medium: 0.045,
        large: 0.055,
        xl: 0.065,
        xxl: 0.075,
        xxxl: 0.08,
        xxxxl: 0.09,
      );
}
