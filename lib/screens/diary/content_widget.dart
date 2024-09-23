import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

// 일기 상세 콘텐츠화면
class ContentWidget extends StatefulWidget {
  final String labelText;
  final int? maxLength; // 옵셔널
  final String hintText;
  final TextInputType keyboardType;
  final ValueChanged<String?>? onChanged; // 옵셔널

  const ContentWidget({
    super.key,
    required this.labelText,
    this.maxLength,
    required this.hintText,
    this.keyboardType = TextInputType.text, // 기본값 설정
    this.onChanged,
  });

  @override
  _ContentWidgetState createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(focusNode); // Request focus on tap
      },
      child: Container(
        padding: const EdgeInsets.all(outlinedDouble),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: focusNode.hasFocus
              ? mLightGreenColor
              : Colors.transparent, // Blue background when focused
          border: focusNode.hasFocus
              ? null
              : Border.all(
                  color: mPrimaryColor), // Border only when not focused
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.labelText,
              style: TextStyle(
                fontFamily: 'Santteut',
                fontWeight: FontWeight.w600,
                fontSize: 16,
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
                fontFamily: 'Santteut',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                letterSpacing: -0.4,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontFamily: 'Santteut',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  letterSpacing: -0.4,
                  color: mGrey1Color,
                ),
                border: InputBorder.none, // 기본 보더 제거
              ),
            ),
          ],
        ),
      ),
    );
  }
}
