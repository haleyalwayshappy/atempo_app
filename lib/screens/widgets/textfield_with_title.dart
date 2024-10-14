import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWithTitle extends StatefulWidget {
  final String labelText;
  final int? maxLength; // 옵셔널
  final String hintText;
  final TextInputType keyboardType;
  final bool isCupertinoPicker;
  final List<String>? pickerItems; // 옵셔널
  final String? selectedValue; // 옵셔널
  final ValueChanged<String?>? onChanged; // 옵셔널

  const TextFieldWithTitle({
    super.key,
    required this.labelText,
    this.maxLength,
    required this.hintText,
    this.keyboardType = TextInputType.text, // 기본값 설정
    this.isCupertinoPicker = false, // 기본값 설정
    this.pickerItems,
    this.onChanged,
    this.selectedValue,
  });

  @override
  _TextFieldWithTitleState createState() => _TextFieldWithTitleState();
}

class _TextFieldWithTitleState extends State<TextFieldWithTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: mFontDarkColor,
            // letterSpacing: -0.45,
            // letterSpacing: -0.88,
          ),
        ),
        TextField(
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
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: mDarkGreenColor, width: 1.4),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: mGrey4Color, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
