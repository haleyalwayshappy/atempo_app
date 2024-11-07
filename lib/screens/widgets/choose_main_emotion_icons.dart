import 'package:atempo_app/screens/home/widget/animated_angry_Image.dart';
import 'package:atempo_app/screens/home/widget/animated_confused_Image.dart';
import 'package:atempo_app/screens/home/widget/animated_joy_Image.dart';
import 'package:atempo_app/screens/home/widget/animated_peace_Image.dart';
import 'package:atempo_app/screens/home/widget/animated_sad_Image.dart';
import 'package:flutter/material.dart';

import 'package:atempo_app/model/emotion_data.dart'; // MainEmotion enum이 정의된 곳

class ChooseMainEmotionIcons extends StatelessWidget {
  final Function(MainEmotion) onIconTap;

  ChooseMainEmotionIcons({required this.onIconTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        children: [
          Positioned(
            right: 51,
            top: 64,
            child: GestureDetector(
              onTap: () => onIconTap(MainEmotion.sad),
              child: AnimatedSadImage(
                image: 'assets/images/main_emotion/icon_sadness.png',
                width: 120,
              ),
            ),
          ),
          Positioned(
            right: 23,
            top: 197,
            child: GestureDetector(
              onTap: () => onIconTap(MainEmotion.joy),
              child: AnimatedJoyImage(
                image: 'assets/images/main_emotion/icon_joy_y.png',
                width: 120,
              ),
            ),
          ),
          Positioned(
            left: 147,
            bottom: 15,
            child: GestureDetector(
              onTap: () => onIconTap(MainEmotion.peaceful),
              child: AnimatedPeaceImage(
                image: 'assets/images/main_emotion/icon_peaceful.png',
                width: 120,
              ),
            ),
          ),
          Positioned(
            left: 65,
            top: 55,
            child: GestureDetector(
              onTap: () => onIconTap(MainEmotion.angry),
              child: AnimatedAngryImage(
                image: 'assets/images/main_emotion/icon_angry.png',
                width: 120,
              ),
            ),
          ),
          Positioned(
            left: 30,
            top: 183,
            child: GestureDetector(
              onTap: () => onIconTap(MainEmotion.confused),
              child: AnimatedConfusedImage(
                image: 'assets/images/main_emotion/icon_confuse.png',
                width: 120,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
