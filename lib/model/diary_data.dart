import 'package:atempo_app/model/emotion_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  bool isShow; // 보여주기? 보관?

  Diary({
    required this.userId,
    String? diaryId, // 선택적 diaryId
    required this.diaryType,
    required this.mainEmotion,
    this.subEmotion,
    required this.dateTime,
    required this.content1,
    this.content2,
    this.content3,
    this.content4,
    this.content5,
    required this.isShow,
  }) : diaryId = diaryId ?? Uuid().v4();

  @override
  String toString() {
    return 'Diary(userId: $userId, dateTime: $dateTime, mainEmotion: $mainEmotion, subEmotion: $subEmotion, content1: $content1, content2: $content2, content3: $content3, content4: $content4, content5: $content5)';
  }

  // Firestore에 저장할 수 있도록 변환
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'diaryId': diaryId,
      'diaryType': diaryType,
      'dateTime': dateTime.toIso8601String(),
      'mainEmotion': mainEmotion.toString(),
      'subEmotion': subEmotion?.map((e) => e.toString()).toList(),
      'content1': content1,
      'content2': content2,
      'content3': content3,
      'content4': content4,
      'content5': content5,
      'isShow': isShow,
    };
  }

  // Firestore 데이터를 Diary 객체로 변환
  factory Diary.fromMap(Map<String, dynamic> map) {
    return Diary(
      userId: map['userId'] ?? '', // userId 기본값 설정
      diaryId: map['diaryId'] != null ? map['diaryId'] as String : Uuid().v4(),
      diaryType: map['diaryType'] as int? ?? 0, // diaryType 기본값 설정
      dateTime: map['dateTime'] is Timestamp
          ? (map['dateTime'] as Timestamp)
              .toDate() // Firestore Timestamp → DateTime
          : DateTime.tryParse(map['dateTime'] as String) ??
              DateTime.now(), // 문자열 → DateTime
      mainEmotion: MainEmotion.values.firstWhere(
        (e) => e.toString() == map['mainEmotion'],
        orElse: () => MainEmotion.joy, // 기본값 설정
      ),
      subEmotion: map['subEmotion'] is List<dynamic>
          ? (map['subEmotion'] as List<dynamic>)
              .map((e) => DetailEmotion.values.firstWhere(
                    (de) => de.toString() == e,
                    orElse: () => DetailEmotion.happy, // 기본값 설정
                  ))
              .toList()
          : [],
      content1: map['content1'] ?? '',
      content2: map['content2'] ?? '',
      content3: map['content3'] ?? '',
      content4: map['content4'] ?? '',
      content5: map['content5'] ?? '',
      isShow: map['isShow'] ?? true,
    );
  }
}
