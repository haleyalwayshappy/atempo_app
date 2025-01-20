import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  /* Firebase에서 모든 다이어리 가져오기 */
  Future<List<Map<String, dynamic>>> fetchAllDiariesFromFirebase(
      String uid) async {
    try {
      // Firestore에서 다이어리 데이터 가져오기
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('diaries')
          .orderBy('dateTime', descending: true) // 날짜 기준 내림차순 정렬
          .get();

      return querySnapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    } catch (e) {
      print("Error fetching diaries: $e");
      throw Exception('fetch diaries error');
    }
  }

  /* 월 별 다이어리 리스트 불러오기  */
  Future<List<Map<String, dynamic>>> fetchDiariesByMonth({
    required int year,
    required int month,
    required String uid,
  }) async {
    try {
      // 해당 달의 시작 날짜와 다음 달의 시작 날짜 계산
      DateTime startOfMonth = DateTime(year, month, 1);
      DateTime startOfNextMonth = DateTime(year, month + 1, 1);

      // Firestore 쿼리
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('diaries')
          .where('dateTime', isGreaterThanOrEqualTo: startOfMonth)
          .where('dateTime', isLessThan: startOfNextMonth)
          .orderBy('dateTime', descending: true) // 내림차순 정렬
          .get();

      return querySnapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    } catch (e) {
      print("Error fetching diaries by month: $e");
      throw Exception('diary fetch error');
    }
  }

  // 일기 수정 전 문서 찾기
  Future<bool> findDocument(String userId, String diaryId) async {
    try {
      DocumentSnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('diaries')
          .doc(diaryId)
          .get();

      return querySnapshot.exists;
    } catch (e) {
      print("Error find diary document for edit diary : $e");
      throw Exception('diary document find error');
    }
  }

  /* 일기 수정 */
  Future<bool> updateDiary({
    required String userId,
    required String diaryId,
    required Diary updatedDiary,
  }) async {
    try {
      // Firestore 문서가 존재하는지 확인
      bool exists = await findDocument(userId, diaryId);
      if (!exists) {
        print("Diary document not found: ${updatedDiary.diaryId}");
        return false; // 문서가 없는 경우
      }

      // 다이어리 데이터를 Firestore에 업데이트
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('diaries')
          .doc(diaryId) // 업데이트할 다이어리 ID
          .update(updatedDiary.toMap());

      return true; // 성공 반환
    } catch (e) {
      print("Failed to update diary : $e");
      return false; // 실패 반환
    }
  }

  /* 일기 저장 */
  Future<bool> saveDiary(String userId, Diary diary) async {
    try {
      // 다이어리 데이터 변환
      Map<String, dynamic> diaryData = diary.toMap();

      // 다이어리 ID가 없으면 자동 생성 (Firestore에서 문서 ID를 생성)
      if (diary.diaryId == null) {
        DocumentReference docRef = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('diaries')
            .add(diaryData); // 새 문서 추가 및 ID 생성

        diary.diaryId = docRef.id; // 생성된 ID를 Diary 객체에 반영'
        await docRef.update({'diaryId': docRef.id});
      } else {
        // 다이어리 ID가 있으면 해당 문서 업데이트
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('diaries')
            .doc(diary.diaryId)
            .set(diaryData); // 기존 문서에 데이터 저장
      }

      print("Diary saved successfully with ID: ${diary.diaryId}");

      return true; // 성공 반환
    } catch (e) {
      // print("Diary saved failed : $e");
      throw Exception("Failed to save diary : $e");
    }
  }

  /* 일기 보관로직 */
  Future<bool> updateIsShow(String userId, String diaryId, bool isShow) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('diaries')
          .doc(diaryId)
          .update({'isShow': isShow}); // Firestore에서 isShow 필드 업데이트

      print("isShow updated successfully for Diary ID: $diaryId");
      return true; // 성공 반환
    } catch (e) {
      if (e is FirebaseException && e.code == 'not-found') {
        print("Diary not found for ID: $diaryId");
      } else {
        print("Failed to update isShow: $e");
      }
      return false; // 실패 반환
    }
  }
}
