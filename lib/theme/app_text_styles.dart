import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentit/core/utils/screen_size.dart';

part 'app_text_styles.g.dart';
part 'app_text_styles.freezed.dart';

/// The textStyles theme of the app.
@Riverpod(keepAlive: true)
AppTextTheme textTheme(TextThemeRef ref) {
  return AppTextTheme.main();
}

@freezed
class AppTextTheme with _$AppTextTheme {
  const factory AppTextTheme({
    required AppTextStyle pageTitle,
    required AppTextStyle headline,
    required AppTextStyle bodyBase,
    required AppTextStyle bodyThick,
    required AppTextStyle body,
  }) = _AppTextTheme;
  const AppTextTheme._();

  // The default text theme
  factory AppTextTheme.main() => AppTextTheme(
        pageTitle: AppTextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
        headline: AppTextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        bodyThick: AppTextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        bodyBase: AppTextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        body: AppTextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      );
}

class AppTextStyle {
  AppTextStyle({
    this.fontFamily = defaultFontFamily,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
  });

  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;

  static const defaultFontFamily = '.SF Pro Text';

  TextStyle withColor(Color color, BuildContext context) {
    final textRatio = getScreenSize(context).textRatio;
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize != null ? fontSize! * textRatio : null,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
    );
  }
}

extension TextStyleExtension on TextStyle {
  TextStyle get normal => copyWith(fontWeight: FontWeight.normal);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w500);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle withOpacity(double opacity) => copyWith(
        color: color?.withOpacity(opacity),
      );
}
