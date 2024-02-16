import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_commit/login/bloc/login_bloc.dart';
import 'package:git_commit/login/bloc/login_event.dart';
import 'package:git_commit/login/bloc/login_state.dart';
import 'package:git_commit/router/route_conf.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  List<Widget> list = [
    Container(
      color: Colors.amber,
      child: const Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '뉴비 개발자님,\n',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: -0.44,
              ),
            ),
            TextSpan(
              text: '지속적인 커밋',
              style: TextStyle(
                color: Color(0xFF5498FF),
                fontSize: 22,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: -0.44,
              ),
            ),
            TextSpan(
              text: '을 위해\n어서오세요!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: -0.44,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    ),
    Container(
      color: Colors.black,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '매일 매일\n해야 하는 개발 공부, \n',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: -0.44,
              ),
            ),
            TextSpan(
              text: '미루게 되지 않으셨나요?',
              style: TextStyle(
                color: Color(0xFF5498FF),
                fontSize: 22,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: -0.44,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    ),
    Container(
      color: Colors.blue,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '확실한 습관을\n형성하기 위해서는\n',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: -0.44,
              ),
            ),
            TextSpan(
              text: '총 66일',
              style: TextStyle(
                color: Color(0xFF5498FF),
                fontSize: 22,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: -0.44,
              ),
            ),
            TextSpan(
              text: '이 필요하다고 해요.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: -0.44,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        CarouselController buttonCarouselController = CarouselController();

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 100, 16, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(),
                    items: list.map((item) => item).toList(),
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).go(RoutePath.gitLoginWebView);
                          // context.read<LoginBloc>().add((GitHubLogin()));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 61,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'GitHub으로 시작하기',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Google 계정으로 시작하기',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
