import 'package:atempo_app/model/emotion_data.dart';
import 'package:uuid/uuid.dart';

/// 일기에 대한 더미 데이터다.
class Diary {
  String userId; // 유저 정보
  String? diaryId; // 인덱스
  MainEmotion mainEmotion; // 대표감정
  SubEmotion? subEmotion; // 상세감정
  String? content1; // 일기 내용1
  String? content2; // 일기 내용2
  String? content3; // 일기 내용3
  String? content4; // 일기 내용4
  String? content5; // 일기 내용5
  DateTime dateTime; // 날짜

  Diary({
    required this.userId,
    String? diaryId,
    required this.mainEmotion,
    this.subEmotion,
    required this.dateTime,
    required this.content1,
    this.content2,
    this.content3,
    this.content4,
    this.content5,
  }) : diaryId = diaryId ?? Uuid().v4();
}

List<Diary> dummyDiaryData = [
  Diary(
    userId: "user1",
    mainEmotion: MainEmotion.joy,
    subEmotion: MainEmotion.joy.subEmotions[0],
    dateTime: DateTime.now().subtract(Duration(days: 1)),
    content1: "오늘은 정말 기뻤다. 새로운 프로젝트를 시작했다.",
    content2: "프로젝트가 잘 진행되었으면 좋겠다.",
  ),
  Diary(
    userId: "user2",
    mainEmotion: MainEmotion.sad,
    subEmotion: MainEmotion.sad.subEmotions[1],
    dateTime: DateTime.now().subtract(Duration(days: 2)),
    content1: "오늘은 기분이 우울하다.",
    content2: "밖에 나가고 싶지 않았다.",
  ),
  Diary(
    userId: "user3",
    mainEmotion: MainEmotion.anger,
    subEmotion: MainEmotion.anger.subEmotions[0],
    dateTime: DateTime.now().subtract(Duration(days: 3)),
    content1: "화가 나는 일이 있었다.",
    content2: "상대방이 나를 이해하지 못해서 답답했다.",
  ),
  Diary(
    userId: "user4",
    mainEmotion: MainEmotion.peace,
    subEmotion: MainEmotion.peace.subEmotions[0],
    dateTime: DateTime.now().subtract(Duration(days: 4)),
    content1: "오늘은 편안한 하루였다.",
    content2: "집에서 책을 읽으며 여유를 즐겼다.",
  ),
  Diary(
    userId: "user5",
    mainEmotion: MainEmotion.confused,
    subEmotion: MainEmotion.confused.subEmotions[0],
    dateTime: DateTime.now().subtract(Duration(days: 5)),
    content1: "오늘은 혼란스러운 하루였다.",
    content2: "무슨 일을 해야 할지 몰라 방황했다.",
  ),
  Diary(
    userId: "user6",
    mainEmotion: MainEmotion.joy,
    subEmotion: MainEmotion.joy.subEmotions[1],
    dateTime: DateTime.now().subtract(Duration(days: 6)),
    content1: "오늘은 기쁜 일이 많았다.",
    content2: "오랜만에 친구를 만났다.",
  ),
  Diary(
    userId: "user7",
    mainEmotion: MainEmotion.sad,
    subEmotion: MainEmotion.sad.subEmotions[0],
    dateTime: DateTime.now().subtract(Duration(days: 7)),
    content1: "슬픈 소식을 들었다.",
    content2: "마음이 많이 아프다.",
  ),
  Diary(
    userId: "user8",
    mainEmotion: MainEmotion.anger,
    subEmotion: MainEmotion.anger.subEmotions[0],
    dateTime: DateTime.now().subtract(Duration(days: 8)),
    content1: "오늘은 정말 화가 나는 일이 있었다.",
    content2: "이성적으로 대처하지 못해 아쉬웠다.",
  ),
  Diary(
    userId: "user9",
    mainEmotion: MainEmotion.peace,
    subEmotion: MainEmotion.peace.subEmotions[0],
    dateTime: DateTime.now().subtract(Duration(days: 9)),
    content1: "오늘은 평온한 하루였다.",
    content2: "산책을 하면서 마음의 안정을 찾았다.",
  ),
  Diary(
    userId: "user10",
    mainEmotion: MainEmotion.confused,
    subEmotion: MainEmotion.confused.subEmotions[0],
    dateTime: DateTime.now().subtract(Duration(days: 10)),
    content1: "오늘은 머릿속이 복잡했다.",
    content2: "무슨 결정을 내려야 할지 모르겠다.",
  ),
];
