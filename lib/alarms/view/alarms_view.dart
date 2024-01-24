import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmsView extends StatefulWidget {
  const AlarmsView({super.key});

  @override
  State<AlarmsView> createState() => AalarmViewsState();
}

class AalarmViewsState extends State<AlarmsView> {
  bool isChecked = true;
  bool issChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 36,
            ),
            const SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '알림 등록',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(157, 157, 157, 1)),
                  ),
                  Row(
                    children: [
                      Text(
                        '편집',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(157, 157, 157, 1)),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        '추가',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(157, 157, 157, 1)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              '알림을 등록하여',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(157, 157, 157, 1)),
            ),
            Text(
              '꾸준한 커밋 습관을 만들어봐요!',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(157, 157, 157, 1)),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(157, 157, 157, 0.5),
                  width: 0,
                ),
              ),
            ),
            SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '오후 10:30',
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(157, 157, 157, 1)),
                      ),
                      Text(
                        '월, 화, 수, 목, 금',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(157, 157, 157, 1)),
                      ),
                    ],
                  ),
                  CupertinoSwitch(
                    value: isChecked,
                    activeColor: Color.fromRGBO(157, 157, 157, 1),
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(157, 157, 157, 0.5),
                  width: 0,
                ),
              ),
            ),
            SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '오후 2:30',
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(157, 157, 157, 1)),
                      ),
                      Text(
                        '토, 일',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(157, 157, 157, 1)),
                      ),
                    ],
                  ),
                  CupertinoSwitch(
                    value: issChecked,
                    activeColor: Color.fromRGBO(157, 157, 157, 1),
                    onChanged: (bool? value) {
                      setState(() {
                        issChecked = value ?? false;
                      });
                    },
                  ),
                ],
              ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
