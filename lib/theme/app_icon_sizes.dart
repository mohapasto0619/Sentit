import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentit/core/utils/screen_size.dart';

part 'app_icon_sizes.g.dart';
part 'app_icon_sizes.freezed.dart';

/// The AppIconSizes of the app.
/// It will be created directly here.
@Riverpod(keepAlive: true)
AppIconSizes appIconSizes(AppIconSizesRef ref) {
  final screenSize = ref.watch(screenSizeProvider);
  if (screenSize.height > WindowSize.HEIGHT_SMALL_MAX) {
    return AppIconSizes.regular();
  } else {
    return AppIconSizes.small();
  }
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

  factory AppIconSizes.small() => const AppIconSizes(
        micro: 12,
        mini: 16,
        tiny: 18,
        small: 20,
        smallMedium: 24,
        medium: 28,
        large: 45,
        xl: 60,
      );

  factory AppIconSizes.regular() => const AppIconSizes(
        micro: 16,
        mini: 20,
        tiny: 24,
        small: 30,
        smallMedium: 36,
        medium: 38,
        large: 60,
        xl: 80,
      );
}
