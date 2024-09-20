import 'package:atempo_app/widgets/toast.dart';
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
        // color: Colors.blue,
        child: Container(
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
                padding: EdgeInsets.only(right: 20),
                child: SizedBox(
                  width: 40,
                  child: Image.asset('assets/images/icon/icon_joy_y.png'),
                ),
              ),
              Expanded(
                child: Text(
                  "당신의 하루가 행복했으면 좋겠어요.",
                  style: TextStyle(
                    color: mFontDarkColor,
                    fontFamily: 'Santteut',
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                    overflow: TextOverflow.visible,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
