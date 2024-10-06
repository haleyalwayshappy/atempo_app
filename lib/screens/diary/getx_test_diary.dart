// import 'package:atempo_app/create_dummy_to_firebase.dart';
// import 'package:atempo_app/model/diary_data.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:atempo_app/model/emotion_data.dart';
//
// class GetxTestDiary extends StatelessWidget {
//   GetxTestDiary({Key? key}) : super(key: key);
//
//   // GetX 컨트롤러 인스턴스
//   final DiaryController diaryController = Get.put(DiaryController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Diary with GetX"),
//       ),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               // 더미 데이터의 첫 번째 엔트리 저장
//               Diary entry = dummyDiaryData[0];
//               diaryController.addDiary(entry);
//             },
//             child: const Text('Save Diary Entry'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               // Firestore에서 데이터 불러오기
//               diaryController.fetchDairy();
//             },
//             child: const Text('Fetch Diary Entries'),
//           ),
//           Expanded(
//             child: Obx(() {
//               // diaryEntries 리스트가 업데이트될 때마다 화면이 다시 렌더링됨
//               if (diaryController.diaryEntries.isEmpty) {
//                 return const Center(child: Text('No diary entries found.'));
//               }
//               return ListView.builder(
//                 itemCount: diaryController.diaryEntries.length,
//                 itemBuilder: (context, index) {
//                   var entry = diaryController.diaryEntries[index];
//                   return ListTile(
//                     title: Text(entry.content1 ?? 'No content'),
//                     subtitle: Text(entry.mainEmotion.toString()),
//                   );
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }
