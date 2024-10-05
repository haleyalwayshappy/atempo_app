import 'package:atempo_app/model/music_data.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

/// 음악 추천 박스
class RecommendBox extends StatelessWidget {
  const RecommendBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // 수평 스크롤 설정
      child: Row(
        // 가로
        children: List.generate(
          4,
          (index) {
            return Container(
              margin: EdgeInsets.only(right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // 컨테이너 안에 데코레이션 박스에 이미지 넣음
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/day6_bg2.jpeg'),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Text(
                    "음악 타이틀",
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
