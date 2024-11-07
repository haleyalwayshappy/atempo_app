import 'package:atempo_app/model/emotion_data.dart';
import 'package:atempo_app/model/emotions_copy.dart';
import 'package:atempo_app/screens/account/create_account_screen.dart';
import 'package:atempo_app/screens/diary/widget/choose_main_emotion.dart';
import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ChooseSubEmotion extends StatefulWidget {
  const ChooseSubEmotion({super.key});

  @override
  State<ChooseSubEmotion> createState() => _ChooseSubEmotionState();
}

class _ChooseSubEmotionState extends State<ChooseSubEmotion> {
  bool isExpanded = false; // 전체 감정 표시 여부

  @override
  Widget build(BuildContext context) {
    // 처음 5개 또는 전체 감정 리스트 표시
    final displayedEmotions = isExpanded
        ? detailEmotionInfo.values.toList()
        : detailEmotionInfo.values.take(5).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border:
              Border.all(color: Colors.grey, width: 2), // GridView를 감싸는 보더 설정
          borderRadius: BorderRadius.circular(12), // 전체 컨테이너의 둥근 모서리
        ),
        child: SizedBox(
          height: 400, // GridView 높이를 원하는 값으로 조절
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, // 한 줄에 보여줄 이미지 개수
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: detailEmotionInfo.length,
            itemBuilder: (context, index) {
              final emotionDetail = detailEmotionInfo.values.elementAt(index);

              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(emotionDetail.imageUrl,
                              width: 80, height: 80),
                          SizedBox(height: 16),
                          Text(
                            emotionDetail.title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(emotionDetail.context),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text("닫기"),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(emotionDetail.imageUrl,
                        width: 50, height: 50),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/*
Padding(
padding: const EdgeInsets.all(8.0),
child: Container(
decoration: BoxDecoration(
border: Border.all(
color: Colors.grey, width: 2), // GridView를 감싸는 보더 설정
borderRadius: BorderRadius.circular(12), // 전체 컨테이너의 둥근 모서리
),
child: SizedBox(
height: 400, // GridView 높이를 원하는 값으로 조절
child: GridView.builder(
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 5, // 한 줄에 보여줄 이미지 개수
mainAxisSpacing: 8,
crossAxisSpacing: 8,
),
itemCount: detailEmotionInfo.length,
itemBuilder: (context, index) {
final emotionDetail =
detailEmotionInfo.values.elementAt(index);

return GestureDetector(
onTap: () {
showDialog(
context: context,
builder: (_) => AlertDialog(
content: Column(
mainAxisSize: MainAxisSize.min,
children: [
Image.asset(emotionDetail.imageUrl,
width: 80, height: 80),
SizedBox(height: 16),
Text(
emotionDetail.title,
style: TextStyle(
fontSize: 20,
fontWeight: FontWeight.bold),
),
SizedBox(height: 8),
Text(emotionDetail.context),
],
),
actions: [
TextButton(
onPressed: () => Navigator.of(context).pop(),
child: Text("닫기"),
),
],
),
);
},
child: Container(
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(8),
),
child: Padding(
padding: const EdgeInsets.all(4.0),
child: Image.asset(emotionDetail.imageUrl,
width: 50, height: 50),
),
),
);
},
),
),
),
)
*/

/*
* Expanded(
      child: Theme(
        // 위아래 경계선을 보이지 않기 위해
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            "세부 감정",
            style: TextStyle(
                color: mPrimaryColor,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          collapsedIconColor: mPrimaryColor,
          onExpansionChanged: (expanded) {
            setState(() {
              isExpanded = expanded; // ExpansionTile이 펼쳐질 때 전체 리스트 표시
            });
          },
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3, color: mPrimaryColor)),
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0, // 가로 간격
                runSpacing: 8.0, // 세로 간격
                children: displayedEmotions.map((emotion) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(emotion.imageUrl,
                                  width: 80, height: 80),
                              SizedBox(height: 16),
                              Text(
                                emotion.title,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(emotion.context),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text("닫기"),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          emotion.imageUrl,
                          width: 60,
                        ),
                        SizedBox(height: 4),
                        Text(
                          emotion.title,
                          style: TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );*/
