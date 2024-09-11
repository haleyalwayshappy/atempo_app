import 'package:atempo_app/widgets/toast.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class EmotionPopupWidget extends StatelessWidget {
  const EmotionPopupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customToastMsg("감정상태창 눌렀따아");
      },
      child: Container(
        // margin: EdgeInsets.all(outlinedDouble),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: mFontLightColor,
          border: Border.all(color: mSecondaryColor, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              child: Image.asset('assets/images/icon/icon_joy_y.png'),
            ),
            Text(
              "오늘 기분 해피이~!",
              style: mDiaryStyle,
            ),
          ],
        ),
      ),
    );
  }
}
