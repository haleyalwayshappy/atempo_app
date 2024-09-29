// 테마별 음악 리스트를 위한 클래스
class ContentEntry {
  final String titleText;
  final String subTitleText;
  final String imageUrl;

  ContentEntry({
    required this.titleText,
    required this.subTitleText,
    required this.imageUrl,
  });
}


List<ContentEntry> dummyContentData = [
  ContentEntry(
    titleText: "오늘의 기분",
    subTitleText: "기분이 좋았던 하루",
    imageUrl: "image_back4.jpg",
  ),
  ContentEntry(
    titleText: "슬픈 날",
    subTitleText: "아쉬운 일이 있었던 날",
    imageUrl: "image_back.jpg", // 실제 이미지 경로로 변경
  ),
  ContentEntry(
    titleText: "화가 난 날",
    subTitleText: "짜증나는 일이 많았던 날",
    imageUrl: "image_back2.jpg", // 실제 이미지 경로로 변경
  ),
  ContentEntry(
    titleText: "평화로운 날",
    subTitleText: "아주 평온했던 하루",
    imageUrl: "image_back3.jpg", // 실제 이미지 경로로 변경
  ),
  ContentEntry(
    titleText: "혼란스러운 날",
    subTitleText: "무엇을 해야 할지 모르겠던 날",
    imageUrl: "image_back4.jpg", // 실제 이미지 경로로 변경
  ),
];
