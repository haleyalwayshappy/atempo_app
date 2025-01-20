import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:atempo_app/controller/account/app_user_controller.dart';
import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../service/firestore_service.dart';

class DiaryController extends GetxController {
  final fsService;

  DiaryController(this.fsService);

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

  @override
  void onInit() {
    print("일기 정보 로딩중");
    super.onInit();
    fetchAllDiariesFromFirebase(); // 다이어리 데이터 로드
  }
  /** 가져오기 */

  /// 다이어리 전체 정보 가져오기
  Future<void> fetchAllDiariesFromFirebase() async {
    // 일기 값이 이미 로드 되었다면
    if (isDiariesLoaded) {
      print("다이어리가 이미 로드 됨. 리패치를 스킵한다.");
      return;
    } else {
      try {
        isLoading.value = true; // 로딩 시작
        String uid = userController.getUserdata().uid; // 사용자 UID

        //resultMap에 다이어리 값 담기
        List<Map<String, dynamic>> resultMap =
            await fsService.fetchAllDiariesFromFirebase(uid);
        diaryList.value =
            resultMap.map((value) => Diary.fromMap(value)).toList();
        isDiariesLoaded = true; // 로드 완료
      } catch (e) {
        print("Error fetching all diaries from firebase : $e");
        throw Exception("Error fetching all diaries from firebase : $e");
      } finally {
        isLoading.value = false;
      }
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
      List<Map<String, dynamic>> resultMap =
          await fsService.fetchDiariesByMonth(
        year: year,
        month: month,
        uid: uid,
      );
      diaryList.value = resultMap.map((value) => Diary.fromMap(value)).toList();
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

    try {
      bool isSuccess = await fsService.updateDiary(
        userId: userId,
        diaryId: diaryId,
        updatedDiary: updatedDiary,
      );

      if (isSuccess) {
        // 목록을 다시 로드
        isDiariesLoaded = false;
        await fetchAllDiariesFromFirebase();
      }

      return isSuccess; // 성공 반환
    } catch (e) {
      customToastMsg("일기 수정에 실패했습니다: $e");
      print("일기 수정 실패: $e");
      return false; // 실패 반환
    }
  }

  /// isShow 업데이트 호출
  Future<bool> updateIsShow(String diaryId, bool isShow) async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      customToastMsg("로그인이 필요합니다.");
      return false;
    }

    try {
      bool success = await fsService.updateIsShow(userId, diaryId, isShow);

      if (success) {
        print("Diary visibility updated successfully.");
      }

      return success;
    } catch (e) {
      customToastMsg("isShow 업데이트에 실패했습니다: $e");
      return false;
    }
  }

/**
 * 저장
 * */

  ///TODO Diary frommap
  /// Diary 데이터 저장 메서드
  Diary getDiary() {
    return Diary(
      diaryId: selectedDiary.value?.diaryId, // 기존 Diary ID 유지
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
      isShow: isShow.value,
    );
  }

  /// 일기 저장
  Future<bool> saveDiary(Diary diary) async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      customToastMsg("로그인이 필요합니다.");
      return false;
    }

    try {
      bool success = await fsService.saveDiary(userId, diary);

      if (success) {
        isDiariesLoaded = false; // 목록 로드 상태 초기화
        await fetchAllDiariesFromFirebase(); // 목록 갱신
      }

      return success;
    } catch (e) {
      customToastMsg("일기 저장에 실패했습니다: $e");
      return false;
    } finally {
      isDiariesLoaded = true; // 작업 종료 후 항상 로드 완료 상태로 변경
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
