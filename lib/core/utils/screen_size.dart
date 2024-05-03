// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';

enum ScreenSize {
  extraSmall(250, 0.8),
  small(350, 0.9),
  normal(400, 1),
  large(600, 1.2),
  extraLarge(1200, 2);

  final double size;
  final double textRatio;

  const ScreenSize(
    this.size,
    this.textRatio,
  );
}

ScreenSize getScreenSize(BuildContext context) {
  final double deviceWidth = MediaQuery.sizeOf(context).shortestSide;
  if (deviceWidth > ScreenSize.extraLarge.size) {
    return ScreenSize.extraLarge;
  }
  if (deviceWidth > ScreenSize.large.size) {
    return ScreenSize.large;
  }
  if (deviceWidth > ScreenSize.normal.size) {
    return ScreenSize.normal;
  }
  if (deviceWidth > ScreenSize.small.size) {
    return ScreenSize.small;
  }
  return ScreenSize.extraSmall;
}

extension ScreenSizeExtension on double {
  double onScreenHeight(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return this * height;
  }

  double onScreenWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return this * width;
  }
}
