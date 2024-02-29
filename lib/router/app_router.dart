import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentit/data/repositories/auth_repository.dart';
import 'package:sentit/modules/add/add_user_view.dart';
import 'package:sentit/modules/auth/login/login_view.dart';
import 'package:sentit/modules/auth/register/register_view.dart';
import 'package:sentit/modules/chat/chat_list_view.dart';
import 'package:sentit/modules/chat/chat_view.dart';
import 'package:sentit/router/app_routes.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter appRouter(AppRouterRef ref) {
  final router = GoRouter(
    initialLocation: ref.read(authRepositoryProvider).isAuthenticated()
        ? AppRoute.chatList.path
        : AppRoute.login.path,
    navigatorKey: _rootNavigatorKey,
    /*redirect: (context, state) {
      if (!ref.read(authRepositoryProvider).isAuthenticated() &&
          state.path != AppRoute.register.path) {
        return AppRoute.login.path;
      } else {
        return null;
      }
    },*/
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoute.login.path,
        name: AppRoute.login.name,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoute.register.path,
        name: AppRoute.register.name,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoute.chatList.path,
        name: AppRoute.chatList.name,
        builder: (context, state) => const ChatListView(),
        routes: [
          GoRoute(
            path: AppRoute.chat.path,
            name: AppRoute.chat.name,
            builder: (context, state) => ChatView(
              userId: state.pathParameters['userId']!,
              receiverId: state.pathParameters['receiverId']!,
              receiverUsername: state.pathParameters['receiverUsername']!,
            ),
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoute.addUser.path,
        name: AppRoute.addUser.name,
        builder: (context, state) => const AddUserView(),
      ),
    ],
  );

  ref.onDispose(router.dispose);

  return router;
}
