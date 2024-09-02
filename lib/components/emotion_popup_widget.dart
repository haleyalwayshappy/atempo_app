import 'package:flutter/material.dart';

import '../constants/constants.dart';

class EmotionPopupWidget extends StatelessWidget {
  const EmotionPopupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: mPrimaryColor, width: 4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            child: Image.asset('assets/images/icon_joy.png'),
          ),
          Text(
            "오늘 기분 해피이~!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}