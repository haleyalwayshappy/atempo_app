import 'package:flutter/material.dart';

import '../utils/constants.dart';

class EmotionPopupWidget extends StatelessWidget {
  const EmotionPopupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(outlinedDouble),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: mSecondaryColor, width: 4),
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
    );
  }
}
