import 'package:atempo_app/model/music_dummydata.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

class RecommendBox extends StatelessWidget {
  const RecommendBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // 수평 스크롤 설정
      child: Row(
        children: List.generate(
          musicItems.length,
          (index) {
            return Container(
              margin: EdgeInsets.only(right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(musicItems[index]['image']!),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Text(
                    musicItems[index]['text']!,
                    style: TextStyle(
                      fontSize: 12,
                      color: mSecondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
