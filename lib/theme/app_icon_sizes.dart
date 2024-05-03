import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_icon_sizes.g.dart';
part 'app_icon_sizes.freezed.dart';

/// The AppIconSizes of the app.
/// It will be created directly here.
@Riverpod(keepAlive: true)
AppIconSizes appIconSizes(AppIconSizesRef ref) {
  return AppIconSizes.regular();
}

@freezed
class AppIconSizes with _$AppIconSizes {
  const factory AppIconSizes({
    required double micro,
    required double mini,
    required double tiny,
    required double small,
    required double smallMedium,
    required double medium,
    required double large,
    required double xl,
  }) = _AppIconSizes;
  const AppIconSizes._();

  factory AppIconSizes.regular() => const AppIconSizes(
        micro: 0.03,
        mini: 0.05,
        tiny: 0.06,
        small: 0.08,
        smallMedium: 0.09,
        medium: 0.1,
        large: 0.15,
        xl: 0.2,
      );
}
