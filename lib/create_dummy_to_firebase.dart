// import 'package:atempo_app/model/diary_data.dart';
// import 'package:atempo_app/model/emotion_data.dart';
// import 'package:atempo_app/model/music_data.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:uuid/uuid.dart';
//
// class DiaryController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final RxList<Diary> diaryEntries = <Diary>[].obs; // Getx의 reactive 리스트
//
//   Future<void> addDiary(Diary diary) async {
//     try {
//       await _firestore.collection('diaries').add({
//         'indexNumber': diary.userId,
//         'mainEmotion': diary.mainEmotion.toString(), // 감정 타입을 문자열로 변환
//         'subEmotion': diary.subEmotion.toString(),
//         'content1': diary.content1,
//         'content2': diary.content2,
//         'content3': diary.content3,
//         'content4': diary.content4,
//         'content5': diary.content5,
//         'dateTime': diary.dateTime,
//       });
//       print("다이어리 add");
//     } catch (e) {
//       print("다이어리 add 실패ㅠㅠ : $e");
//     }
//   }
//
//   Future<void> fetchDairy() async {
//     try {
//       // 다이어리 데이터를 읽어옴
//       QuerySnapshot snapshot = await _firestore.collection('diaries').get();
//       var dairies = snapshot.docs.map((doc) {
//         var data = doc.data() as Map<String, dynamic>;
//         return Diary(
//           userId: data['indexNumber'],
//           // mainEmotion: 문자열을 enum으로 변환 (Firebase에서 문자열로 저장된 값을 enum으로 변환)
//           mainEmotion: MainEmotion.values.firstWhere((e) =>
//           e
//               .toString()
//               .split('.')
//               .last == data['mainEmotion']),
//
//           // subEmotion: 문자열을 SubEmotion enum으로 변환 (null 값 처리도 포함)
//           subEmotion: data['subEmotion'] != null
//               ? SubEmotion.values.firstWhere((e) =>
//           e
//               .toString()
//               .split('.')
//               .last == data['subEmotion'])
//               : null,
//
//           content1: data['content1'],
//           content2: data['content2'],
//           content3: data['content3'],
//           content4: data['content4'],
//           content5: data['content5'],
//
//           // Firestore에서 가져온 Timestamp를 DateTime으로 변환
//           dateTime: (data['dateTime'] as Timestamp).toDate(),
//         );
//       }).toList();
//       diaryEntries.assignAll(dairies); // getx의 리엑티브 리스트 업데이트
//     }catch(e){
//       print("다이어리 불러오기 실패 ㅜㅜ $e");
//     }
//     }
//   }
//
//   class MusicService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   // 더미 데이터를 생성하고 Firestore에 저장
//   Future<void> uploadDummyMusicData() async {
//   List<Music> dummyData = _createDummyMusicData();
//
//   for (var music in dummyData) {
//   await _firestore.collection('music').add(music.toMap());
//   }
//   }
//
//   // 더미 데이터 생성
//   List<Music> _createDummyMusicData() {
//   return [
//   Music(
//   musicImgUrl: 'https://example.com/image1.jpg',
//   musicTitle: 'Music 1',
//   musicDescription: 'Description for Music 1',
//   runningTime: DateTime.now().add(Duration(minutes: 3)),
//   musicUrl: 'https://example.com/music1.mp3',
//   ),
//   Music(
//   musicImgUrl: 'https://example.com/image2.jpg',
//   musicTitle: 'Music 2',
//   musicDescription: 'Description for Music 2',
//   runningTime: DateTime.now().add(Duration(minutes: 4)),
//   musicUrl: 'https://example.com/music2.mp3',
//   ),
//   Music(
//   musicImgUrl: 'https://example.com/image3.jpg',
//   musicTitle: 'Music 3',
//   musicDescription: 'Description for Music 3',
//   runningTime: DateTime.now().add(Duration(minutes: 5)),
//   musicUrl: 'https://example.com/music3.mp3',
//   ),
//   Music(
//   musicImgUrl: 'https://example.com/image4.jpg',
//   musicTitle: 'Music 4',
//   musicDescription: 'Description for Music 4',
//   runningTime: DateTime.now().add(Duration(minutes: 6)),
//   musicUrl: 'https://example.com/music4.mp3',
//   ),
//   Music(
//   musicImgUrl: 'https://example.com/image5.jpg',
//   musicTitle: 'Music 5',
//   musicDescription: 'Description for Music 5',
//   runningTime: DateTime.now().add(Duration(minutes: 3)),
//   musicUrl: 'https://example.com/music5.mp3',
//   ),
//   Music(
//   musicImgUrl: 'https://example.com/image6.jpg',
//   musicTitle: 'Music 6',
//   musicDescription: 'Description for Music 6',
//   runningTime: DateTime.now().add(Duration(minutes: 4)),
//   musicUrl: 'https://example.com/music6.mp3',
//   ),
//   Music(
//   musicImgUrl: 'https://example.com/image7.jpg',
//   musicTitle: 'Music 7',
//   musicDescription: 'Description for Music 7',
//   runningTime: DateTime.now().add(Duration(minutes: 5)),
//   musicUrl: 'https://example.com/music7.mp3',
//   ),
//   Music(
//   musicImgUrl: 'https://example.com/image8.jpg',
//   musicTitle: 'Music 8',
//   musicDescription: 'Description for Music 8',
//   runningTime: DateTime.now().add(Duration(minutes: 6)),
//   musicUrl: 'https://example.com/music8.mp3',
//   ),
//   Music(
//   musicImgUrl: 'https://example.com/image9.jpg',
//   musicTitle: 'Music 9',
//   musicDescription: 'Description for Music 9',
//   runningTime: DateTime.now().add(Duration(minutes: 3)),
//   musicUrl: 'https://example.com/music9.mp3',
//   ),
//   Music(
//   musicImgUrl: 'https://example.com/image10.jpg',
//   musicTitle: 'Music 10',
//   musicDescription: 'Description for Music 10',
//   runningTime: DateTime.now().add(Duration(minutes: 4)),
//   musicUrl: 'https://example.com/music10.mp3',
//   ),
//   ];
//   }
//   }
