import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '00님, 커밋을 지속한 지',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  Text('22일 차 됐어요!',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) {
                      return Container(
                        width: 50,
                        height: 32,
                        decoration: ShapeDecoration(
                          color: Color(0xFF5498FF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Center(
                          child: Text(
                            '7일',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: -0.28,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  Container(
                    height: 394,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('첫 습관 형성까지 2일 남았어요!',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: 314, // 슬라이더의 너비
                    height: 6, // 슬라이더의 높이
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5), // 슬라이더의 둥근 모서리 반경
                      child: LinearProgressIndicator(
                          value: 0.24, // 현재 값
                          backgroundColor: Colors.grey[300], // 슬라이더 배경 색
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.grey), // 슬라이더 채워진 부분 색
                          minHeight: 10, // 슬라이더의 높이
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 152,
                        height: 110,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(157, 157, 157, 0.15),
                          // 모서리 둥글게 설정
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('오늘의 커밋',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey)),
                            Text('2개',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey)),
                          ],
                        ),
                      ),
                      Container(
                        width: 152,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(157, 157, 157, 0.15),
                          // 모서리 둥글게 설정
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('최대 연속',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey)),
                            Text('22일',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey)),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(36),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('현재 커밋 기록',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey)),
                        Text('지난 기록 보기',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
