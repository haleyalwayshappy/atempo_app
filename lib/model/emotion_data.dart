import 'package:atempo_app/utils/constants.dart';
import 'package:flutter/material.dart';

enum MainEmotion {
  joy,
  sad,
  angry,
  peaceful,
  confused,
}

enum DetailEmotion {
  // Joy's sub
  pumped, // 신나요
  happy, // 행복해요
  excited, // 설레요
  awesome, // 멋져요
  proud, // 뿌듯해요

  // Sad's sub
  gloomy, // 우울해요
  sorrow, // 슬퍼요
  lonely, // 외로워요
  depressed, // 서러워요
  frustrated, // 좌절하다

  // Angry's sub
  stressed, // 스트레스
  angry, // 화나요
  annoyed, // 짜증나요
  mistreated, // 억울해요
  stifled, // 답답해요

  // Peace's sub
  peaceful, // 평화로워요
  stable, // 안정되다
  cozy, // 안락하다
  calm, // 차분하다
  refreshed, // 상쾌하다

  // confused's sub
  jealous, // 질투나는
  scary, // 무서운
  creepy, // 소름끼치는
  shameful, //  창피한
  absurd //  황당한
}

final Map<MainEmotion, List<DetailEmotion>> mainEmotionDetails = {
  MainEmotion.joy: [
    DetailEmotion.pumped,
    DetailEmotion.happy,
    DetailEmotion.excited,
    DetailEmotion.awesome,
    DetailEmotion.proud,
  ],
  MainEmotion.sad: [
    DetailEmotion.gloomy,
    DetailEmotion.sorrow,
    DetailEmotion.lonely,
    DetailEmotion.depressed,
    DetailEmotion.frustrated,
  ],
  MainEmotion.angry: [
    DetailEmotion.stressed,
    DetailEmotion.angry,
    DetailEmotion.annoyed,
    DetailEmotion.mistreated,
    DetailEmotion.stifled,
  ],
  MainEmotion.peaceful: [
    DetailEmotion.calm,
    DetailEmotion.peaceful,
    DetailEmotion.stable,
    DetailEmotion.refreshed,
    DetailEmotion.cozy,
  ],
  MainEmotion.confused: [
    DetailEmotion.jealous,
    DetailEmotion.scary,
    DetailEmotion.creepy,
    DetailEmotion.shameful,
    DetailEmotion.absurd,
  ],
};

class Emotion {
  final MainEmotion? mainEmotion; // 메인감정
  final DetailEmotion? detailEmotion; // 세부 감정
  // 메인감정이던 세부감정이던 둘중 하나만 사용해야함

  final String imageUrl; // 캐릭터 이미지 경로
  final String? gridImageUrl;
  final Color emotionColor; // 캐릭터와 맞는 색상
  final String title; // 한국이름
  final String context; // 설명 또는 멘트

  // List<String> subEmotion; // 변화되고 싶은 감정

  Emotion({
    this.mainEmotion,
    this.detailEmotion,
    required this.imageUrl,
    this.gridImageUrl,
    required this.emotionColor,
    required this.title,
    required this.context,
  });
}

List<Emotion> mainEmotions = [
  /// 기쁨이
  Emotion(
    mainEmotion: MainEmotion.joy,
    imageUrl: 'assets/images/main_emotion/icon_joy_y.png',
    gridImageUrl: 'assets/images/main_emotion/square_icon/square_joy.png',
    emotionColor: mJoyColor,
    title: "기쁨이",
    context: "오늘 기분 맑음!",
  ),

  /// 슬픔이
  Emotion(
    mainEmotion: MainEmotion.sad,
    imageUrl: 'assets/images/main_emotion/icon_sadness.png',
    gridImageUrl: 'assets/images/main_emotion/square_icon/square_sad.png',
    emotionColor: mSadColor, // 파란색
    title: "슬픔이",
    context: "이건 눈물이 아니야..",
  ),

  /// 짜증이
  Emotion(
    mainEmotion: MainEmotion.angry,
    imageUrl: 'assets/images/main_emotion/icon_angry.png',
    gridImageUrl: 'assets/images/main_emotion/square_icon/square_angry.png',
    emotionColor: mAngryColor, // 빨간색
    title: "짜증이",
    context: "열받는 하루! 되는게 없어!!",
  ),

  /// 편안이
  Emotion(
    mainEmotion: MainEmotion.peaceful,
    imageUrl: 'assets/images/main_emotion/icon_peaceful.png',
    gridImageUrl: 'assets/images/main_emotion/square_icon/square_peace.png',
    emotionColor: mPeacefulColor, // 연두색
    title: "편안이",
    context: "나는 내가 너무 좋아",
  ),

  /// 혼란이
  Emotion(
    mainEmotion: MainEmotion.confused,
    imageUrl: 'assets/images/main_emotion/icon_confuse.png',
    gridImageUrl: 'assets/images/main_emotion/square_icon/square_confuse.png',
    emotionColor: mConfusedColor, // 보라색
    title: "혼란이",
    context: "어떻게 해야할지 모르겠어",
  ),
];

final Map<DetailEmotion, Emotion> detailEmotionInfo = {
  /// joy
  DetailEmotion.pumped: Emotion(
    mainEmotion: MainEmotion.joy,
    detailEmotion: DetailEmotion.pumped,
    imageUrl: 'assets/images/detailed_emotion/pumped.png',
    emotionColor: mJoyColor,
    title: "신나죽겠다너무즐겁다.",
    context: "나지금 너무 신나!",
  ),
  DetailEmotion.happy: Emotion(
    mainEmotion: MainEmotion.joy,
    detailEmotion: DetailEmotion.happy,
    imageUrl: 'assets/images/detailed_emotion/happy.png',
    emotionColor: mJoyColor,
    title: "행복",
    context: "행복한 기분이 들어요",
  ),
  DetailEmotion.excited: Emotion(
    mainEmotion: MainEmotion.joy,
    detailEmotion: DetailEmotion.excited,
    imageUrl: 'assets/images/detailed_emotion/excited.png',
    emotionColor: mJoyColor,
    title: "설렘",
    context: "두근두근 설레는 이 맘",
  ),
  DetailEmotion.awesome: Emotion(
    mainEmotion: MainEmotion.joy,
    detailEmotion: DetailEmotion.awesome,
    imageUrl: 'assets/images/detailed_emotion/awesome.png',
    emotionColor: mJoyColor,
    title: "멋짐",
    context: "멋지다는 표현도 부족해",
  ),
  DetailEmotion.proud: Emotion(
    mainEmotion: MainEmotion.joy,
    detailEmotion: DetailEmotion.proud,
    imageUrl: 'assets/images/detailed_emotion/pumped.png',
    emotionColor: mJoyColor,
    title: "뿌듯",
    context: "내가 너무 대단해!",
  ),

  /// sad
  DetailEmotion.gloomy: Emotion(
    mainEmotion: MainEmotion.sad,
    detailEmotion: DetailEmotion.gloomy,
    imageUrl: 'assets/images/detailed_emotion/gloomy.png',
    emotionColor: mSadColor,
    title: "우울",
    context: "우울한 기분이 들어",
  ),
  DetailEmotion.sorrow: Emotion(
    mainEmotion: MainEmotion.sad,
    detailEmotion: DetailEmotion.sorrow,
    imageUrl: 'assets/images/detailed_emotion/sorrow.png',
    emotionColor: mSadColor,
    title: "슬픔",
    context: "하늘이 무너지는 기분...",
  ),
  DetailEmotion.lonely: Emotion(
    mainEmotion: MainEmotion.sad,
    detailEmotion: DetailEmotion.lonely,
    imageUrl: 'assets/images/detailed_emotion/lonely.png',
    emotionColor: mSadColor,
    title: "외로움",
    context: "세상에 나 혼자인 것 같아",
  ),
  DetailEmotion.depressed: Emotion(
    mainEmotion: MainEmotion.sad,
    detailEmotion: DetailEmotion.depressed,
    imageUrl: 'assets/images/detailed_emotion/depressed.png',
    emotionColor: mSadColor,
    title: "서러움",
    context: "아무도 내 마음을 몰라",
  ),
  DetailEmotion.frustrated: Emotion(
    mainEmotion: MainEmotion.sad,
    detailEmotion: DetailEmotion.frustrated,
    imageUrl: 'assets/images/detailed_emotion/frustrated.png',
    emotionColor: mSadColor,
    title: "좌절",
    context: "아무것도 할 수가 없어..",
  ),

  /// angry
  DetailEmotion.stressed: Emotion(
    mainEmotion: MainEmotion.angry,
    detailEmotion: DetailEmotion.stressed,
    imageUrl: 'assets/images/detailed_emotion/stressed.png',
    emotionColor: mAngryColor,
    title: "스트레스",
    context: "아오! 스트레스!!!",
  ),
  DetailEmotion.angry: Emotion(
    mainEmotion: MainEmotion.angry,
    detailEmotion: DetailEmotion.angry,
    imageUrl: 'assets/images/detailed_emotion/angry.png',
    emotionColor: mAngryColor,
    title: "분노",
    context: "으아아아!!!",
  ),
  DetailEmotion.annoyed: Emotion(
    mainEmotion: MainEmotion.angry,
    detailEmotion: DetailEmotion.annoyed,
    imageUrl: 'assets/images/detailed_emotion/annoyed.png',
    emotionColor: mAngryColor,
    title: "짜증",
    context: "다 짜증나 진짜!",
  ),
  DetailEmotion.mistreated: Emotion(
    mainEmotion: MainEmotion.angry,
    detailEmotion: DetailEmotion.mistreated,
    imageUrl: 'assets/images/detailed_emotion/mistreated.png',
    emotionColor: mAngryColor,
    title: "억울",
    context: "내가 아니라고!!",
  ),
  DetailEmotion.stifled: Emotion(
    mainEmotion: MainEmotion.angry,
    detailEmotion: DetailEmotion.stifled,
    imageUrl: 'assets/images/detailed_emotion/stifled.png',
    emotionColor: mAngryColor,
    title: "답답",
    context: "답답하네 정말!",
  ),

  /// peace
  DetailEmotion.peaceful: Emotion(
    mainEmotion: MainEmotion.peaceful,
    detailEmotion: DetailEmotion.peaceful,
    imageUrl: 'assets/images/detailed_emotion/peaceful.png',
    emotionColor: mPeacefulColor,
    title: "평화",
    context: "꽃도 예쁘고, 너도 예쁘고",
  ),
  DetailEmotion.stable: Emotion(
    mainEmotion: MainEmotion.peaceful,
    detailEmotion: DetailEmotion.stable,
    imageUrl: 'assets/images/detailed_emotion/stable.png',
    emotionColor: mPeacefulColor,
    title: "안정",
    context: "꽃도 예쁘고, 너도 예쁘고",
  ),
  DetailEmotion.cozy: Emotion(
    mainEmotion: MainEmotion.peaceful,
    detailEmotion: DetailEmotion.cozy,
    imageUrl: 'assets/images/detailed_emotion/cozy.png',
    emotionColor: mPeacefulColor,
    title: "포근한",
    context: "꽃도 예쁘고, 너도 예쁘고",
  ),
  DetailEmotion.calm: Emotion(
    mainEmotion: MainEmotion.peaceful,
    detailEmotion: DetailEmotion.calm,
    imageUrl: 'assets/images/detailed_emotion/calm.png',
    emotionColor: mPeacefulColor,
    title: "차분",
    context: "꽃도 예쁘고, 너도 예쁘고",
  ),
  DetailEmotion.refreshed: Emotion(
    mainEmotion: MainEmotion.peaceful,
    detailEmotion: DetailEmotion.refreshed,
    imageUrl: 'assets/images/detailed_emotion/refreshed.png',
    emotionColor: mPeacefulColor,
    title: "상쾌",
    context: "꽃도 예쁘고, 너도 예쁘고",
  ),

  /// confused
  DetailEmotion.jealous: Emotion(
    mainEmotion: MainEmotion.confused,
    detailEmotion: DetailEmotion.jealous,
    imageUrl: 'assets/images/detailed_emotion/jealous.png',
    emotionColor: mConfusedColor,
    title: "질투나는",
    context: "질투나....!!",
  ),
  DetailEmotion.scary: Emotion(
    mainEmotion: MainEmotion.confused,
    detailEmotion: DetailEmotion.scary,
    imageUrl: 'assets/images/detailed_emotion/scary.png',
    emotionColor: mConfusedColor,
    title: "무서운",
    context: "너무 무서워ㅜㅠ",
  ),
  DetailEmotion.creepy: Emotion(
    mainEmotion: MainEmotion.confused,
    detailEmotion: DetailEmotion.creepy,
    imageUrl: 'assets/images/detailed_emotion/creepy.png',
    emotionColor: mConfusedColor,
    title: "소름끼치는",
    context: "정말 소름끼쳐!!",
  ),
  DetailEmotion.shameful: Emotion(
    mainEmotion: MainEmotion.confused,
    detailEmotion: DetailEmotion.shameful,
    imageUrl: 'assets/images/detailed_emotion/shameful.png',
    emotionColor: mConfusedColor,
    title: "창피한",
    context: "어디 쥐구멍 없을까..?",
  ),
  DetailEmotion.absurd: Emotion(
    mainEmotion: MainEmotion.confused,
    detailEmotion: DetailEmotion.absurd,
    imageUrl: 'assets/images/detailed_emotion/absurd.png',
    emotionColor: mConfusedColor,
    title: "황당한",
    context: "헐...",
  ),
};
