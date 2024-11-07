import 'package:flutter/material.dart';

class CustomFloatingButton extends StatefulWidget {
  const CustomFloatingButton({super.key});

  @override
  _CustomFloatingActionButtonState createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState extends State<CustomFloatingButton> {
  // 사용자가 선택한 형식을 저장할 변수
  String? selectedFormat;

  // 일기 형식 리스트
  final List<String> formats = ['텍스트', '이미지', '음성', '비디오'];

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showDiaryFormatDialog(context),
      backgroundColor: Colors.blue, // 버튼을 눌렀을 때 다이얼로그 호출
      child: Icon(Icons.menu),
    );
  }

  // 다이얼로그를 띄워서 일기 형식을 선택하는 함수
  Future<void> _showDiaryFormatDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('일기 형식을 선택하세요'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: formats.map((format) {
              return RadioListTile<String>(
                title: Text(format),
                value: format,
                groupValue: selectedFormat,
                onChanged: (String? value) {
                  setState(() {
                    selectedFormat = value;
                  });
                  Navigator.of(context).pop(); // 선택 후 다이얼로그 닫기
                },
              );
            }).toList(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: Text('취소'),
            ),
          ],
        );
      },
    );
    // 선택한 형식 출력
    if (selectedFormat != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('선택한 형식: $selectedFormat')),
      );
    }
  }
}
