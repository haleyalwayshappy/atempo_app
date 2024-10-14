import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProceedWithoutActionButton extends StatelessWidget {
  final String text;
  const ProceedWithoutActionButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customToastMsg("홈으로 가는 버튼");
        context.go('/home');
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontFamily: "Pretendard",
          fontWeight: FontWeight.normal,
          color: mGrey2Color,
        ),
      ),
    );
  }
}
