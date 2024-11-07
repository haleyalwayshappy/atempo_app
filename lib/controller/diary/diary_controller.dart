import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:atempo_app/controller/account/app_user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DiaryController extends GetxController {
  final AppUserController userController = Get.find<AppUserController>();

  // Diary 모델 필드들을 Rx로 선언
  RxString userId = ''.obs;
  RxnString diaryId = RxnString();
  RxInt diaryType = 0.obs;
  Rx<DateTime> dateTime = DateTime.now().obs;
  Rx<MainEmotion> mainEmotion = MainEmotion.joy.obs;
  RxList<DetailEmotion> subEmotions =
      <DetailEmotion>[].obs; // List of DetailEmotion
  RxnString content1 = RxnString();
  RxnString content2 = RxnString();
  RxnString content3 = RxnString();
  RxnString content4 = RxnString();
  RxnString content5 = RxnString();
  RxBool showMaxSelectionWarning = false.obs;

  // 서브 감정 선택 관련 필드
  RxList<Emotion> selectedChips = <Emotion>[
    detailEmotionInfo[DetailEmotion.happy]!
  ].obs; // 기본 선택으로 happy 추가

// 저장된 Diary 모델 생성 함수
  Diary getDiary() {
    return Diary(
      userId: userController.getUserdata().uid,
      diaryType: diaryType.value,
      dateTime: dateTime.value,
      mainEmotion: mainEmotion.value,
      subEmotion: subEmotions, // 다중 선택 감정 반영
      content1: content1.value,
      content2: content2.value,
      content3: content3.value,
      content4: content4.value,
      content5: content5.value,
    );
  }

  // 감정 선택 로직
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

  // 필드 업데이트 메소드
  void updateUserId(String newUserId) {
    userId.value = newUserId;
  }

  void updateMainEmotion(MainEmotion newEmotion) {
    mainEmotion.value = newEmotion;
  }

  void updateDateTime(DateTime newDate) {
    dateTime.value = newDate;
  }

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

  // 다이어리 타입 설정 함수 (필요시 호출하여 타입 업데이트 가능)
  void setDiaryType(int type) {
    diaryType.value = type;
  }

  // 메인 감정에 따른 imageUrl 가져오기
  String? getMainEmotionImageUrl(MainEmotion emotion) {
    final matchingEmotion = mainEmotions.firstWhere(
      (e) => e.mainEmotion == emotion,
      orElse: () => mainEmotions.first,
    );
    return matchingEmotion.imageUrl;
  }

  // 세부 감정에 따른 imageUrl 가져오기
  String? getDetailEmotionImageUrl(DetailEmotion emotion) {
    return detailEmotionInfo[emotion]?.imageUrl;
  }

  // 현재 로그인된 사용자 ID 불러오기
  Future<void> _fetchUserId() async {
    ///
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId.value = user.uid; // 로그인된 사용자의 UID를 userId로 설정
    } else {
      // 로그인되지 않은 경우 처리 (예: 로그인 페이지로 이동)
      print("User is not logged in.");
    }
  }

  // Firebase에 일기 저장하기
  Future<void> saveDiaryToFirebase(Diary diary) async {
    try {
      await FirebaseFirestore.instance
          .collection('diaries')
          .doc(diary.diaryId ?? userId.value)
          .set(diary.toMap()); // Diary 모델에 toMap 메소드 구현 필요
      print("Diary saved successfully!");
    } catch (e) {
      print("Failed to save diary: $e");
    }
  }
}
