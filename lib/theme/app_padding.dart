import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_padding.g.dart';
part 'app_padding.freezed.dart';

/// The AppRadiusTheme of the app.
/// It will be created directly here.
@Riverpod(keepAlive: true)
AppPaddingTheme paddingTheme(PaddingThemeRef ref) {
  return AppPaddingTheme.regular();
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

  factory AppPaddingTheme.regular() => const AppPaddingTheme(
        none: 0,
        xxs: 0.005,
        xs: 0.01,
        sm: 0.02,
        base: 0.04,
        lg: 0.06,
        xl: 0.08,
      );
}
