import 'dart:math';

class NicknameGenerator {
  // 꾸밈말 리스트
  final List<String> modifiers = [
    "푸른",
    "붉은",
    "노란",
    "초록",
    "맑은",
    "따뜻한",
    "시원한",
    "강한",
    "여린",
    "밝은",
    "작은",
    "큰",
    "빠른",
    "느린",
    "귀여운",
    "행복한",
    "슬픈",
    "용감한",
    "부드러운",
    "자유로운"
  ];

  // 동물 이름 리스트
  final List<String> animals = [
    "토끼",
    "강아지",
    "고양이",
    "펭귄",
    "여우",
    "곰",
    "사슴",
    "다람쥐",
    "햄스터",
    "앵무새",
    "판다",
    "라쿤",
    "코알라",
    "물개",
    "수달",
    "고래",
    "독수리",
    "호랑이",
    "치타",
    "양"
  ];

  // 랜덤 닉네임 생성 함수
  String generateNickname() {
    final random = Random();

    // 꾸밈말과 동물 이름 랜덤 선택
    String modifier = modifiers[random.nextInt(modifiers.length)];
    String animal = animals[random.nextInt(animals.length)];

    // 3자리 숫자 생성 (100~999)
    int number = 100 + random.nextInt(900);

    // 닉네임 조합
    return "$modifier$animal$number";
  }
}
/*

void main() {
  NicknameGenerator generator = NicknameGenerator();

  // 닉네임 생성 예시
  for (int i = 0; i < 5; i++) {
    print(generator.generateNickname());
  }
}
*/
