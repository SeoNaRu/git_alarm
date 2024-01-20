import 'package:flutter/material.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  List<String> day = [
    '1일차',
    '3일차',
    '7일차',
    '14일차',
    '21일차',
    '42일차',
    '66일차',
    '히든 스페셜'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 36,
              ),
              Text(
                '아이템 교환소',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(157, 157, 157, 1)),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  width: double.infinity,
                  height: 358,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    // 모서리 둥글게 설정
                    borderRadius: BorderRadius.circular(12),
                  )),
              SizedBox(
                height: 39,
              ),
              const Row(
                children: [
                  Text(
                    '해커',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(157, 157, 157, 1)),
                  ),
                  SizedBox(
                    width: 26,
                  ),
                  Text(
                    '핑크',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(157, 157, 157, 1)),
                  ),
                  SizedBox(
                    width: 26,
                  ),
                  Text(
                    '펑크',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(157, 157, 157, 1)),
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              GridView.builder(
                shrinkWrap: true, // 그리드 뷰가 차지하는 영역만큼만 크기를 가지도록 설정
                physics: NeverScrollableScrollPhysics(), // 그리드 뷰의 스크롤 기능을 비활성화

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 한 행에 10개의 그리드 아이템
                  crossAxisSpacing: 10, // 가로 방향 간격
                  mainAxisSpacing: 10, // 세로 방향 간격
                  childAspectRatio: 1, // 아이템의 가로세로 비율을 1로 설정하여 정사각형 만들기
                ),
                itemCount: day.length, // 생성할 아이템의 총 개수
                itemBuilder: (context, index) {
                  // 각 아이템의 빌더
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${day[index]}',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(157, 157, 157, 1)),
                        ),
                        SizedBox(
                          height: 12,
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
