import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sentit/core/utils/screen_size.dart';
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
    final iconSizes = ref.watch(appIconSizesProvider);
    final size = MediaQuery.of(context).size;
    final colors = ref.watch(appColorThemeProvider);
    final screenCategory = getScreenSize(context);

    ref.listen(
      signOutControllerProvider,
      (_, next) {
        next.when(
          data: (isSignedIn) {
            if (isSignedIn) {
              context.goNamed(AppRoute.login.name);
            }
          },
          error: (error, stackTrace) {},
          loading: () {},
        );
      },
    );

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
              padding: EdgeInsets.all(
                size.width * paddings.sm,
              ),
              child: Row(
                children: [
                  const Flexible(
                    child: AppSearchBar(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * paddings.xs),
                    child: IconButton(
                      onPressed: () {
                        ref.read(signOutControllerProvider.notifier).signOut();
                      },
                      color: colors.primary,
                      icon: Icon(
                        Icons.logout,
                        size: screenCategory.size >= ScreenSize.large.size
                            ? size.width * iconSizes.mini
                            : size.width * iconSizes.small,
                      ),
                    ),
                  ),
                ],
              ),
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
    final size = MediaQuery.of(context).size;
    return chatList.when(
      data: (data) {
        return ListView.builder(
          padding: EdgeInsets.all(
            size.width * paddings.sm,
          ),
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
    final size = MediaQuery.of(context).size;
    final screenCategory = getScreenSize(context);
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(
            screenCategory.size >= ScreenSize.large.size
                ? size.width * paddings.sm
                : size.width * paddings.base,
          ),
          child: Row(
            children: [
              Icon(
                Icons.perm_contact_cal,
                color: colors.primary,
                size: screenCategory.size >= ScreenSize.large.size
                    ? size.width * iconSizes.tiny
                    : size.width * iconSizes.medium,
              ),
              SizedBox(
                width: size.width * spacing.medium,
              ),
              Text(
                username,
                style: textStyles.headline.withColor(
                  colors.primary,
                  context,
                ),
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
    final size = MediaQuery.of(context).size;
    final screenCategory = getScreenSize(context);
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: colors.primary,
        child: Padding(
          padding: EdgeInsets.all(
            screenCategory.size >= ScreenSize.large.size
                ? size.width * paddings.sm
                : size.width * paddings.base,
          ),
          child: Icon(
            Icons.add_box_outlined,
            size: screenCategory.size >= ScreenSize.large.size
                ? size.width * iconSizes.mini
                : size.width * iconSizes.tiny,
            color: colors.onPrimary,
          ),
        ),
      ),
    );
  }
}
