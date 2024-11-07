import 'package:atempo_app/model/emotion_data.dart';
import 'package:uuid/uuid.dart';

/// 일기에 대한 더미 데이터다.
class Diary {
  String userId; // 유저 정보
  String diaryId; // 인덱스
  int diaryType; // 0 : 5가지 질문 다이어리, 1 : 자유다이어리 , 2: 100문 다이어리
  MainEmotion mainEmotion; // 대표감정
  final List<DetailEmotion>? subEmotion; // 상세감정
  String? content1; // 일기 내용1
  String? content2; // 일기 내용2
  String? content3; // 일기 내용3
  String? content4; // 일기 내용4
  String? content5; // 일기 내용5
  DateTime dateTime; // 날짜

  Diary({
    required this.userId,
    required this.diaryType,
    required this.mainEmotion,
    this.subEmotion,
    required this.dateTime,
    required this.content1,
    this.content2,
    this.content3,
    this.content4,
    this.content5,
  }) : diaryId = '$userId-${Uuid().v4()}'; // userId + UUID로 diaryId 생성

  @override
  String toString() {
    return 'Diary(userId: $userId,diartType:$diaryType, dateTime: $dateTime, mainEmotion: $mainEmotion, subEmotion: $subEmotion, content1: $content1, content2: $content2, content3: $content3, content4: $content4, content5: $content5)';
  }

  // Firestore에 저장할 수 있도록 변환
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'dateTime': dateTime.toIso8601String(),
      'mainEmotion': mainEmotion.toString(),
      'subEmotion': subEmotion?.map((e) => e.toString()).toList(),
      'content1': content1,
      'content2': content2,
      'content3': content3,
      'content4': content4,
      'content5': content5,
    };
  }
}

// 더미 일기 데이터 목록 생성
List<Diary> dummyDiaryData = [
  Diary(
    diaryType: 0,
    userId: "user1", // 모든 다이어리의 userId가 동일
    mainEmotion: MainEmotion.peaceful,
    subEmotion: [DetailEmotion.peaceful, DetailEmotion.scary],
    dateTime: DateTime(2024, 10, 12), // 2024년 10월 23일
    content1: "오늘은 매우 기뻤다.",
    content2: "오래된 친구를 만났기 때문이다.",
    content3: "그와 함께 즐거운 시간을 보냈다.",
    content4: "1년 전의 나는 아마도 더 내성적이었을 것이다.",
    content5: "1년 후 나는 더 활발해질 것이다.",
  ),
  Diary(
    diaryType: 0,
    userId: "user1", // 모든 다이어리의 userId가 동일
    mainEmotion: MainEmotion.joy,
    subEmotion: [DetailEmotion.peaceful, DetailEmotion.scary],
    dateTime: DateTime(2024, 10, 13), // 2024년 10월 23일
    content1: "오늘은 매우 기뻤다.",
    content2: "오래된 친구를 만났기 때문이다.",
    content3: "그와 함께 즐거운 시간을 보냈다.",
    content4: "1년 전의 나는 아마도 더 내성적이었을 것이다.",
    content5: "1년 후 나는 더 활발해질 것이다.",
  ),
  Diary(
    diaryType: 0,
    userId: "user1", // 동일한 userId
    mainEmotion: MainEmotion.sad,
    subEmotion: [DetailEmotion.peaceful, DetailEmotion.scary],
    dateTime: DateTime(2024, 10, 14),
    content1: "오늘은 슬펐다.",
    content2: "직장에서 실수를 했다.",
    content3: "그 문제를 해결하기 위해 많이 노력했다.",
    content4: "1년 전의 나는 이런 상황을 더 힘들게 여겼을 것이다.",
    content5: "1년 후 나는 더 잘 대처할 수 있을 것이다.",
  ),
  Diary(
    diaryType: 0,
    userId: "user1", // 동일한 userId
    mainEmotion: MainEmotion.angry,
    subEmotion: [DetailEmotion.peaceful, DetailEmotion.scary],
    dateTime: DateTime(2024, 10, 15),
    content1: "오늘은 매우 화가 났다.",
    content2: "교통 체증이 심각했기 때문이다.",
    content3: "참으려고 했지만 결국 폭발하고 말았다.",
    content4: "1년 전의 나는 더 화를 냈을 것이다.",
    content5: "1년 후 나는 더 침착할 수 있을 것이다.",
  ),
  Diary(
    diaryType: 0,
    userId: "user1", // 동일한 userId
    mainEmotion: MainEmotion.confused,
    subEmotion: [DetailEmotion.peaceful, DetailEmotion.scary],
    dateTime: DateTime(2024, 10, 16),
    content1: "오늘은 혼란스러웠다.",
    content2: "무슨 결정을 내려야 할지 몰랐다.",
    content3: "문제를 해결하려고 노력했지만 확신이 서지 않았다.",
    content4: "1년 전의 나는 더 많이 고민했을 것이다.",
    content5: "1년 후 나는 결정을 더 잘 내릴 수 있을 것이다.",
  ),
  Diary(
    diaryType: 0,
    userId: "user1", // 동일한 userId
    mainEmotion: MainEmotion.confused,
    subEmotion: [DetailEmotion.peaceful, DetailEmotion.scary],
    dateTime: DateTime(2024, 10, 17),
    content1: "오늘은 깜짝 놀랐다.",
    content2: "갑자기 좋은 소식을 들었기 때문이다.",
    content3: "믿기지 않을 정도로 기뻤다.",
    content4: "1년 전의 나는 이런 소식을 상상조차 못 했을 것이다.",
    content5: "1년 후 나는 더 많은 좋은 소식을 기대하고 있을 것이다.",
  ),
  Diary(
    diaryType: 0,
    userId: "user1", // 모든 다이어리의 userId가 동일
    mainEmotion: MainEmotion.joy,
    subEmotion: [DetailEmotion.peaceful, DetailEmotion.scary],
    dateTime: DateTime(2024, 10, 19), // 2024년 10월 23일
    content1: "오늘은 매우 기뻤다.",
    content2: "오래된 친구를 만났기 때문이다.",
    content3: "그와 함께 즐거운 시간을 보냈다.",
    content4: "1년 전의 나는 아마도 더 내성적이었을 것이다.",
    content5: "1년 후 나는 더 활발해질 것이다.",
  ),
  Diary(
    diaryType: 0,
    userId: "user1", // 모든 다이어리의 userId가 동일
    mainEmotion: MainEmotion.peaceful,
    subEmotion: [DetailEmotion.peaceful, DetailEmotion.scary],
    dateTime: DateTime(2024, 10, 20), // 2024년 10월 23일
    content1: "오늘은 매우 기뻤다.",
    content2: "오래된 친구를 만났기 때문이다.",
    content3: "그와 함께 즐거운 시간을 보냈다.",
    content4: "1년 전의 나는 아마도 더 내성적이었을 것이다.",
    content5: "1년 후 나는 더 활발해질 것이다.",
  ),
  Diary(
    diaryType: 0,
    userId: "user1", // 모든 다이어리의 userId가 동일
    mainEmotion: MainEmotion.joy,
    subEmotion: [DetailEmotion.peaceful, DetailEmotion.scary],
    dateTime: DateTime(2024, 10, 21), // 2024년 10월 23일
    content1: "오늘은 매우 기뻤다.",
    content2: "오래된 친구를 만났기 때문이다.",
    content3: "그와 함께 즐거운 시간을 보냈다.",
    content4: "1년 전의 나는 아마도 더 내성적이었을 것이다.",
    content5: "1년 후 나는 더 활발해질 것이다.",
  ),
  Diary(
    diaryType: 0,
    userId: "user1", // 모든 다이어리의 userId가 동일
    mainEmotion: MainEmotion.peaceful,
    subEmotion: [DetailEmotion.peaceful, DetailEmotion.scary],
    dateTime: DateTime(2024, 10, 22), // 2024년 10월 23일
    content1: "오늘은 매우 기뻤다.",
    content2: "오래된 친구를 만났기 때문이다.",
    content3: "그와 함께 즐거운 시간을 보냈다.",
    content4: "1년 전의 나는 아마도 더 내성적이었을 것이다.",
    content5: "1년 후 나는 더 활발해질 것이다.",
  ),
  Diary(
    diaryType: 0,
    userId: "user1", // 모든 다이어리의 userId가 동일
    mainEmotion: MainEmotion.joy,
    subEmotion: [DetailEmotion.peaceful, DetailEmotion.scary],
    dateTime: DateTime(2024, 10, 23), // 2024년 10월 23일
    content1: "오늘은 매우 기뻤다.",
    content2: "오래된 친구를 만났기 때문이다.",
    content3: "그와 함께 즐거운 시간을 보냈다.",
    content4: "1년 전의 나는 아마도 더 내성적이었을 것이다.",
    content5: "1년 후 나는 더 활발해질 것이다.",
  ),
  Diary(
    diaryType: 0,
    userId: "user1", // 동일한 userId
    mainEmotion: MainEmotion.sad,
    subEmotion: [DetailEmotion.peaceful, DetailEmotion.scary],
    dateTime: DateTime(2024, 10, 24),
    content1: "오늘은 슬펐다.",
    content2: "직장에서 실수를 했다.",
    content3: "그 문제를 해결하기 위해 많이 노력했다.",
    content4: "1년 전의 나는 이런 상황을 더 힘들게 여겼을 것이다.",
    content5: "1년 후 나는 더 잘 대처할 수 있을 것이다.",
  ),
  Diary(
    diaryType: 0,
    userId: "user1", // 동일한 userId
    mainEmotion: MainEmotion.angry,
    subEmotion: [DetailEmotion.peaceful, DetailEmotion.scary],
    dateTime: DateTime(2024, 10, 25),
    content1: "오늘은 매우 화가 났다.",
    content2: "교통 체증이 심각했기 때문이다.",
    content3: "참으려고 했지만 결국 폭발하고 말았다.",
    content4: "1년 전의 나는 더 화를 냈을 것이다.",
    content5: "1년 후 나는 더 침착할 수 있을 것이다.",
  ),
  Diary(
    diaryType: 0,
    userId: "user1", // 동일한 userId
    mainEmotion: MainEmotion.confused,
    subEmotion: [DetailEmotion.peaceful, DetailEmotion.scary],
    dateTime: DateTime(2024, 10, 26),
    content1: "오늘은 혼란스러웠다.",
    content2: "무슨 결정을 내려야 할지 몰랐다.",
    content3: "문제를 해결하려고 노력했지만 확신이 서지 않았다.",
    content4: "1년 전의 나는 더 많이 고민했을 것이다.",
    content5: "1년 후 나는 결정을 더 잘 내릴 수 있을 것이다.",
  ),
  Diary(
    diaryType: 0,
    userId: "user1", // 동일한 userId
    mainEmotion: MainEmotion.confused,
    subEmotion: [DetailEmotion.peaceful, DetailEmotion.scary],
    dateTime: DateTime(2024, 10, 27),
    content1: "오늘은 깜짝 놀랐다.",
    content2: "갑자기 좋은 소식을 들었기 때문이다.",
    content3: "믿기지 않을 정도로 기뻤다.",
    content4: "1년 전의 나는 이런 소식을 상상조차 못 했을 것이다.",
    content5: "1년 후 나는 더 많은 좋은 소식을 기대하고 있을 것이다.",
  ),
];
