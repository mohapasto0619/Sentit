import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentit/core/utils/screen_size.dart';
import 'package:sentit/theme/app_colors.dart';
import 'package:sentit/theme/app_padding.dart';
import 'package:sentit/theme/app_text_styles.dart';

class AppButton extends ConsumerWidget {
  const AppButton({
    super.key,
    required this.label,
    this.isActive = true,
    this.onPressed,
  });

  final String label;
  final bool isActive;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paddings = ref.watch(paddingThemeProvider);
    final colors = ref.watch(appColorThemeProvider);
    final textStyles = ref.watch(textThemeProvider);
    final orientation = MediaQuery.of(context).orientation;
    return ElevatedButton(
      onPressed: isActive ? onPressed : null,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: orientation == Orientation.portrait
              ? paddings.base.onScreenWidth(context)
              : paddings.sm.onScreenWidth(context),
        ),
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        textStyle: textStyles.headline.withColor(
          colors.onPrimary,
          context,
        ),
      ),
      child: Text(
        label,
      ),
    );
  }
}
