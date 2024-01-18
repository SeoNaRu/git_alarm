import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:git_commit/my/app_theme.dart';
import 'package:git_commit/router/bloc/nav_nar_bloc_bloc.dart';
import 'package:git_commit/router/bloc/nav_nar_bloc_event.dart';
import 'package:git_commit/router/bloc/nav_nar_bloc_state.dart';
import 'package:git_commit/router/route_conf.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.child,
    Key? key,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final items = [
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 3),
          child: SvgPicture.asset('assets/images/main_icon_on.svg'),
        ),
        label: "홈",
      ),
      BottomNavigationBarItem(
        // backgroundColor: Colors.blue,
        icon: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 3),
          child: SvgPicture.asset('assets/images/social_icon_off.svg'),
        ),
        label: "아이템 교환소",
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 3),
          child: SvgPicture.asset('assets/images/ticket_icon_off.svg'),
        ),
        label: "알림 등록",
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 3),
          child: SvgPicture.asset('assets/images/ticket_icon_off.svg'),
        ),
        label: "설정",
      ),
    ];

    final paths = [
      RoutePath.home,
      RoutePath.shop,
      RoutePath.alarms,
      RoutePath.setting,
    ];

    return Scaffold(
      body: child,
      bottomNavigationBar: BlocBuilder<NavNarBlocBloc, NavNarBlocState>(
        builder: (context, state) {
          return SizedBox(
            height: 91,
            child: Column(
              children: [
                BottomNavigationBar(
                  iconSize: 18,
                  selectedFontSize: 10,
                  unselectedFontSize: 10,
                  backgroundColor: AppColor.b1a1f,
                  selectedItemColor: AppColor.k15e853,
                  type: BottomNavigationBarType.fixed,
                  items: items,
                  currentIndex: _calculateSelectedIndex(context),
                  onTap: (int idx) {
                    context
                        .read<NavNarBlocBloc>()
                        .add((BotNavNumber(botNav: idx)));
                    GoRouter.of(context).go(paths[idx]);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(RoutePath.home)) {
      return 0;
    } else if (location.startsWith(RoutePath.shop)) {
      return 1;
    } else if (location.startsWith(RoutePath.alarms)) {
      return 2;
    } else if (location.startsWith(RoutePath.setting)) {
      return 3;
    }
    return 0;
  }
}
