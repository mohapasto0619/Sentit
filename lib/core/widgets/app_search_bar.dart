import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentit/core/utils/screen_size.dart';
import 'package:sentit/theme/app_colors.dart';
import 'package:sentit/theme/app_icon_sizes.dart';
import 'package:sentit/theme/app_padding.dart';
import 'package:sentit/theme/app_radius.dart';
import 'package:sentit/theme/app_text_styles.dart';

class AppSearchBar extends ConsumerWidget {
  const AppSearchBar({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radius = ref.watch(radiusThemeProvider);
    final paddings = ref.watch(paddingThemeProvider);
    final iconSizes = ref.watch(appIconSizesProvider);
    final textStyles = ref.watch(textThemeProvider);
    final colors = ref.watch(appColorThemeProvider);
    final size = MediaQuery.of(context).size;
    final screenCategory = getScreenSize(context);
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: textStyles.body.withColor(
        colors.primary,
        context,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: screenCategory.size >= ScreenSize.large.size
              ? size.width * paddings.sm
              : size.width * paddings.base,
          horizontal: size.width * paddings.base,
        ),
        suffixIcon: Icon(
          Icons.search,
          color: colors.primary,
          size: screenCategory.size >= ScreenSize.large.size
              ? size.width * iconSizes.mini
              : size.width * iconSizes.tiny,
        ),
        hintText: hintText,
        hintStyle: textStyles.bodyBase.withColor(
          colors.colorGrey400,
          context,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.colorGrey300,
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
    );
  }
}
