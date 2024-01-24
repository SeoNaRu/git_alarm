import 'package:flutter/material.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 36,
            ),
            SizedBox(
              child: Text(
                '설정',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(157, 157, 157, 1)),
              ),
            ),
            SizedBox(
              height: 96,
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(157, 157, 157, 0.5),
                    width: 0,
                  ),
                )),
            SizedBox(
              height: 18,
            ),
            Text(
              '내 정보',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(157, 157, 157, 1)),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(157, 157, 157, 0.5),
                    width: 0,
                  ),
                )),
            SizedBox(
              height: 18,
            ),
            Text(
              '서비스 소개',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(157, 157, 157, 1)),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(157, 157, 157, 0.5),
                    width: 0,
                  ),
                )),
            SizedBox(
              height: 18,
            ),
            Text(
              '공지 사항',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(157, 157, 157, 1)),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(157, 157, 157, 0.5),
                    width: 0,
                  ),
                )),
            SizedBox(
              height: 18,
            ),
            Text(
              '함께 한 팀원들',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(157, 157, 157, 1)),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(157, 157, 157, 0.5),
                    width: 0,
                  ),
                )),
            SizedBox(
              height: 18,
            ),
            Text(
              '로그아웃',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(157, 157, 157, 1)),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(157, 157, 157, 0.5),
                    width: 0,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
