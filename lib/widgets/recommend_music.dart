import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

class RecommendMusic extends StatelessWidget {
  const RecommendMusic({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> musicItems = [
      // index : "1" , image: "
      {
        'index': '1',
        'image': 'assets/images/maru1.jpeg',
        'text': 'Musssssic 1'
      },
      {'index': '2', 'image': 'assets/images/maru2.jpeg', 'text': 'Music 2'},
      {'index': '3', 'image': 'assets/images/maru3.jpeg', 'text': 'Music 3'},
      {'index': '4', 'image': 'assets/images/maru4.jpeg', 'text': 'Music 4'},
      {'index': '5', 'image': 'assets/images/maru1.jpeg', 'text': 'Music 5'},
    ];

    return Container(
      // color: Colors.purple,
      width: double.infinity,
      height: 170,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: musicItems.length,
        itemBuilder: (context, idx) {
          var imageRoute = musicItems[idx]['image'];
          var musicTexts = musicItems[idx]['text'];
          return Container(
            color: Colors.blue,
            margin: EdgeInsets.only(left: outlinedDouble, top: outlinedDouble),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    width: 120,
                    height: 120,
                    imageRoute!,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  musicTexts!,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
