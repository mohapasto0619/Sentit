import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentit/theme/app_colors.dart';
import 'package:sentit/theme/app_text_styles.dart';

class AppTextButton extends ConsumerWidget {
  const AppTextButton({
    super.key,
    this.onPressed,
    required this.label,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(appColorThemeProvider);
    final textStyles = ref.watch(textThemeProvider);
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: textStyles.bodyBase
            .withColor(
              colors.primary,
              context,
            )
            .copyWith(
              decoration: TextDecoration.underline,
            ),
      ),
    );
  }
}
