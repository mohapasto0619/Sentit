import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentit/theme/app_colors.dart';
import 'package:sentit/theme/app_text_styles.dart';

class ErrorTextMessage extends ConsumerWidget {
  const ErrorTextMessage({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(appColorThemeProvider);
    final textStyles = ref.watch(textThemeProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            message,
            style: textStyles.body.withColor(
              colors.error,
              context,
            ),
          ),
        ),
      ],
    );
  }
}
