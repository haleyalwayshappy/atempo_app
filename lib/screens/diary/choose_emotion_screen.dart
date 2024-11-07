import 'package:atempo_app/model/emotion_data.dart';
import 'package:atempo_app/model/emotions_copy.dart';
import 'package:atempo_app/screens/account/create_account_screen.dart';
import 'package:atempo_app/screens/diary/widget/choose_main_emotion.dart';
import 'package:atempo_app/screens/diary/widget/choose_sub_emotion.dart';
import 'package:atempo_app/screens/diary/widget/choose_sub_text.dart';
import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ChooseEmotionScreen extends StatefulWidget {
  const ChooseEmotionScreen({super.key});

  @override
  State<ChooseEmotionScreen> createState() => _ChooseEmotionScreenState();
}

class _ChooseEmotionScreenState extends State<ChooseEmotionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ChooseMainEmotion(),
            // ChooseSubEmotion(),
            ChooseSubText(),
          ],
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
)*/

/*
*
* ListView.builder(
          itemCount: mainEmotionDetails.keys.length,
          itemBuilder: (context, index) {
            final mainEmotion = mainEmotionDetails.keys.elementAt(index);
            final detailEmotions = mainEmotionDetails[mainEmotion] ?? [];

            return ExpansionTile(
              title: Text(
                  mainEmotion.toString().split('.').last), // MainEmotion 이름
              children: detailEmotions.map<Widget>((detailEmotion) {
                final emotionDetail = detailEmotionsInfo[detailEmotion];
                if (emotionDetail == null) return SizedBox.shrink();

                return ListTile(
                  leading: Image.asset(emotionDetail.imageUrl,
                      width: 40, height: 40), // 이미지
                  title: Text(emotionDetail.title), // 제목
                  subtitle: Text(emotionDetail.context), // 설명
                );
              }).toList(),
            );
          },
        ),*/
