import 'package:atempo_app/screens/music/widget/best_box_card.dart';
import 'package:atempo_app/screens/music/widget/music_title_text.dart';
import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

class AudiobookScreen extends StatelessWidget {
  const AudiobookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int listNum;
    const String pathName = "audiobook";
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MusicTitleText(
            musicTitle: "추천 오디오 북 리스트",
            bottom: 0,
            left: 12.0,
          ),
          Center(
            child: BestBoxCard(
              // 중괄호 제거
              width: screenWidth,
              height: 200,
              titleText: "하루를 다스리는 법",
              subTitleText: "마음이 평화로워지는 보이스",
              imageUrl: 'image_back2.jpg',
              onTap: () {
                customToastMsg("오디오북 재생목록");
              },
            ),
          ),
          MusicTitleText(
            musicTitle: "Best 오디오 북",
            top: 10,
            bottom: 0,
            left: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 그리드 열의 수
                crossAxisSpacing: 10, // 항목 간의 가로 간격
                childAspectRatio: 1 / 1.2, // 항목의 가로/세로 비율
              ),
              physics: NeverScrollableScrollPhysics(), // GridView 자체 스크롤 비활성화
              shrinkWrap: true, // 스크롤이 가능한 영역만큼 크기를 맞춤
              itemCount: 8, // 그리드 항목의 개수
              itemBuilder: (context, index) {
                // 더미 데이터
                return CustomGridItem(
                  imageUrl: 'assets/images/image_back4.jpg',
                  title: '계곡 따라 떠나는 산책길',
                  subtitle: '짧지만 달콤한 오후의 단잠',
                  hashtags: ['우울', '행복'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

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

class GridToAudioWidget extends StatelessWidget {
  const GridToAudioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 5, left: 5, right: 5),
      padding: EdgeInsets.only(left: 5),
      width: 100,
      height: 100,
      child: Stack(
        children: [
          // 이미지 컨테이너
          Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/day6_bg2.jpeg'),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          // 반투명 배경 컨테이너
          Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
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

          // 첫 번째 텍스트 (크기 24)
          Positioned(
            bottom: 30, // 아래에서 40픽셀
            right: 2, // 오른쪽에서 10픽셀
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              // color: Colors.black54, // 반투명 배경
              child: Text(
                "May I be happy?", // 원하는 텍스트
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14, // 크기 24
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // 두 번째 텍스트 (크기 16)
          Positioned(
            bottom: 10, // 아래에서 10픽셀
            right: 5, // 오른쪽에서 10픽셀
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              // color: Colors.black54, // 반투명 배경
              child: Text(
                "happy", // 원하는 텍스트
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12, // 크기 16
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    ); // 이미지 반환
  }
}
