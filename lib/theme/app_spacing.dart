import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentit/core/utils/screen_size.dart';

part 'app_spacing.g.dart';
part 'app_spacing.freezed.dart';

/// The AppRadiusTheme of the app.
/// It will be created directly here.
@Riverpod(keepAlive: true)
AppSpacingTheme spacingTheme(SpacingThemeRef ref) {
  final screenSize = ref.watch(screenSizeProvider);
  if (screenSize.height > WindowSize.HEIGHT_SMALL_MAX) {
    return AppSpacingTheme.small();
  } else {
    return AppSpacingTheme.extraSmall();
  }
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

  factory AppSpacingTheme.extraSmall() => const AppSpacingTheme(
        xxs: 2,
        xs: 4,
        ms: 8,
        small: 12,
        sm: 16,
        medium: 20,
        large: 24,
        xl: 28,
        xxl: 32,
        xxxl: 36,
        xxxxl: 40,
      );

  factory AppSpacingTheme.small() => const AppSpacingTheme(
        xxs: 4,
        xs: 8,
        ms: 16,
        small: 24,
        sm: 32,
        medium: 40,
        large: 48,
        xl: 56,
        xxl: 64,
        xxxl: 72,
        xxxxl: 80,
      );
}
