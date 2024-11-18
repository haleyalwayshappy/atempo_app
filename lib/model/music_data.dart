import 'package:uuid/uuid.dart';

/// 좋아요 상태 관리용 enum
enum FavoriteStatus {
  none, // 0
  like, // 1
  dislike, // 2
}

/// 음악 컨텐츠에 들어갈 내용
class Music {
  final String musicId;
  final String musicImgUrl;
  final String musicTitle;
  final String musicUrl;
  final String musicDescription;
  final Duration? runningTime; // 재생 시간
  FavoriteStatus favoriteStatus; // 좋아요 상태

  Music({
    String? musicId,
    required this.musicDescription,
    required this.musicImgUrl,
    required this.musicTitle,
    required this.musicUrl,
    this.runningTime,
    this.favoriteStatus = FavoriteStatus.none, // 기본값은 none
  }) : musicId = musicId ?? Uuid().v4();

  Map<String, dynamic> toMap() {
    return {
      'musicId': musicId,
      'musicImgUrl': musicImgUrl,
      'musicTitle': musicTitle,
      'musicUrl': musicUrl,
      'runningTime': runningTime?.inSeconds, // 초 단위로 변환
      'favoriteStatus': favoriteStatus.index, // enum을 int로 변환하여 저장
    };
  }
}
