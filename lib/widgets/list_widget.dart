import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  var dateTime;
  var imagePath;
  ListWidget(
      {super.key,
      DiaryListWidget,
      required this.dateTime,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: mGrey2Color, // 테두리 색상
            width: .3, // 테두리 두께
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 8,
          ),
          Image.asset(
            imagePath,
            width: 50,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            dateTime,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: mFontDarkColor),
          ),
        ],
      ),
    );
  }
}
