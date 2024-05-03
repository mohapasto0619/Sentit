import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentit/core/utils/screen_size.dart';
import 'package:sentit/theme/app_colors.dart';
import 'package:sentit/theme/app_icon_sizes.dart';
import 'package:sentit/theme/app_padding.dart';
import 'package:sentit/theme/app_spacing.dart';
import 'package:sentit/theme/app_text_styles.dart';

class ChatAppBar extends ConsumerWidget {
  const ChatAppBar({
    super.key,
    this.onPressed,
    required this.title,
  });

  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iconSizes = ref.watch(appIconSizesProvider);
    final paddings = ref.watch(paddingThemeProvider);
    final spacings = ref.watch(spacingThemeProvider);
    final colors = ref.watch(appColorThemeProvider);
    final textStyle = ref.watch(textThemeProvider);
    final screenCategory = getScreenSize(context);
    final orientation = MediaQuery.of(context).orientation;
    return Row(
      children: [
        IconButton(
          color: colors.primary,
          onPressed: onPressed,
          padding: EdgeInsets.only(
            left: orientation == Orientation.portrait
                ? paddings.sm.onScreenWidth(context)
                : paddings.xs.onScreenWidth(context),
            top: orientation == Orientation.portrait
                ? paddings.sm.onScreenWidth(context)
                : paddings.xs.onScreenWidth(context),
          ),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: orientation == Orientation.portrait
                ? screenCategory.size >= ScreenSize.large.size
                    ? iconSizes.mini.onScreenWidth(context)
                    : iconSizes.small.onScreenWidth(context)
                : screenCategory.size >= ScreenSize.large.size
                    ? iconSizes.micro.onScreenWidth(context)
                    : iconSizes.mini.onScreenWidth(context),
          ),
        ),
        SizedBox(
          width: spacings.large.onScreenWidth(context),
        ),
        Text(
          title,
          style: textStyle.headline.withColor(
            colors.primary,
            context,
          ),
        ),
      ],
    );
  }
}
