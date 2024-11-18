import 'package:atempo_app/screens/music/widget/best_box_card.dart';
import 'package:atempo_app/screens/music/widget/music_title_text.dart';
import 'package:atempo_app/screens/widgets/recommend_box.dart';
import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;
    // final double itemHeight = screenWidth * 0.2; // Make the height proportional

    const String pathName = "music";
    int listNum;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MusicTitleText(
            musicTitle: '테마 음악',
            bottom: 0,
          ),
          SingleChildScrollView(
            // bestbox card
            scrollDirection: Axis.horizontal, // 수평 스크롤 설정
            child: Row(
              children: [
                // for (var content in music_screen.Playlist)
                BestBoxCard(
                  // 중괄호 제거
                  width: 340,
                  height: 200,
                  titleText: "titleText",
                  subTitleText: "content.subTitleText",
                  imageUrl: "music_bg2.png",
                  onTap: () {
                    customToastMsg("버튼 클릭함");
                    listNum = 1;
                    context.go('/music/list/music1');
                  },
                ),
              ],
            ),
          ),

          // 기쁨
          MusicTitleText(
            musicTitle: '춤추고 싶을때',
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: RecommendBox(), // recommendBoxCard
          ),
        ],
      ),
    );
  }
}
