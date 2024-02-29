import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_colors.freezed.dart';

//No manage dark theme in this version
final appColorThemeProvider = Provider<AppColorTheme>((ref) {
  return AppColorTheme.light();
});

/// Colors used in the app.
@freezed
class AppColorTheme with _$AppColorTheme {
  const factory AppColorTheme({
    required Color primary,
    required Color secondary,
    required Color tertiary,
    required Color onPrimary,
    required Color background,
    required Color error,
    required Color colorGrey600,
    required Color colorGrey500,
    required Color colorGrey400,
    required Color colorGrey300,
  }) = _AppColorTheme;

  factory AppColorTheme.light() => const AppColorTheme(
        primary: Color(0xFF415d43),
        secondary: Color(0xFF8fb996),
        tertiary: Color(0xFF709775),
        onPrimary: Color(0xFFFFFFFF),
        background: Color(0xFFFFFFFF),
        error: Color(0xFFe63946),
        colorGrey600: Color(0xFF525252),
        colorGrey500: Color(0xFF737373),
        colorGrey400: Color(0xFFA3A3A3),
        colorGrey300: Color(0xFFD4D4D4),
      );
}
