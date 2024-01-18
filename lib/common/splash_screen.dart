import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:git_commit/my/app_theme.dart';
import 'package:git_commit/router/route_conf.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> init() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go(RoutePath.login);
          });
          return Container();
        } else if (snapshot.hasError) {
          return const Scaffold(
              body: Center(
            child: Text(
              "error",
            ),
          ));
        } else {
          return Scaffold(
            body: Container(
              color: AppColor.green,
              child: Center(
                child: SvgPicture.asset('assets/images/splash.svg', width: 150),
              ),
            ),
          );
        }
      },
    );
  }
}
