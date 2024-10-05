import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomGridItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final List<String> hashtags;

  const CustomGridItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.hashtags,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150, // 이미지의 높이를 설정합니다.
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8), // 이미지와 텍스트 사이의 간격
        // 해시태그 표시
        Row(
          children: hashtags
              .map(
                (tag) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    '#$tag',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        // 제목 텍스트
        Text(
          title,
          style: TextStyle(
            color: mFontDarkColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
