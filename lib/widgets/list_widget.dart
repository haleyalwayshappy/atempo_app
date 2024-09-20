import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/screens/diary/diary_read_screen.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomListWidget extends StatelessWidget {
  final String dateTime; // 날짜
  final String imagePath; // 아이콘 이미지
  final int index; // 인덱스 값

  CustomListWidget({
    super.key,
    required this.dateTime,
    required this.imagePath,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(dummyDiaryData[index].dateTime);
        context.go('/diary/${dummyDiaryData[index].indexNumber}');
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.09, // 전체사이즈의 0.9
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: mGrey4Color, // 테두리 색상
              width: .3, // 테두리 두께
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              // 좌측 여백
              width: 8,
            ),
            Image.asset(
              // 이미지
              imagePath,
              width: 50,
            ),
            SizedBox(
              // 이미지와 날짜에 대한 여백
              width: 20,
            ),
            Text(
              // 날짜
              dateTime,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: mFontDarkColor),
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
