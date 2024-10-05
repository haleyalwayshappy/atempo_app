import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// TODO : 타이밍 이슈
/// 오버라이드 위에   final indexN = dummyDiaryData[index].indexNumber; 값을 넣으면 안되고
/// 오버라이드 안에 넣으면 된다.

class CustomCardWidget extends StatelessWidget {
  final DateTime dateTime; // 날짜
  final String imagePath; // 아이콘 이미지
  final int index; // 인덱스 값

  const CustomCardWidget({
    super.key,
    required this.dateTime,
    required this.imagePath,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Diary indexN = dummyDiaryData[index];
    return GestureDetector(
      onTap: () {
        context.go('/diary/read/$indexN');
      },
      child: Container(
        height: MediaQuery.of(context).size.height *
            0.085, // 전체사이즈의 0.09는 너무 큼 그래서 0.085 로...
        decoration: BoxDecoration(
          border: Border(
              // 밑줄
              // bottom: BorderSide(
              //   color: mGrey4Color, // 테두리 색상
              //   width: .3, // 테두리 두께
              // ),
              ),
        ),
        child: Row(
          children: [
            SizedBox(width: 28), // 좌측 여백
            Image.asset(imagePath, width: 40), // 이미지
            SizedBox(width: 20), // 이미지와 날짜에 대한 여백
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

//
// return GestureDetector(
// onTap: () {
// // go_router를 사용하여 DiaryReadScreen으로 이동
// context.go(
// '/diary/${dummyDiaryData[index].indexNumber}'); // indexNumber를 URL 파라미터로 사용
// },
// child: CustomListWidget(
// dateTime: dummyDiaryData[index].dateTime,
// imagePath: imagePath,
// index: index,
// ),
// );
