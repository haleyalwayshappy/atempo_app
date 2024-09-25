import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

class MusicThemeTitle extends StatelessWidget {
  final String musicTitle;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  const MusicThemeTitle({
    super.key,
    required this.musicTitle,
    this.top = 20.0,
    this.bottom = 8.0,
    this.left = 20.0,
    this.right = 0.0, // double 타입에 맞춰 0.0으로 변경
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: top ?? 0.0, // null일 경우 기본값 사용
        bottom: bottom ?? 0.0,
        left: left ?? 0.0,
        right: right ?? 0.0,
      ),
      child: Text(
        musicTitle,
        style: TextStyle(
          fontSize: 16,
          color: mPrimaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
