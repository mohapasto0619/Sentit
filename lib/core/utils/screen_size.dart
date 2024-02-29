// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_foundation/obs_foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screen_size.g.dart';

@Riverpod(keepAlive: true)
class ScreenSize extends _$ScreenSize {
  @override
  ({double width, double height}) build() {
    final view = WidgetsBinding.instance.platformDispatcher.views.first;
    final size = view.physicalSize;
    final pixelRatio = view.devicePixelRatio;
    final width = size.width / pixelRatio;
    final height = size.height / pixelRatio;

    return (width: width, height: height);
  }

  // ignore: use_setters_to_change_properties
  void setSize(Size size) {
    state = (width: size.width, height: size.height);
  }
}

class WindowSize {
  WindowSize._();

  static const double WIDTH_COMPACT_MAX = 600;
  static const double WIDTH_MEDIUM_MAX = 840;

  static const double HEIGHT_COMPACT_MAX = 480;
  static const double HEIGHT_SMALL_MAX = 600;
  static const double HEIGHT_MEDIUM_MAX = 900;
}

class ScreenSizeWidget extends ConsumerWidget {
  const ScreenSizeWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return ValueObserver(
      value: size,
      onUpdated: (size) {
        ref.read(screenSizeProvider.notifier).setSize(size);
      },
      child: child,
    );
  }
}
