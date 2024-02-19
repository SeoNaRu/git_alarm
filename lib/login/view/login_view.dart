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
    Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text.rich(
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
        SizedBox(
          height: 120,
        ),
        Container(
          width: 116,
          height: 116,
          decoration: BoxDecoration(
              color: Color(0xFF5498FF),
              borderRadius: BorderRadius.all(Radius.circular(30))),
        )
      ],
    ),
    Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text.rich(
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
        SizedBox(
          height: 100,
        ),
        Container(
          width: 155,
          height: 155,
          decoration: BoxDecoration(
              color: Color(0xFF5498FF),
              borderRadius: BorderRadius.all(Radius.circular(30))),
        )
      ],
    ),
    Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text.rich(
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
        SizedBox(
          height: 56,
        ),
        Container(
          child: Image.asset('assets/images/login3.png'),
        ),
      ],
    ),
    const Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '그래서 데일깃에서는\n습관 형성에 지치지 않도록,\n',
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
                text: '성취감을 바로',
                style: TextStyle(
                  color: Color(0xFF5096FF),
                  fontSize: 22,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: -0.44,
                ),
              ),
              TextSpan(
                text: ' ',
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
                text: '볼 수 있어요.',
                style: TextStyle(
                  color: Color(0xFF5096FF),
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
      ],
    ),
    const Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '개발자님의 방도 꾸미고\n커밋 습관 형성을 위해\n',
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
                text: '데일깃',
                style: TextStyle(
                  color: Color(0xFF5096FF),
                  fontSize: 22,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: -0.44,
                ),
              ),
              TextSpan(
                text: '과 함께 시작해볼까요?',
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
      ],
    )
  ];
  int selectScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 50, 16, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        selectScreen = index;
                      });
                    },
                    height: 410,
                    enableInfiniteScroll: false,
                    disableCenter: true,
                    viewportFraction: 1),
                items: list.map((item) => item).toList(),
              ),
              SizedBox(
                width: 62,
                height: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(5, (index) {
                    return Container(
                      width: 6,
                      height: 6,
                      decoration: ShapeDecoration(
                        color: selectScreen == index
                            ? Colors.white
                            : const Color(0x4C8F9094),
                        shape: const CircleBorder(),
                      ),
                    );
                  }),
                ),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).go(RoutePath.gitLoginWebView);
                      // context.read<LoginBloc>().add((GitHubLogin()));
                    },
                    child: Container(
                      width: 350,
                      height: 61,
                      decoration: ShapeDecoration(
                        color: Color(0xFF5498FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Center(
                          child: Text(
                        'Github로 시작하기',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 0,
                          letterSpacing: -0.36,
                        ),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
