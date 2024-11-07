import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

class BestBoxCard extends StatelessWidget {
  final double width;
  final double height;
  final String titleText;
  final String subTitleText;
  final String imageUrl;
  final VoidCallback? onTap;
  const BestBoxCard(
      {super.key,
      required this.width,
      required this.height,
      required this.titleText,
      required this.subTitleText,
      required this.imageUrl,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        width: width,
        height: height,
        child: Stack(
          children: [
            // 배경화면 컨테이너
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/images/$imageUrl'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            // 반투명 배경 컨테이너
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Colors.black, // 시작 색상
                    Colors.transparent, // 끝 색상
                  ],
                  end: Alignment.topCenter, // 그라데이션 시작 위치
                  begin: Alignment.bottomCenter, // 그라데이션 끝 위치
                ),
              ),
            ),

            // 타이틀 내용
            Positioned(
              bottom: 44, // 아래부터 40픽셀
              right: 18, // 오른쪽분터 10픽셀
              child: Text(
                titleText,
                style: TextStyle(
                  color: mFontLightColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // 설명
            Positioned(
              bottom: 18, // 아래부터 10픽셀
              right: 18, // 오른쪽부터 10픽셀
              child: Text(
                subTitleText,
                style: TextStyle(
                  color: mFontLightColor,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
