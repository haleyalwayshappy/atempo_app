import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomCardWidget extends StatelessWidget {
  final DateTime dateTime; // 날짜
  final String imagePath; // 아이콘 이미지
  final String diaryId; // 일기 id

  const CustomCardWidget({
    super.key,
    required this.dateTime,
    required this.imagePath,
    required this.diaryId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // UUID를 URL 파라미터로 사용하여 특정 일기 데이터로 이동
        context.go('/diary/read/$diaryId');
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.085, // 전체 사이즈 비율 설정
        decoration: BoxDecoration(
          border: Border(
              // 테두리 추가 가능
              ),
        ),
        child: Row(
          children: [
            SizedBox(width: 28), // 좌측 여백
            Image.asset(imagePath, width: 40), // 이미지 아이콘
            SizedBox(width: 20), // 이미지와 텍스트 사이의 여백
            Text(
              "${dateTime.year}년 ${dateTime.month.toString().padLeft(2, '0')}월 ${dateTime.day.toString().padLeft(2, '0')}일", // 날짜 포맷
              style: TextStyle(
                fontFamily: 'Santteut',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: mFontDarkColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
