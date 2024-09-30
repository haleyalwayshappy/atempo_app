/// 음악 컨텐츠에 들어갈 내용
class MusicEntry {
  int index;
  String musicImgUrl;
  String musicTitle;
  List<String>? musicUrl;
  MusicEntry({
    required this.index,
    required this.musicImgUrl,
    required this.musicTitle,
    this.musicUrl,
  });
}

final List<MusicEntry> musicItems = [
  MusicEntry(
    index: 1,
    musicImgUrl: 'assets/images/image_back2.jpg',
    musicTitle: '음악1',
  ),
  MusicEntry(
    index: 2,
    musicImgUrl: 'assets/images/image_back3.jpg',
    musicTitle: '음악2',
  ),
  MusicEntry(
    index: 3,
    musicImgUrl: 'assets/images/image_back4.jpg',
    musicTitle: '음악3',
  ),
  MusicEntry(
    index: 4,
    musicImgUrl: 'assets/images/image_back.jpg',
    musicTitle: '음악4',
  ),
  MusicEntry(
    index: 5,
    musicImgUrl: 'assets/images/image_back3.jpg',
    musicTitle: '음악5',
  ),
];
/*
  // index : "1" , image: "
  {'index': '1', 'image': 'assets/images/maru1.jpeg', 'text': 'Musssssic 1'},
  {'index': '2', 'image': 'assets/images/maru2.jpeg', 'text': 'Music 2'},
  {'index': '3', 'image': 'assets/images/maru3.jpeg', 'text': 'Music 3'},
  {'index': '4', 'image': 'assets/images/maru4.jpeg', 'text': 'Music 4'},
  {'index': '5', 'image': 'assets/images/maru1.jpeg', 'text': 'Music 5'},
*/
