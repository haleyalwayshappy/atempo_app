import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

// 일기 상세 콘텐츠 화면
class ContentWidget extends StatefulWidget {
  final String labelText;
  final int? maxLength; // 글자수 제한 (옵셔널)
  final String hintText;
  final TextInputType keyboardType;
  final ValueChanged<String?>? onChanged; // 값 변경 콜백
  final String? initialValue; // 초기값

  const ContentWidget({
    super.key,
    required this.labelText,
    this.maxLength,
    required this.hintText,
    this.keyboardType = TextInputType.text, // 기본값
    this.onChanged,
    this.initialValue,
  });

  @override
  _ContentWidgetState createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  late TextEditingController _controller; // TextEditingController 생성
  FocusNode focusNode = FocusNode(); // FocusNode 생성

  @override
  void initState() {
    super.initState();
    // TextEditingController 초기화
    _controller = TextEditingController(text: widget.initialValue);

    // Focus 상태 리스너 등록
    focusNode.addListener(() {
      setState(() {}); // Focus 상태 변경 시 UI 업데이트
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // 컨트롤러 해제
    focusNode.dispose(); // FocusNode 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(focusNode); // 텍스트 필드에 포커스
      },
      child: Container(
        padding: const EdgeInsets.all(outlinedDouble),
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
              controller: _controller, // TextEditingController 연결
              focusNode: focusNode, // FocusNode 연결
              minLines: 1,
              maxLines: null,
              autocorrect: false,
              enableSuggestions: false,
              maxLength: widget.maxLength,
              keyboardType: widget.keyboardType,
              cursorColor: mPrimaryColor,
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
                border: InputBorder.none, // 보더 제거
              ),
              onChanged: widget.onChanged, // 값 변경 콜백 연결
            ),
          ],
        ),
      ),
    );
  }
}
