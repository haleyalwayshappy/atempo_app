import 'package:flutter/material.dart';

import 'music_list_screen.dart';

class MusicMainScreen extends StatelessWidget {
  const MusicMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyTable(),
    );
  }
}

class MyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('1x5 Table Example')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
    ㅌ          ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MusicListScreen(),
                    ),
                  );
                },
                child: Text("페이지 이동"),
              ),
              Table(
                border: TableBorder.all(), // 테두리 추가
                // border: TableBorder(
                //   horizontalInside: BorderSide.none, // 내부 수평 테두리 없음
                //   verticalInside: BorderSide.none, // 내부 수직 테두리 없음
                //   top: BorderSide(width: 1, color: Colors.black), // 상단 테두리
                //   bottom: BorderSide(width: 1, color: Colors.black), // 하단 테두리
                //   left: BorderSide.none, // 왼쪽 테두리 없음
                //   right: BorderSide.none, // 오른쪽 테두리 없음
                // ),
                columnWidths: {
                  0: FixedColumnWidth(50), // 첫 번째 열
                  1: FixedColumnWidth(50), // 두 번째 열
                  2: FixedColumnWidth(150), // 세 번째 열 (길게)
                  3: FixedColumnWidth(50), // 네 번째 열
                  4: FixedColumnWidth(50), // 다섯 번째 열
                },
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Cell 1',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Text('Cell 2'),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Text('Cell 3'),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Text('Cell 4'),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Text('Cell 5'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Cell 1',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Text('Cell 2'),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Text('Cell 3'),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Text('Cell 4'),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Text('Cell 5'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
