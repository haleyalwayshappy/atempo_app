import 'package:uuid/uuid.dart';

/// 음악 컨텐츠에 들어갈 내용
class Music {
  String? musicId;
  String musicImgUrl;
  String musicTitle; // 제목
  String? musicDescription; // 설명
  DateTime runningTime; // 재생시간
  String musicUrl;

  Music({
    String? musicId,
    // required this.musicId,
    required this.musicImgUrl,
    required this.musicTitle,
    this.musicDescription,
    required this.runningTime,
    required this.musicUrl,
  }) : musicId = musicId ?? Uuid().v4();

  Map<String, dynamic> toMap() {
    return {
      'musicId': musicId,
      'musicImgUrl': musicImgUrl,
      'musicTitle': musicTitle,
      'musicDescription': musicDescription,
      'runningTime': runningTime.toIso8601String(),
      'musicUrl': musicUrl,
    };
  }
}
