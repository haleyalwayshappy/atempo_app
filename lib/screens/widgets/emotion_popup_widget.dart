import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class EmotionPopupWidget extends StatelessWidget {
  const EmotionPopupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // customToastMsg("감정상태창 눌렀따아");
        context.go('/choice_emotion');
      },
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 28),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: mSecondaryColor,
          border: Border.all(color: mSecondaryColor, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // color: Colors.blue,
              // alignment: Alignment.center,
              padding: EdgeInsets.only(left: 20),
              child: SizedBox(
                width: 40,
                child: Image.asset('assets/images/icon/icon_peaceful.png'),
              ),
            ),
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                "반짝거리는 너를 응원해!",
                style: TextStyle(
                  // backgroundColor: Colors.green,
                  color: mFontDarkColor,
                  fontFamily: 'Santteut',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  overflow: TextOverflow.visible,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
* import 'package:atempo_app/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/constants.dart';

class EmotionPopupWidget extends StatelessWidget {
  const EmotionPopupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // customToastMsg("감정상태창 눌렀따아");
        context.go('/choice_emotion');
      },
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 28),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: mSecondaryColor,
          // border: Border.all(color: mSecondaryColor, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // color: Colors.blue,
              // alignment: Alignment.center,
              padding: EdgeInsets.only(left: 20),
              child: SizedBox(
                width: 40,
                child: Image.asset('assets/images/icon/icon_joy_y.png'),
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    right: 20,
                    bottom: 2, // 텍스트와 겹치게 하기 위해 위치 조정
                    child: Container(
                      height: 13, // 밑줄의 두께
                      width: 180, // 밑줄의 길이 (원하는 길이로 조정)
                      color: mJoyColor, // 밑줄 색상
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "반짝거리는 너를 응원해!",
                    style: TextStyle(
                      // backgroundColor: Colors.green,
                      color: mFontDarkColor,
                      fontFamily: 'Santteut',
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                      overflow: TextOverflow.visible,
                      letterSpacing: 1.1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/