import 'package:atempo_app/controller/diary/diary_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/screens/widgets/toast.dart';

class DiaryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DiaryController diaryController = Get.find<DiaryController>();

  // Firestore에 다이어리 저장 메서드
  // Firestore에 다이어리 저장 메서드
  Future<bool> saveDiaryToFirestore(Diary diary) async {
    String? userId = _auth.currentUser?.uid;

    if (userId == null) {
      customToastMsg("로그인이 필요합니다.");
      return false; // 실패 반환
    }

    Diary diary = diaryController.getDiary();

    Map<String, dynamic> diaryData = {
      'dateTime': diary.dateTime,
      'mainEmotion': diary.mainEmotion.toString(),
      'subEmotion': diary.subEmotion?.map((e) => e.toString()).toList(),
      'content1': diary.content1,
      'content2': diary.content2,
      'content3': diary.content3,
      'content4': diary.content4,
      'content5': diary.content5,
      'diaryType': diary.diaryType,
    };

    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('diaries')
          .add(diaryData);
      return true; // 성공 반환
    } catch (e) {
      customToastMsg("일기 저장에 실패했습니다: $e");
      print("일기 저장 실패: $e");
      return false; // 실패 반환
    }
  }
}
