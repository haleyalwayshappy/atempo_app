import 'package:atempo_app/model/playlist_data.dart' as music_screen;
import 'package:atempo_app/screens/music/widget/best_box_card.dart';
import 'package:atempo_app/screens/music/widget/music_list_tile.dart';
import 'package:atempo_app/screens/music/widget/music_title_text.dart';
import 'package:atempo_app/screens/music/widget/music_box_widget.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:atempo_app/widgets/custom_app_bar.dart';
import 'package:atempo_app/widgets/recommend_box.dart';
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
                  imageUrl: "image_back2.jpg",
                  onTap: () {
                    listNum = 1;
                    context.go('/home/music/list/${pathName}${listNum}');
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
