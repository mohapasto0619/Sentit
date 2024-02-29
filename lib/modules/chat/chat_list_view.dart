import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sentit/core/widgets/app_search_bar.dart';
import 'package:sentit/core/widgets/error_text_message.dart';
import 'package:sentit/data/repositories/auth_repository.dart';
import 'package:sentit/modules/chat/chat_list_notifier.dart';
import 'package:sentit/router/app_routes.dart';
import 'package:sentit/theme/app_colors.dart';
import 'package:sentit/theme/app_icon_sizes.dart';
import 'package:sentit/theme/app_padding.dart';
import 'package:sentit/theme/app_spacing.dart';
import 'package:sentit/theme/app_text_styles.dart';

class ChatListView extends ConsumerWidget {
  const ChatListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final paddings = ref.watch(paddingThemeProvider);
    return Scaffold(
      floatingActionButton: AddUserButton(
        onPressed: () {
          context.pushNamed(AppRoute.addUser.name);
        },
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(paddings.sm),
              child: const AppSearchBar(),
            ),
            const Expanded(
              child: UserListsView(),
            ),
          ],
        ),
      ),
    );
  }
}

class UserListsView extends ConsumerWidget {
  const UserListsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paddings = ref.watch(paddingThemeProvider);
    final chatList = ref.watch(chatListProvider);
    return chatList.when(
      data: (data) {
        return ListView.builder(
          padding: EdgeInsets.all(paddings.sm),
          itemCount: data.docs.length,
          itemBuilder: (context, index) {
            final user = data.docs[index];
            return UserCard(
              username: user['username'],
              onTap: () {
                context.pushNamed(AppRoute.chat.name, pathParameters: {
                  'userId': ref.read(authRepositoryProvider).getUserId()!,
                  'receiverId': user['uid'],
                  'receiverUsername': user['username'],
                });
              },
            );
          },
        );
      },
      error: (error, stackTrace) {
        return const Center(
          child: ErrorTextMessage(message: "Error can't load list"),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class UserCard extends ConsumerWidget {
  const UserCard({
    super.key,
    required this.username,
    this.onTap,
  });

  final String username;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paddings = ref.watch(paddingThemeProvider);
    final spacing = ref.watch(spacingThemeProvider);
    final colors = ref.watch(appColorThemeProvider);
    final iconSizes = ref.watch(appIconSizesProvider);
    final textStyles = ref.watch(textThemeProvider);
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(paddings.base),
          child: Row(
            children: [
              Icon(
                Icons.perm_contact_cal,
                color: colors.primary,
                size: iconSizes.medium,
              ),
              SizedBox(
                width: spacing.medium,
              ),
              Text(
                username,
                style: textStyles.headline.withColor(colors.primary),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddUserButton extends ConsumerWidget {
  const AddUserButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paddings = ref.watch(paddingThemeProvider);
    final iconSizes = ref.watch(appIconSizesProvider);
    final colors = ref.watch(appColorThemeProvider);
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: colors.primary,
        child: Padding(
          padding: EdgeInsets.all(paddings.base),
          child: Icon(
            Icons.add_box_outlined,
            size: iconSizes.tiny,
            color: colors.onPrimary,
          ),
        ),
      ),
    );
  }
}
