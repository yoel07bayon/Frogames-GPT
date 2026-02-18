import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_ia/config/routes.dart';
import 'package:personal_ia/features/presentation/screen/chat_screen.dart';

class Navigation {
  static GoRouter getRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          path: Routes.chatRoute,
          builder: (BuildContext context, GoRouterState state) {
            return const ChatScreen();
          },
        ),
      ],
    );
  }
}
