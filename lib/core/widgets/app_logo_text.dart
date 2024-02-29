import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
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
    final iconsSizes = ref.watch(appIconSizesProvider);
    final colors = ref.watch(appColorThemeProvider);
    final textStyles = ref.watch(textThemeProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppIcons.appIcon,
          height: iconsSizes.xl,
          width: iconsSizes.xl,
        ),
        Text(
          label,
          style: textStyles.pageTitle.withColor(
            colors.primary,
          ),
        )
      ],
    );
  }
}
