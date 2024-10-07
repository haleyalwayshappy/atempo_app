import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String buttonText; // 버튼 텍스트
  final VoidCallback onPressed; // 클릭 이벤트

  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: mFontLightColor,
        backgroundColor: mPrimaryColor, // 텍스트 색상
        elevation: 1.4, // 그림자 깊이
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // 모서리 둥글기
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(
          buttonText,
          style: TextStyle(
            // color: mFontDarkColor,
            fontFamily: "Pretendard",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.4,
          ),
        ),
      ),
    );
  }
}

// return GestureDetector(
//   onTap: onPressed,
//   child: Stack(
//     alignment: Alignment.center, // 텍스트를 중앙에 배치
//     children: [
//       Container(
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/button_green_short.png'),
//             fit: BoxFit.cover,
//           ),
//           // borderRadius: BorderRadius.circular(10),
//         ),
//         child: Text(
//           buttonText,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             // backgroundColor: Colors.black54, // 텍스트 배경
//           ),
//         ),
//       ),
//     ],
//   ),
// );
/// 사용 예시
/*
class ImageButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Button Example')),
      body: Center(
        child: ImageButton(
          buttonText: '버튼 텍스트',
          onPressed: () {
            // 버튼 클릭 시 동작
            print("Image button clicked!");
          },
        ),
      ),
    );
  }
}
*/
