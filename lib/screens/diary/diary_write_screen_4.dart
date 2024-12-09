import 'package:atempo_app/controller/diary/diary_controller.dart';
import 'package:atempo_app/model/diary_data.dart';
import 'package:atempo_app/model/emotion_data.dart';
import 'package:atempo_app/screens/diary/widget/choose_sub_text.dart';
import 'package:atempo_app/screens/diary/widget/content_widget.dart';
import 'package:atempo_app/screens/widgets/choose_main_emotion_icons.dart';
import 'package:atempo_app/screens/widgets/toast.dart';
import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class DiaryWriteScreen4 extends StatefulWidget {
  bool isReadOnly;
  final String? diaryId;

  DiaryWriteScreen4({
    super.key,
    this.isReadOnly = false,
    this.diaryId,
  });

  @override
  State<DiaryWriteScreen4> createState() => _DiaryWriteScreen4State();
}

class _DiaryWriteScreen4State extends State<DiaryWriteScreen4> {
  final DiaryController diaryController = Get.find<DiaryController>();

  @override
  void initState() {
    super.initState();

    if (widget.isReadOnly && widget.diaryId != null) {
      // 읽기 모드에서 일기 로드
      diaryController.loadDiary(widget.diaryId!);
    } else if (!widget.isReadOnly) {
      // 작성 모드에서 상태 초기화
      diaryController.resetDiaryState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: GestureDetector(
          onTap: widget.isReadOnly
              ? null
              : () {
                  // 날짜 선택 모달
                  DateTime tempDate = diaryController.dateTime.value;
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SafeArea(
                        child: Container(
                          color: mBackgroundColor,
                          height: 350,
                          child: Column(
                            children: [
                              Expanded(
                                child: CupertinoDatePicker(
                                  backgroundColor: mBackgroundColor,
                                  mode: CupertinoDatePickerMode.date,
                                  initialDateTime:
                                      diaryController.dateTime.value,
                                  maximumDate: DateTime.now(),
                                  onDateTimeChanged: (value) {
                                    tempDate = value;
                                  },
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  diaryController.updateDateTime(tempDate);
                                  Navigator.pop(context);
                                },
                                child: const Text("확인"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
          child: Obx(() {
            final selectedDate = diaryController.dateTime.value;
            final formattedDate =
                "${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일";
            return Text(
              formattedDate,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: "Santteut",
                fontWeight: FontWeight.normal,
                color: mPrimaryColor,
              ),
            );
          }),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              context.go('/my_page');
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: mFontDarkColor),
          onPressed: () {
            widget.isReadOnly ? context.go('/diary') : context.pop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: widget.isReadOnly
                ? () => _showEditDialog(context)
                : null, // 수정 모드가 아닐 때 터치로 다이얼로그 표시
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: widget.isReadOnly
                            ? null
                            : () {
                                // 메인 감정 선택 모달
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Column(
                                      children: [
                                        Expanded(
                                          child: ChooseMainEmotionIcons(
                                            onIconTap: (MainEmotion emotion) {
                                              diaryController
                                                  .updateMainEmotion(emotion);
                                              customToastMsg("$emotion 선택됨!");
                                            },
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("확인"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                        child: Obx(() {
                          final selectedMainEmotion =
                              diaryController.mainEmotion.value;
                          final imageUrl = diaryController
                              .getMainEmotionImageUrl(selectedMainEmotion);
                          return Image.asset(
                            width: 120,
                            '$imageUrl',
                          );
                        }),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            Obx(() {
                              return Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: diaryController.subEmotions
                                    .map((detailEmotion) {
                                  final emotion =
                                      detailEmotionInfo[detailEmotion];
                                  if (emotion == null) {
                                    return const SizedBox.shrink();
                                  }
                                  return Chip(
                                    label: Text(emotion.title),
                                    backgroundColor:
                                        emotion.emotionColor.withOpacity(0.2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                        color: emotion.emotionColor,
                                        width: 1.0,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            }),
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: widget.isReadOnly
                                  ? null
                                  : () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return ChooseSubText();
                                        },
                                      );
                                    },
                              child: Chip(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: const BorderSide(
                                    color: mPrimaryColor,
                                    width: 1.0,
                                  ),
                                ),
                                label: const Icon(
                                  Icons.add,
                                  color: mPrimaryColor,
                                ),
                                backgroundColor:
                                    mPeacefulColor.withOpacity(0.1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ..._buildContentWidgets(widget.isReadOnly),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: widget.isReadOnly
          ? Container(
              height: 70,
              color: mPrimaryColor,
              child: GestureDetector(
                onTap: () async {
                  if (_validateDiary(diaryController)) {
                    Diary diary = diaryController.getDiary();
                    bool isSaved = await diaryController.updateDiary(diary);

                    if (isSaved) {
                      customToastMsg("일기가 수정 되었습니다!");
                      diaryController.resetDiaryState(); // 상태 초기화
                      // context.go('/diary'); // 다이어리 목록으로 이동
                      context.pop();
                    } else {
                      customToastMsg("일기 수정에 실패했습니다.");
                    }
                  } else {
                    customToastMsg("모든 질문에 응답해야 저장할 수 있습니다.");
                  }
                },
                child: const Center(
                  child: Text(
                    "수정",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ))
          : Container(
              height: 70,
              color: mPrimaryColor,
              child: GestureDetector(
                onTap: () async {
                  if (_validateDiary(diaryController)) {
                    Diary diary = diaryController.getDiary();
                    bool isSaved = await diaryController.saveDiary(diary);

                    if (isSaved) {
                      customToastMsg("일기가 저장되었습니다!");
                      diaryController.resetDiaryState(); // 상태 초기화
                      // context.go('/diary'); // 다이어리 목록으로 이동
                      context.pop();
                    } else {
                      customToastMsg("일기 저장에 실패했습니다.");
                    }
                  } else {
                    customToastMsg("모든 질문에 응답해야 저장할 수 있습니다.");
                  }
                },
                child: const Center(
                  child: Text(
                    "저장",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )),
    );
  }

  /// 수정 다이얼로그 표시
  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("수정하기"),
          content: const Text("이 일기를 수정하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // 다이얼로그 닫기
              },
              child: const Text("취소"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // 다이얼로그 닫기
                setState(() {
                  widget.isReadOnly = false;
                });
              },
              child: const Text("수정하기"),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildContentWidgets(bool isReadOnly) {
    final questions = [
      "Q1. 오늘은 어떤 일이 있었나요?",
      "Q2. 그 일이 당신의 기분을 어떻게 만들었나요?",
      "Q3. 그 감정이 당신에게 어떤 영향을 주었나요?",
      "Q4. 1년 전 나는 오늘 생긴 일에 대해 어떻게 행동 했을까요?",
      "Q5. 1년 후 나는 오늘 생긴 일에 대해 어떻게 행동 할까요?",
    ];

    return List.generate(
      5,
      (index) => Column(
        children: [
          ContentWidget(
            labelText: questions[index], // 질문 텍스트 적용
            hintText: "당신의 마음을 표현해주세요.", // 힌트 텍스트
            initialValue: diaryController.diaryContents[index], // 기존 데이터 표시
            onChanged: (value) => diaryController.updateContent(
                index + 1, value ?? ''), // 값 변경 처리
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  bool _validateDiary(DiaryController controller) {
    return controller.diaryContents.every((content) => content.isNotEmpty);
  }
}
