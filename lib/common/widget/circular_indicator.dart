import 'package:flutter/material.dart';
import 'package:git_commit/my/app_theme.dart';

class MyCircularProgressIndicator extends StatelessWidget {
  const MyCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(AppColor.k15e853),
      backgroundColor: Colors.black,
      strokeWidth: 10,
    );
  }
}
