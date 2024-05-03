import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentit/core/utils/screen_size.dart';
import 'package:sentit/theme/app_colors.dart';
import 'package:sentit/theme/app_icon_sizes.dart';
import 'package:sentit/theme/app_padding.dart';

class DefaultAppBar extends ConsumerWidget {
  const DefaultAppBar({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iconSizes = ref.watch(appIconSizesProvider);
    final paddings = ref.watch(paddingThemeProvider);
    final colors = ref.watch(appColorThemeProvider);
    final orientation = MediaQuery.of(context).orientation;
    final screenCategory = getScreenSize(context);
    return Row(
      children: [
        IconButton(
          color: colors.primary,
          onPressed: onPressed,
          padding: EdgeInsets.only(
            left: paddings.sm.onScreenWidth(context),
            top: paddings.sm.onScreenWidth(context),
          ),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: screenCategory.size >= ScreenSize.large.size
                ? orientation == Orientation.portrait
                    ? iconSizes.tiny.onScreenWidth(context)
                    : iconSizes.mini.onScreenWidth(context)
                : orientation == Orientation.portrait
                    ? iconSizes.small.onScreenWidth(context)
                    : iconSizes.mini.onScreenWidth(context),
          ),
        ),
      ],
    );
  }
}
