import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/features/recipe/models/recipe.dart';
import 'package:recipes/features/account/account_view.dart';
import 'package:recipes/features/home/home_view.dart';
import 'package:recipes/features/notifications/notifications_view.dart';
import 'package:recipes/features/recipe/recipe_view.dart';
import 'package:recipes/features/root/root_view.dart';
import 'package:recipes/features/search/search_view.dart';

class Routes {
  static const String root = '/root';
  static const String home = '/home';
  static const String search = '/search';
  static const String notifications = '/notifications';
  static const String account = '/account';
  static const String recipe = '/recipe';

  static final navigatorKeys = {
    home: GlobalKey<NavigatorState>(),
    search: GlobalKey<NavigatorState>(),
    notifications: GlobalKey<NavigatorState>(),
    account: GlobalKey<NavigatorState>(),
  };

  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: home,
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state, navigationShell) => RootView(
          statefulNavigationShell: navigationShell,
        ),
        branches: [
          createBranch(
            navigatorKeys[home]!,
            [
              createRoute(
                path: home,
                builder: (context, state) => const HomeView(),
                nestedRoutes: [
                  GoRoute(
                    path: recipe,
                    name: recipe,
                    builder: (context, state) {
                      final recipe = state.extra as Recipe;
                      return RecipeDetailsView(recipe: recipe);
                    },
                  ),
                ],
              ),
            ],
          ),
          createBranch(
            navigatorKeys[search]!,
            [
              createRoute(
                path: search,
                builder: (context, state) => const SearchView(),
              ),
            ],
          ),
          createBranch(
            navigatorKeys[notifications]!,
            [
              createRoute(
                path: notifications,
                builder: (context, state) => const NotificationsView(),
              ),
            ],
          ),
          createBranch(
            navigatorKeys[account]!,
            [
              createRoute(
                path: account,
                builder: (context, state) => const AccountView(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static StatefulShellBranch createBranch(
    GlobalKey<NavigatorState> key,
    List<GoRoute> routes,
  ) {
    return StatefulShellBranch(
      navigatorKey: key,
      routes: routes,
    );
  }

  static GoRoute createRoute({
    required String path,
    required Widget Function(BuildContext, GoRouterState) builder,
    List<GoRoute> nestedRoutes = const [],
  }) {
    return GoRoute(
      path: path,
      builder: builder,
      routes: nestedRoutes,
    );
  }
}
