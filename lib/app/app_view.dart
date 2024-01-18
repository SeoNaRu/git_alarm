import 'package:flutter/material.dart';

import 'package:git_commit/my/app_theme.dart';
import 'package:git_commit/router/router_provider.dart';
import 'package:go_router/go_router.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final GoRouter _router; // GoRouter 객체를 저장할 필드 선언

  @override
  void initState() {
    super.initState();
    _router = router(); // router() 함수를 호출하여 GoRouter 객체를 초기화
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.theme,
      routerConfig: _router,
    );
  }
}
