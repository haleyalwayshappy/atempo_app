import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

class MusicListTile extends StatelessWidget {
  const MusicListTile(
      {super.key,
      required this.musicTitle,
      required this.musicSubTitle,
      required this.musicImage,
      required this.musicTimeStamp});

  final String musicTitle;
  final String musicImage;
  final String musicSubTitle;
  final String musicTimeStamp;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            // 컨테이너 안에 데코레이션 박스에 이미지 넣음
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/$musicImage'),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.blue,
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    musicTitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: mPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    musicSubTitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: mSecondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text(
              musicTimeStamp,
              style: TextStyle(
                fontSize: 14,
                color: mPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
