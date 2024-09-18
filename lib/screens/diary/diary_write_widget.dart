import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

class DiaryWriteWidget extends StatefulWidget {
  final String labelText;
  final int? maxLength; // 옵셔널
  final String hintText;
  final TextInputType keyboardType;
  final ValueChanged<String?>? onChanged; // 옵셔널

  const DiaryWriteWidget({
    super.key,
    required this.labelText,
    this.maxLength,
    required this.hintText,
    this.keyboardType = TextInputType.text, // 기본값 설정
    this.onChanged,
  });

  @override
  _DiaryWriteWidgetState createState() => _DiaryWriteWidgetState();
}

class _DiaryWriteWidgetState extends State<DiaryWriteWidget> {
  FocusNode focusNode = FocusNode(); // FocusNode 생성

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {}); // 포커스 상태가 변경될 때마다 UI 업데이트
    });
  }

  @override
  void dispose() {
    focusNode.dispose(); // FocusNode 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(outlinedDouble),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: focusNode.hasFocus
              ? mSecondaryColor
              : Colors.black, // 포커스 상태에 따른 보더 색상
          width: focusNode.hasFocus ? 2 : 1, // 포커스 상태에 따른 보더 두께
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: mFontDarkColor,
              letterSpacing: -0.88,
            ),
          ),
          TextField(
            focusNode: focusNode, // FocusNode 연결
            autocorrect: false, // 자동 수정기능 비활성화
            enableSuggestions: false, // 제안기능 비활성화
            maxLength: widget.maxLength, // 글자수 제한
            keyboardType: widget.keyboardType, // 키보드 타입 설정
            cursorColor: mPrimaryColor, // 커서 색상
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              letterSpacing: -0.4,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: -0.4,
                color: mGrey2Color,
              ),
              border: InputBorder.none, // 기본 보더 제거
            ),
          ),
        ],
      ),
    );
  }
}

//TextField(
//             autocorrect: false, // 자동 수정기능 비활성화
//             enableSuggestions: false, // 제안기능 비활성화
//             maxLength: widget.maxLength, // 글자수 제한
//             keyboardType: widget.keyboardType, // 키보드 타입 설정
//             cursorColor: mPrimaryColor, // 커서 색상
//             style: TextStyle(
//               fontWeight: FontWeight.w400,
//               fontSize: 16,
//               letterSpacing: -0.4,
//             ),
//             decoration: InputDecoration(
//               hintText: widget.hintText,
//               hintStyle: TextStyle(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 16,
//                 letterSpacing: -0.4,
//                 color: mGrey2Color,
//               ),
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: mDarkGreenColor, width: 1.4),
//               ),
//               enabledBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.black, width: 1),
//               ),
//             ),
//           ),
