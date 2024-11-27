import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:atempo_app/controller/account/app_user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    setDiaryContents(['', '', '', '', '']);
    selectedDiary.value = null;
    showMaxSelectionWarning.value = false;
  }

  /// 날짜 업데이트
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
      print("Diaries already loaded. Skipping re-fetch.");
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
          .get();

      // 쿼리 결과를 Diary 객체로 변환
      diaryList.value = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Diary.fromMap(data); // Diary.fromMap 사용
      }).toList();

      isDiariesLoaded = true; // 로드 완료
      print("Fetched ${diaryList.length} diaries.");
    } catch (e) {
      print("Error fetching diaries: $e");
    } finally {
      isLoading.value = false; // 로딩 완료
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
      setDiaryContents([
        diary.content1 ?? '',
        diary.content2 ?? '',
        diary.content3 ?? '',
        diary.content4 ?? '',
        diary.content5 ?? '',
      ]);
      print("Loaded diary with ID: $diaryId");
    } else {
      print("Diary with ID $diaryId not found. Resetting state.");
      resetDiaryState();
    }
  }

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
      content3: content3.value,
      content4: content4.value,
      content5: content5.value,
    );
  }

  // 일기 저장
  Future<void> saveDiaryToFirebase(Diary diary) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userController.getUserdata().uid)
          .collection('diaries')
          .doc(diary.diaryId ?? userId.value)
          .set(diary.toMap());
      print("Diary saved successfully!");
    } catch (e) {
      print("Failed to save diary: $e");
    }
  }

  /// 다이어리 질문 내용 관리
  RxnString content1 = RxnString();
  RxnString content2 = RxnString();
  RxnString content3 = RxnString();
  RxnString content4 = RxnString();
  RxnString content5 = RxnString();

  List<String> get diaryContents => [
        content1.value ?? '',
        content2.value ?? '',
        content3.value ?? '',
        content4.value ?? '',
        content5.value ?? '',
      ];

  void setDiaryContents(List<String> contents) {
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
}