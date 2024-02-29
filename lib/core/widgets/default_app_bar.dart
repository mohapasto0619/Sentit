import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentit/theme/app_colors.dart';
import 'package:sentit/theme/app_icon_sizes.dart';
import 'package:sentit/theme/app_padding.dart';

class DefaultAppBar extends ConsumerWidget implements PreferredSizeWidget {
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
    return AppBar(
      leading: IconButton(
        color: colors.primary,
        onPressed: onPressed,
        padding: EdgeInsets.only(
          left: paddings.sm,
          top: paddings.sm,
        ),
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: iconSizes.small,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, appBarDefaultSize);

  static const double appBarDefaultSize = 50;
}
