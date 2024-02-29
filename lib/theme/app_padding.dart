import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentit/core/utils/screen_size.dart';

part 'app_padding.g.dart';
part 'app_padding.freezed.dart';

/// The AppRadiusTheme of the app.
/// It will be created directly here.
@Riverpod(keepAlive: true)
AppPaddingTheme paddingTheme(PaddingThemeRef ref) {
  final screenSize = ref.watch(screenSizeProvider);
  if (screenSize.height > WindowSize.HEIGHT_SMALL_MAX) {
    return AppPaddingTheme.small();
  } else {
    return AppPaddingTheme.extraSmall();
  }
}

@freezed
class AppPaddingTheme with _$AppPaddingTheme {
  const factory AppPaddingTheme({
    required double none,
    required double xxs,
    required double xs,
    required double sm,
    required double base,
    required double lg,
    required double xl,
  }) = _AppPaddingTheme;

  factory AppPaddingTheme.extraSmall() => const AppPaddingTheme(
        none: 0,
        xxs: 1,
        xs: 2,
        sm: 4,
        base: 8,
        lg: 12,
        xl: 16,
      );

  factory AppPaddingTheme.small() => const AppPaddingTheme(
        none: 0,
        xxs: 2,
        xs: 4,
        sm: 8,
        base: 16,
        lg: 24,
        xl: 32,
      );
}
