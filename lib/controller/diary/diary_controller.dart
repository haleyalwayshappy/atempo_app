import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:atempo_app/controller/account/app_user_controller.dart';
import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DiaryController extends GetxController {
  @override
  void onInit() {
    print("일기 정보 로딩중");
    super.onInit();
    fetchAllDiariesFromFirebase(); // 다이어리 데이터 로드
  }

  final AppUserController userController = Get.find<AppUserController>();

  // 상태 관리 변수들
  RxString userId = ''.obs; // 유저 아이디
  RxnString diaryId = RxnString(); // 다이어리 고유 아이디
  RxInt diaryType = 0.obs; // 다이어리 타입 (0: 5개 질문, 1: 자유일기, 2: 365 질문)
  Rx<DateTime> dateTime = DateTime.now().obs; // 날짜
  Rx<MainEmotion> mainEmotion = MainEmotion.joy.obs; // 메인 감정
  RxList<DetailEmotion> subEmotions = <DetailEmotion>[].obs; // 세부 감정
  RxList<Diary> diaryList = <Diary>[].obs; // 일기 데이터 리스트
  Rxn<Diary> selectedDiary = Rxn<Diary>(); // 선택된 Diary
  RxBool isLoading = true.obs;

  /// 다이어리 질문 내용 관리
  RxnString content1 = RxnString();
  RxnString content2 = RxnString();
  RxnString content3 = RxnString();
  RxnString content4 = RxnString();
  RxnString content5 = RxnString();
  RxBool isShow = true.obs;

  // 세부 감정 선택 관련
  RxList<Emotion> selectedChips =
      <Emotion>[detailEmotionInfo[DetailEmotion.happy]!].obs;
  RxBool showMaxSelectionWarning = false.obs;

  // Firebase 데이터 로드 여부
  bool isDiariesLoaded = false;

  /// 상태 초기화 메서드
  void resetDiaryState() {
    diaryId.value = null;
    diaryType.value = 0;
    dateTime.value = DateTime.now();
    mainEmotion.value = MainEmotion.joy;
    subEmotions.clear();
    _setDiaryContents(['', '', '', '', '']);
    selectedDiary.value = null;
    showMaxSelectionWarning.value = false;
  }

  /**
   * 가져오기
   * */
  /// 메인 감정에 따른 imageUrl 가져오기
  String? getMainEmotionImageUrl(MainEmotion emotion) {
    final matchingEmotion = mainEmotions.firstWhere(
      (e) => e.mainEmotion == emotion,
      orElse: () => mainEmotions.first,
    );
    return matchingEmotion.imageUrl;
  }

  /// Firebase에서 모든 다이어리 가져오기
  Future<void> fetchAllDiariesFromFirebase() async {
    if (isDiariesLoaded) {
      print("다이어리가 이미 로드 됨. 리패치를 스킵한다.");
      print("${isShow}");
      return;
    }

    try {
      isLoading.value = true; // 로딩 시작
      String uid = userController.getUserdata().uid; // 사용자 UID
      print("Fetching diaries for userId: $uid");

      // Firestore에서 다이어리 데이터 가져오기
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('diaries')
          .orderBy('dateTime', descending: true) // 날짜 기준 내림차순 정렬
          .get();

      // 쿼리 결과를 Diary 객체로 변환
      diaryList.value = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Diary.fromMap(data); // Diary.fromMap 사용
      }).toList();

      isDiariesLoaded = true; // 로드 완료
      print(
          "Fetched all diaries -------- \n ${diaryList.value} \n -----------");
    } catch (e) {
      print("Error fetching diaries: $e");
    } finally {
      isLoading.value = false; // 로딩이 이미 완료되어 있음
    }
  }

  /// Diary ID로 특정 다이어리 로드
  void loadDiary(String diaryId) {
    final diary = diaryList.firstWhereOrNull((d) => d.diaryId == diaryId);

    if (diary != null) {
      // 일기 데이터 상태에 반영
      selectedDiary.value = diary;
      userId.value = diary.userId;
      diaryType.value = diary.diaryType;
      updateDateTime(diary.dateTime); // 날짜 업데이트
      mainEmotion.value = diary.mainEmotion;
      subEmotions.assignAll(diary.subEmotion ?? []);
      _setDiaryContents([
        diary.content1 ?? '',
        diary.content2 ?? '',
        diary.content3 ?? '',
        diary.content4 ?? '',
        diary.content5 ?? '',
      ]);
      print("Loaded diary show? = $isShow");
    } else {
      print("Diary with ID $diaryId not found. Resetting state.");
      resetDiaryState();
    }
  }

  /// Firebase에서 특정 달의 다이어리 가져오기
  Future<void> fetchDiariesByMonth(int year, int month) async {
    try {
      isLoading.value = true; // 로딩 상태 시작
      String uid = userController.getUserdata().uid;

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

      // 결과를 diaryList로 저장
      diaryList.value = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Diary.fromMap(data);
      }).toList();

      print("isShow value after dismissal: ${isShow}");

      print("Fetched ${diaryList.length} diaries for $year-$month.");
    } catch (e) {
      print("Error fetching diaries by month: $e");
    } finally {
      isLoading.value = false; // 로딩 상태 종료
    }
  }

  /**
   *  업데이트
   * */
  /// 날짜 변경
  void updateDateTime(DateTime newDate) {
    dateTime.value = newDate;
    print("Diary date updated to: $newDate");
  }

  /// 메인감정 업데이트
  void updateMainEmotion(MainEmotion newEmotion) {
    mainEmotion.value = newEmotion;
  }

  /// 일기 내용 업데이트
  void updateContent(int index, String newContent) {
    switch (index) {
      case 1:
        content1.value = newContent;
        break;
      case 2:
        content2.value = newContent;
        break;
      case 3:
        content3.value = newContent;
        break;
      case 4:
        content4.value = newContent;
        break;
      case 5:
        content5.value = newContent;
        break;
    }
  }

  /// 감정 선택 토글
  void toggleChipSelection(Emotion emotion) {
    final detailEmotion = emotion.detailEmotion;
    if (subEmotions.contains(detailEmotion)) {
      subEmotions.remove(detailEmotion);
    } else {
      if (subEmotions.length < 5) {
        subEmotions.add(detailEmotion!);
        showMaxSelectionWarning.value = false;
      } else {
        showMaxSelectionWarning.value = true;
      }
    }
  }

  // 일기 수정
  Future<bool> updateDiary(Diary updatedDiary) async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      customToastMsg("로그인이 필요합니다.");
      return false; // 실패 반환
    }

    if (updatedDiary.diaryId == null || updatedDiary.diaryId!.isEmpty) {
      print("Diary ID가 없습니다. 업데이트할 수 없습니다.");
      return false; // 실패 반환
    }

    try {
      // Firestore 문서가 존재하는지 확인
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('diaries')
          .doc(updatedDiary.diaryId)
          .get();

      if (!doc.exists) {
        print("Document not found: ${updatedDiary.diaryId}");
        return false; // 문서가 없는 경우 처리
      }

      // 다이어리 데이터를 Firestore에 업데이트
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('diaries')
          .doc(updatedDiary.diaryId) // 업데이트할 다이어리 ID
          .update(updatedDiary.toMap());

      print("Diary updated successfully with ID: ${updatedDiary.diaryId}");

      // 목록을 다시 로드
      isDiariesLoaded = false;
      await fetchAllDiariesFromFirebase();

      return true; // 성공 반환
    } catch (e) {
      customToastMsg("일기 수정에 실패했습니다: $e");
      print("일기 수정 실패: $e");
      return false; // 실패 반환
    }
  }

  // 숨기기 활성화
  Future<bool> updateIsShow(String diaryId, bool isShow, String userId) async {
    try {
      // Firestore에서 isShow 필드만 업데이트
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('diaries')
          .doc(diaryId)
          .update({'isShow': isShow}); // isShow 값만 업데이트

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

/**
 * 저장
 * */

  /// Diary 데이터 저장 메서드
  Diary getDiary() {
    return Diary(
      userId: userController.getUserdata().uid,
      diaryType: diaryType.value,
      dateTime: dateTime.value,
      mainEmotion: mainEmotion.value,
      subEmotion: subEmotions,
      content1: content1.value,
      content2: content2.value,
      content4: content4.value,
      content5: content5.value,
      isShow: isShow.value,
    );
  }

  /// 일기 저장
  Future<bool> saveDiary(Diary diary) async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      customToastMsg("로그인이 필요합니다.");
      return false; // 실패 반환
    }

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
        diary.diaryId = docRef.id; // 생성된 ID를 Diary 객체에 반영
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

      isDiariesLoaded = false; // 다이어리 로드값을 false(로드 이전) 로 변경해준다.
      // 저장 후 다이어리 목록 갱신
      await fetchAllDiariesFromFirebase();

      return true; // 성공 반환
    } catch (e) {
      customToastMsg("일기 저장에 실패했습니다: $e");
      print("일기 저장 실패: $e");
      return false; // 실패 반환
    } finally {
      isDiariesLoaded = true; // 값을 로드 완료 상태로 변경
    }
  }

  List<String> get diaryContents => [
        content1.value ?? '',
        content2.value ?? '',
        content3.value ?? '',
        content4.value ?? '',
        content5.value ?? '',
      ];

  // ?
  void _setDiaryContents(List<String> contents) {
    if (contents.length != 5) {
      print("Invalid diary contents length. Expected 5 items.");
      return;
    }
    content1.value = contents[0];
    content2.value = contents[1];
    content3.value = contents[2];
    content4.value = contents[3];
    content5.value = contents[4];
  }
}
