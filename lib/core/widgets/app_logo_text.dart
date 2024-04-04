import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sentit/core/utils/screen_size.dart';
import 'package:sentit/theme/app_colors.dart';
import 'package:sentit/theme/app_icon_sizes.dart';
import 'package:sentit/theme/app_icons.dart';
import 'package:sentit/theme/app_text_styles.dart';

class AppLogo extends ConsumerWidget {
  const AppLogo({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(appColorThemeProvider);
    final textStyles = ref.watch(textThemeProvider);
    final iconSizes = ref.watch(appIconSizesProvider);
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final screenCategory = getScreenSize(context);
    return orientation == Orientation.portrait
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppIcons.appIcon,
                height: screenCategory.size >= ScreenSize.large.size
                    ? orientation == Orientation.portrait
                        ? size.width * iconSizes.large
                        : size.width * iconSizes.medium
                    : orientation == Orientation.portrait
                        ? size.width * iconSizes.xl
                        : size.width * iconSizes.small,
                width: screenCategory.size >= ScreenSize.large.size
                    ? size.width * iconSizes.large
                    : size.width * iconSizes.xl,
              ),
              Text(
                label,
                style: textStyles.pageTitle.withColor(
                  colors.primary,
                  context,
                ),
              )
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppIcons.appIcon,
                height: screenCategory.size >= ScreenSize.large.size
                    ? orientation == Orientation.portrait
                        ? size.width * iconSizes.large
                        : size.width * iconSizes.medium
                    : orientation == Orientation.portrait
                        ? size.width * iconSizes.xl
                        : size.width * iconSizes.small,
                width: screenCategory.size >= ScreenSize.large.size
                    ? size.width * iconSizes.large
                    : size.width * iconSizes.xl,
              ),
              Text(
                label,
                style: textStyles.pageTitle.withColor(
                  colors.primary,
                  context,
                ),
              )
            ],
          );
  }
}
