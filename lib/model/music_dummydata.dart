class MusicDummyData {
  int index;
  String musicImgUrl;
  String musicTitle;
  List<String>? musicUrl;
  MusicDummyData({
    required this.index,
    required this.musicImgUrl,
    required this.musicTitle,
    this.musicUrl,
  });
}

final List<MusicDummyData> musicItems = [
  MusicDummyData(
    index: 1,
    musicImgUrl: 'assets/images/maru1.jpeg',
    musicTitle: '음악1',
  ),
  MusicDummyData(
    index: 2,
    musicImgUrl: 'assets/images/maru2.jpeg',
    musicTitle: '음악2',
  ),
  MusicDummyData(
    index: 3,
    musicImgUrl: 'assets/images/maru3.jpeg',
    musicTitle: '음악3',
  ),
  MusicDummyData(
    index: 4,
    musicImgUrl: 'assets/images/maru4.jpeg',
    musicTitle: '음악4',
  ),
  MusicDummyData(
    index: 5,
    musicImgUrl: 'assets/images/maru1.jpeg',
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
