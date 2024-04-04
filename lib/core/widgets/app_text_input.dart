import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentit/theme/app_colors.dart';
import 'package:sentit/theme/app_padding.dart';
import 'package:sentit/theme/app_radius.dart';
import 'package:sentit/theme/app_text_styles.dart';

class AppTextInput extends ConsumerWidget {
  const AppTextInput({
    super.key,
    required this.controller,
    this.title,
    this.hintText,
    this.isTextObscure = false,
    this.isError = false,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? title;
  final String? hintText;
  final bool isTextObscure;
  final bool isError;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paddings = ref.watch(paddingThemeProvider);
    final radius = ref.watch(radiusThemeProvider);
    final textStyles = ref.watch(textThemeProvider);
    final colors = ref.watch(appColorThemeProvider);
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: EdgeInsets.only(
              left: orientation == Orientation.portrait
                  ? size.width * paddings.sm
                  : size.width * paddings.xs,
              bottom: orientation == Orientation.portrait
                  ? size.width * paddings.sm
                  : size.width * paddings.xs,
            ),
            child: Text(
              title!,
              style: textStyles.bodyBase.withColor(
                isError ? colors.error : colors.primary,
                context,
              ),
            ),
          ),
        TextField(
          controller: controller,
          onChanged: onChanged,
          style: textStyles.body.withColor(
            colors.primary,
            context,
          ),
          obscureText: isTextObscure,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: orientation == Orientation.portrait
                  ? size.width * paddings.base
                  : size.width * paddings.sm,
              horizontal: orientation == Orientation.portrait
                  ? size.width * paddings.base
                  : size.width * paddings.sm,
            ),
            hintText: hintText,
            hintStyle: textStyles.bodyBase.withColor(
              colors.colorGrey400,
              context,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: isError ? colors.error : colors.colorGrey300,
              ),
              borderRadius: BorderRadius.circular(
                radius.base,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: colors.primary,
              ),
              borderRadius: BorderRadius.circular(
                radius.base,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
