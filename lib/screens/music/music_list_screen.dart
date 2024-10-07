import 'package:atempo_app/screens/music/widget/music_box_widget.dart';
import 'package:atempo_app/screens/music/widget/music_list_tile.dart';
import 'package:atempo_app/screens/music/widget/music_title_text.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:atempo_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MusicListScreen extends StatelessWidget {
  final String pathName;

  const MusicListScreen({
    super.key,
    required this.pathName,
  });

  @override
  Widget build(BuildContext context) {
    String titleText;

    // pathName에 따른 titleText 설정
    switch (pathName) {
      case 'music1':
        titleText = '기분이 좋을땐 이노랠 들어요';
        break;
      case 'music2':
        titleText = 'Music 2';
        break;
      case 'music3':
        titleText = 'Music 3';
        break;
      case 'audiobook1':
        titleText = 'Audiobook 1';
        break;
      case 'audiobook2':
        titleText = 'Audiobook 2';
        break;
      case 'audiobook3':
        titleText = 'Audiobook 3';
        break;
      default:
        titleText = 'Default Title';
        break;
    }
    return Scaffold(
      appBar: CustomAppBar(titleText: ""),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/image_back4.jpg'),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  // 반투명 배경 컨테이너
                  Container(
                    decoration: BoxDecoration(
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
                ],
              ),
            ),
            MusicTitleText(
              musicTitle: titleText,
              fontSize: 20,
            ),
            MusicBoxWidget(
              musicTitle: "드라이브하다가 만난 염소",
              musicSubTitle: '기분 좋을때 듣는 음악',
              musicImage: 'image_back3.jpg',
              musicTimeStamp: '2:30',
            ),
            MusicBoxWidget(
              musicTitle: "잠자는 고양이의 배를 만졌을 때",
              musicSubTitle: '기분 좋을때 듣는 음악',
              musicImage: 'image_back4.jpg',
              musicTimeStamp: '2:30',
            ),
            MusicBoxWidget(
              musicTitle: "낮잠자고 일어났을 때",
              musicSubTitle: '기분 좋을때 듣는 음악',
              musicImage: 'image_back.jpg',
              musicTimeStamp: '2:30',
            ),
            MusicBoxWidget(
              musicTitle: "할머니가 건네주시는 따듯한 고구마",
              musicSubTitle: '기분 좋을때 듣는 음악',
              musicImage: 'image_back2.jpg',
              musicTimeStamp: '2:30',
            ),
            MusicBoxWidget(
              musicTitle: "말없이 품에 안기는 너",
              musicSubTitle: '기분 좋을때 듣는 음악',
              musicImage: 'image_back3.jpg',
              musicTimeStamp: '2:30',
            ),
            MusicBoxWidget(
              musicTitle: "드라이브하다가 만난 염소",
              musicSubTitle: '기분 좋을때 듣는 음악',
              musicImage: 'image_back4.jpg',
              musicTimeStamp: '2:30',
            ),
          ],
        ),
      ),
    );
  }
}
