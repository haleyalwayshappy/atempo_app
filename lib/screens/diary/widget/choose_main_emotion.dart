import 'package:atempo_app/model/emotion_data.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ChooseMainEmotion extends StatelessWidget {
  const ChooseMainEmotion({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(
          "메인 감정",
          style: TextStyle(
              color: mPrimaryColor,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        collapsedIconColor: mPrimaryColor,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: mainEmotions.map((emotion) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(emotion.imageUrl,
                                width: 80, height: 80),
                            SizedBox(height: 16),
                            Text(emotion.title,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(height: 8),
                            Text(emotion.context),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("닫기"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Image.asset(
                    emotion.imageUrl,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
