import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;
  final double iconSize;

  // 생성자에서 필요한 값을 전달받음
  CustomFloatingActionButton({
    this.backgroundColor = Colors.blue,
    this.iconColor = Colors.white,
    this.icon = Icons.add,
    this.iconSize = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // 일기 작성 페이지로 이동
        context.go('/diary/write');
      },
      // 전달받은 onPressed 함수
      backgroundColor: backgroundColor,
      shape: CircleBorder(),
      elevation: 2.4,
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
