import 'package:flutter/material.dart';
import 'package:git_commit/alarms/view/alarms_view.dart';
import 'package:git_commit/common/not_found_screen.dart';
import 'package:git_commit/common/splash_screen.dart';
import 'package:git_commit/home/view/home_view.dart';
import 'package:git_commit/login/view/login_view.dart';
import 'package:git_commit/router/route_conf.dart';
import 'package:git_commit/router/scaffold_with_nested_navigation.dart';
import 'package:git_commit/setting/view/setting_veiw.dart';
import 'package:git_commit/shop/view/shop_view.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _root =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shell =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

GoRouter router() {
  return GoRouter(
    navigatorKey: _root,
    initialLocation: RoutePath.splash,
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: _root,
        path: RoutePath.splash,
        name: RouteName.splash,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SplashScreen(),
        ),
      ),
      GoRoute(
        path: RoutePath.login,
        name: RouteName.login,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LoginView(),
        ),
      ),
      ShellRoute(
        navigatorKey: _shell,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
            path: RoutePath.home,
            name: RouteName.home,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeView(),
            ),
          ),
          GoRoute(
            path: RoutePath.shop,
            name: RouteName.shop,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ShopView(),
            ),
          ),
          GoRoute(
            path: RoutePath.alarms,
            name: RouteName.alarms,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: AlarmsView(),
            ),
          ),
          GoRoute(
            path: RoutePath.setting,
            name: RouteName.setting,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SettingView(),
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
