import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double _currentSliderValue = 20;
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
                  Container(
                    height: 454,
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
                      borderRadius:
                          BorderRadius.circular(10), // 슬라이더의 둥근 모서리 반경
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
                        child: Column(
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
                        child: Column(
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
                    Row(
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
                    SizedBox(
                      height: 20,
                    ),
                    GridView.builder(
                      shrinkWrap: true, // 그리드 뷰가 차지하는 영역만큼만 크기를 가지도록 설정
                      physics:
                          NeverScrollableScrollPhysics(), // 그리드 뷰의 스크롤 기능을 비활성화

                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 16, // 한 행에 10개의 그리드 아이템
                        crossAxisSpacing: 5, // 가로 방향 간격
                        mainAxisSpacing: 5, // 세로 방향 간격
                        childAspectRatio: 1, // 아이템의 가로세로 비율을 1로 설정하여 정사각형 만들기
                      ),
                      itemCount: 112, // 생성할 아이템의 총 개수
                      itemBuilder: (context, index) {
                        // 각 아이템의 빌더
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.grey, // 아이템의 배경색
                            borderRadius:
                                BorderRadius.circular(3), // 아이템의 둥근 모서리
                          ),
                        );
                      },
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
