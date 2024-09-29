import 'package:atempo_app/model/emotion_data.dart';

/// 일기에 대한 더미 데이터다.
class DiaryEntry {
  int indexNumber; // 인덱스 번호
  EmotionType mainEmotion; // 대표감정
  String? subEmotion; // 상세감정
  String? content1; // 일기 내용1
  String? content2; // 일기 내용2
  String? content3; // 일기 내용3
  String? content4; // 일기 내용4
  String? content5; // 일기 내용5
  DateTime dateTime; // 날짜

  DiaryEntry({
    required this.indexNumber,
    required this.mainEmotion,
    required this.subEmotion,
    required this.dateTime,
    required this.content1,
    this.content2,
    this.content3,
    this.content4,
    this.content5,
  });
}

List<DiaryEntry> dummyDiaryData = [
  DiaryEntry(
    indexNumber: 1,
    mainEmotion: EmotionType.joy,
    subEmotion: '신나요',
    content1: '오늘은 오랜만에 친구들과 만나서 신나게 놀았어요.',
    content2: '오래 못 봤던 친구들과 수다를 떨며 시간을 보냈어요.',
    content3: '기분이 좋아졌어요',
    content4: '피곤했을것 같아요',
    content5: '만날 수 있는 친구들이있어서 감사할것 같아요.',
    dateTime: DateTime(2024, 9, 1),
  ),
  DiaryEntry(
    indexNumber: 2,
    mainEmotion: EmotionType.sad,
    subEmotion: '우울해요',
    content1: '오늘은 날씨도 흐리고 기분도 우울했어요.',
    content2: '별다른 이유는 없는데, 그냥 하루가 힘들었어요.',
    content3: null,
    content4: null,
    content5: null,
    dateTime: DateTime(2024, 9, 2),
  ),
  DiaryEntry(
    indexNumber: 3,
    mainEmotion: EmotionType.anger,
    subEmotion: '화나는',
    content1: '오늘 회사에서 팀장님께 혼나서 기분이 나빴어요.',
    content2: '저는 잘못한 게 없는데 억울했어요.',
    content3: null,
    content4: null,
    content5: null,
    dateTime: DateTime(2024, 9, 3),
  ),
  DiaryEntry(
    indexNumber: 4,
    mainEmotion: EmotionType.peace,
    subEmotion: '평화롭다',
    content1: '오늘은 아무 일도 없고 평화로운 하루였어요.',
    content2: '집에서 책을 읽고 차를 마시며 여유를 즐겼어요.',
    content3: null,
    content4: null,
    content5: null,
    dateTime: DateTime(2024, 9, 4),
  ),
  DiaryEntry(
    indexNumber: 5,
    mainEmotion: EmotionType.confused,
    subEmotion: '질투하는',
    content1: '친구가 좋은 소식을 전해줬는데, 질투가 났어요.',
    content2: '축하해줘야 하는데 복잡한 감정이 들었어요.',
    content3: null,
    content4: null,
    content5: null,
    dateTime: DateTime(2024, 9, 5),
  ),
  DiaryEntry(
    indexNumber: 6,
    mainEmotion: EmotionType.joy,
    subEmotion: '행복해요',
    content1: '오늘은 모든 것이 잘 풀렸어요, 너무 행복해요.',
    content2: '작은 일에도 감사함을 느낄 수 있었던 하루였어요.',
    content3: null,
    content4: null,
    content5: null,
    dateTime: DateTime(2024, 9, 6),
  ),
  DiaryEntry(
    indexNumber: 7,
    mainEmotion: EmotionType.sad,
    subEmotion: '외로워요',
    content1: '오늘은 혼자 있는 시간이 많아서 외로웠어요.',
    content2: '누군가와 이야기를 나누고 싶었지만 쉽지 않았어요.',
    content3: null,
    content4: null,
    content5: null,
    dateTime: DateTime(2024, 9, 7),
  ),
  DiaryEntry(
    indexNumber: 8,
    mainEmotion: EmotionType.anger,
    subEmotion: '짜증나는',
    content1: '작은 일에도 짜증이 나는 하루였어요.',
    content2: '평소에는 괜찮던 일이 오늘은 유독 신경 쓰였어요.',
    content3: null,
    content4: null,
    content5: null,
    dateTime: DateTime(2024, 9, 8),
  ),
  DiaryEntry(
    indexNumber: 9,
    mainEmotion: EmotionType.peace,
    subEmotion: '안정되다',
    content1: '오늘은 마음이 안정된 하루였어요.',
    content2: '모든 것이 차분하게 진행되어 마음이 편안했어요.',
    content3: null,
    content4: null,
    content5: null,
    dateTime: DateTime(2024, 9, 9),
  ),
  DiaryEntry(
    indexNumber: 10,
    mainEmotion: EmotionType.confused,
    subEmotion: '무서운',
    content1: '오늘 어떤 일을 겪고 나서 무서운 기분이 들었어요.',
    content2: '갑작스러운 상황에 어떻게 대처할지 몰랐어요.',
    content3: null,
    content4: null,
    content5: null,
    dateTime: DateTime(2024, 9, 10),
  ),
  DiaryEntry(
    indexNumber: 11,
    mainEmotion: EmotionType.joy,
    subEmotion: '뿌듯해요',
    content1: '오늘 목표한 일을 모두 마무리해서 뿌듯해요.',
    content2: '자신에게 칭찬을 하고 싶어요.',
    content3: null,
    content4: null,
    content5: null,
    dateTime: DateTime(2024, 9, 11),
  ),
  DiaryEntry(
    indexNumber: 12,
    mainEmotion: EmotionType.sad,
    subEmotion: '좌절하다',
    content1: '오늘 계획했던 일이 실패로 돌아가서 좌절했어요.',
    content2: '노력했는데 원하는 결과를 얻지 못했어요.',
    content3: null,
    content4: null,
    content5: null,
    dateTime: DateTime(2024, 9, 12),
  ),
  DiaryEntry(
    indexNumber: 13,
    mainEmotion: EmotionType.anger,
    subEmotion: '억울한',
    content1: '오늘 억울한 일을 당해서 속상했어요.',
    content2: '아무리 생각해도 제가 잘못한 건 없었어요.',
    content3: null,
    content4: null,
    content5: null,
    dateTime: DateTime(2024, 9, 13),
  ),
  DiaryEntry(
    indexNumber: 14,
    mainEmotion: EmotionType.peace,
    subEmotion: '홀가분하다',
    content1: '오늘 해야 할 일을 다 끝내고 나서 홀가분했어요.',
    content2: '마음이 가벼워져서 즐거운 기분이 들었어요.',
    content3: null,
    content4: null,
    content5: null,
    dateTime: DateTime(2024, 9, 14),
  ),
  DiaryEntry(
    indexNumber: 15,
    mainEmotion: EmotionType.confused,
    subEmotion: '창피한',
    content1: '오늘 실수해서 창피한 순간이 있었어요.',
    content2: '그 일을 생각하면 아직도 얼굴이 뜨거워요.',
    content3: null,
    content4: null,
    content5: null,
    dateTime: DateTime(2024, 9, 15),
  ),
  DiaryEntry(
    indexNumber: 16,
    mainEmotion: EmotionType.joy,
    subEmotion: '기대되요',
    content1: '내일 있을 여행이 기대돼서 잠이 안 왔어요.',
    content2: '가방을 미리 싸 놓고 설레는 마음으로 하루를 보냈어요.',
    content3: null,
    content4: null,
    content5: null,
    dateTime: DateTime(2024, 9, 16),
  ),
  DiaryEntry(
    indexNumber: 17,
    mainEmotion: EmotionType.sad,
    subEmotion: '서러운',
    content1: '오늘 말 한마디에 서러운 마음이 들었어요.',
    content2: '내 마음을 이해받지 못한 것 같아서 속상했어요.',
    content3: null,
    content4: null,
    content5: null,
    dateTime: DateTime(2024, 9, 17),
  ),
  DiaryEntry(
    indexNumber: 18,
    mainEmotion: EmotionType.anger,
    subEmotion: '답답한',
    content1: '답답한 상황이 계속 이어져서 속이 터질 것 같았어요.',
    content2: '해결할 방법을 찾고 있는데 쉽지 않네요.',
    content3: null,
    content4: null,
    content5: null,
    dateTime: DateTime(2024, 9, 18),
  ),
  // DiaryDummyData(
  //   indexNumber: 19,
  //   mainEmotion: EmotionType.joy,
  //   subEmotion: '상쾌하다',
  //   content1: '오늘 아침 공기가 상쾌해서 기분이 좋았어요.',
  //   content2: '산책을 하며 하루를 시작했어요.',
  //   content3: null,
  //   content4: null,
  //   content5: null,
  //   dateTime: '2024-09-19',
  // ),
  DiaryEntry(
    indexNumber: 20,
    mainEmotion: EmotionType.confused,
    subEmotion: '황당한',
    content1: '오늘 황당한 일이 생겨서 어이가 없었어요.',
    content2: '도대체 왜 그런 일이 벌어졌는지 이해할 수 없었어요.',
    content3: null,
    content4: null,
    content5: null,
    dateTime: DateTime(2024, 9, 20),
  ),
  // DiaryDummyData(
  //   indexNumber: 21,
  //   mainEmotion: EmotionType.joy,
  //   subEmotion: '설레요',
  //   content1: '오늘 새로운 사람을 만나서 설레는 하루였어요.',
  //   content2: '앞으로의 관계가 기대돼요.',
  //   content3: null,
  //   content4: null,
  //   content5: null,
  //   dateTime: '2024-09-21',
  // ),
  // DiaryDummyData(
  //   indexNumber: 22,
  //   mainEmotion: EmotionType.sad,
  //   subEmotion: '슬퍼요',
  //   content1: '오늘 슬픈 소식을 들었어요.',
  //   content2: '이별의 순간이 너무 힘들었어요.',
  //   content3: null,
  //   content4: null,
  //   content5: null,
  //   dateTime: '2024-09-22',
  // ),
  // DiaryDummyData(
  //   indexNumber: 23,
  //   mainEmotion: EmotionType.anger,
  //   subEmotion: '스트레스',
  //   content1: '일이 너무 많아서 스트레스를 받았어요.',
  //   content2: '시간이 부족해 해결할 수 없었어요.',
  //   content3: null,
  //   content4: null,
  //   content5: null,
  //   dateTime: '2024-09-23',
  // ),
  // DiaryDummyData(
  //   indexNumber: 24,
  //   mainEmotion: EmotionType.peace,
  //   subEmotion: '안락하다',
  //   content1: '오늘은 집에서 안락하게 하루를 보냈어요.',
  //   content2: '오랜만에 편안함을 느꼈어요.',
  //   content3: null,
  //   content4: null,
  //   content5: null,
  //   dateTime: '2024-09-24',
  // ),
  // DiaryDummyData(
  //   indexNumber: 25,
  //   mainEmotion: EmotionType.confused,
  //   subEmotion: '소름끼치는',
  //   content1: '오늘 본 영화가 소름끼치는 내용이었어요.',
  //   content2: '밤에 잠들기 어려울 것 같아요.',
  //   content3: null,
  //   content4: null,
  //   content5: null,
  //   dateTime: '2024-09-25',
  // ),
  // DiaryDummyData(
  //   indexNumber: 26,
  //   mainEmotion: EmotionType.joy,
  //   subEmotion: '기대되요',
  //   content1: '다음 주에 있을 프로젝트가 기대돼요.',
  //   content2: '잘 준비해서 좋은 결과를 만들고 싶어요.',
  //   content3: null,
  //   content4: null,
  //   content5: null,
  //   dateTime: '2024-09-26',
  // ),
  // DiaryDummyData(
  //   indexNumber: 27,
  //   mainEmotion: EmotionType.sad,
  //   subEmotion: '우울해요',
  //   content1: '오늘은 아무런 의욕이 나지 않았어요.',
  //   content2: '모든 것이 우울하게만 느껴졌어요.',
  //   content3: null,
  //   content4: null,
  //   content5: null,
  //   dateTime: '2024-09-27',
  // ),
  // DiaryDummyData(
  //   indexNumber: 28,
  //   mainEmotion: EmotionType.anger,
  //   subEmotion: '답답한',
  //   content1: '일이 해결되지 않아 답답한 기분이 계속 들었어요.',
  //   content2: '도움을 요청했지만 답변을 받지 못했어요.',
  //   content3: null,
  //   content4: null,
  //   content5: null,
  //   dateTime: '2024-09-28',
  // ),
  // DiaryDummyData(
  //   indexNumber: 29,
  //   mainEmotion: EmotionType.peace,
  //   subEmotion: '홀가분하다',
  //   content1: '오늘 모든 일이 잘 풀려서 홀가분한 하루였어요.',
  //   content2: '오랜만에 느끼는 만족스러운 기분이에요.',
  //   content3: null,
  //   content4: null,
  //   content5: null,
  //   dateTime: '2024-09-29',
  // ),
  // DiaryDummyData(
  //   indexNumber: 30,
  //   mainEmotion: EmotionType.confused,
  //   subEmotion: '질투하는',
  //   content1: '친구의 성공 소식에 질투가 났어요.',
  //   content2: '왜 나는 그런 기회를 얻지 못할까 생각했어요.',
  //   content3: null,
  //   content4: null,
  //   content5: null,
  //   dateTime: '2024-09-30',
  // ),
];
