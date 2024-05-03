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
    final orientation = MediaQuery.of(context).orientation;

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
          //context.pushNamed(AppRoute.addUser.name);
        },
      ),
      body: orientation == Orientation.portrait
          ? const ChatListBody()
          : const ChatListBodyLandscape(),
    );
  }
}

class ChatListBody extends ConsumerWidget {
  const ChatListBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paddings = ref.watch(paddingThemeProvider);
    final iconSizes = ref.watch(appIconSizesProvider);
    final colors = ref.watch(appColorThemeProvider);
    final screenCategory = getScreenSize(context);

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(
              paddings.sm.onScreenWidth(context),
            ),
            child: Row(
              children: [
                const Flexible(
                  child: AppSearchBar(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: paddings.xs.onScreenWidth(context)),
                  child: IconButton(
                    onPressed: () {
                      ref.read(signOutControllerProvider.notifier).signOut();
                    },
                    color: colors.primary,
                    icon: Icon(
                      Icons.logout,
                      size: screenCategory.size >= ScreenSize.large.size
                          ? iconSizes.mini.onScreenWidth(context)
                          : iconSizes.small.onScreenWidth(context),
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
    );
  }
}

class ChatListBodyLandscape extends ConsumerWidget {
  const ChatListBodyLandscape({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paddings = ref.watch(paddingThemeProvider);
    final iconSizes = ref.watch(appIconSizesProvider);
    final colors = ref.watch(appColorThemeProvider);
    final screenCategory = getScreenSize(context);

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(
              paddings.xs.onScreenWidth(context),
            ),
            child: Row(
              children: [
                const Flexible(
                  child: AppSearchBar(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: paddings.xs.onScreenWidth(context)),
                  child: IconButton(
                    onPressed: () {
                      ref.read(signOutControllerProvider.notifier).signOut();
                    },
                    color: colors.primary,
                    icon: Icon(
                      Icons.logout,
                      size: screenCategory.size >= ScreenSize.large.size
                          ? iconSizes.micro.onScreenWidth(context)
                          : iconSizes.mini.onScreenWidth(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: UserListsViewLandscape(),
          ),
        ],
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
          padding: EdgeInsets.all(
            paddings.sm.onScreenWidth(context),
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

class UserListsViewLandscape extends ConsumerWidget {
  const UserListsViewLandscape({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paddings = ref.watch(paddingThemeProvider);
    final chatList = ref.watch(chatListProvider);
    return chatList.when(
      data: (data) {
        return ListView.builder(
          padding: EdgeInsets.all(
            paddings.xs.onScreenWidth(context),
          ),
          itemCount: data.docs.length,
          itemBuilder: (context, index) {
            final user = data.docs[index];
            return UserCardLandscape(
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
    final screenCategory = getScreenSize(context);
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(
            screenCategory.size >= ScreenSize.large.size
                ? paddings.sm.onScreenWidth(context)
                : paddings.base.onScreenWidth(context),
          ),
          child: Row(
            children: [
              Icon(
                Icons.perm_contact_cal,
                color: colors.primary,
                size: screenCategory.size >= ScreenSize.large.size
                    ? iconSizes.tiny.onScreenWidth(context)
                    : iconSizes.medium.onScreenWidth(context),
              ),
              SizedBox(
                width: spacing.medium.onScreenWidth(context),
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

class UserCardLandscape extends ConsumerWidget {
  const UserCardLandscape({
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
    final screenCategory = getScreenSize(context);
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(
            screenCategory.size >= ScreenSize.large.size
                ? paddings.xs.onScreenWidth(context)
                : paddings.sm.onScreenWidth(context),
          ),
          child: Row(
            children: [
              Icon(
                Icons.perm_contact_cal,
                color: colors.primary,
                size: screenCategory.size >= ScreenSize.large.size
                    ? iconSizes.mini.onScreenWidth(context)
                    : iconSizes.small.onScreenWidth(context),
              ),
              SizedBox(
                width: spacing.sm.onScreenWidth(context),
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
    final screenCategory = getScreenSize(context);
    final orientation = MediaQuery.of(context).orientation;
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: colors.primary,
        child: Padding(
          padding: EdgeInsets.all(
            screenCategory.size >= ScreenSize.large.size
                ? paddings.sm.onScreenWidth(context)
                : paddings.base.onScreenWidth(context),
          ),
          child: Icon(
            Icons.add_box_outlined,
            size: orientation == Orientation.portrait
                ? screenCategory.size >= ScreenSize.large.size
                    ? iconSizes.mini.onScreenWidth(context)
                    : iconSizes.tiny.onScreenWidth(context)
                : screenCategory.size >= ScreenSize.large.size
                    ? iconSizes.micro.onScreenWidth(context)
                    : iconSizes.mini.onScreenWidth(context),
            color: colors.onPrimary,
          ),
        ),
      ),
    );
  }
}
