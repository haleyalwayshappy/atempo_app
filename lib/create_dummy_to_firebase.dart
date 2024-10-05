import 'package:atempo_app/model/music_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class MusicService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 더미 데이터를 생성하고 Firestore에 저장
  Future<void> uploadDummyMusicData() async {
    List<Music> dummyData = _createDummyMusicData();

    for (var music in dummyData) {
      await _firestore.collection('music').add(music.toMap());
    }
  }

  // 더미 데이터 생성
  List<Music> _createDummyMusicData() {
    return [
      Music(
        musicImgUrl: 'https://example.com/image1.jpg',
        musicTitle: 'Music 1',
        musicDescription: 'Description for Music 1',
        runningTime: DateTime.now().add(Duration(minutes: 3)),
        musicUrl: 'https://example.com/music1.mp3',
      ),
      Music(
        musicImgUrl: 'https://example.com/image2.jpg',
        musicTitle: 'Music 2',
        musicDescription: 'Description for Music 2',
        runningTime: DateTime.now().add(Duration(minutes: 4)),
        musicUrl: 'https://example.com/music2.mp3',
      ),
      Music(
        musicImgUrl: 'https://example.com/image3.jpg',
        musicTitle: 'Music 3',
        musicDescription: 'Description for Music 3',
        runningTime: DateTime.now().add(Duration(minutes: 5)),
        musicUrl: 'https://example.com/music3.mp3',
      ),
      Music(
        musicImgUrl: 'https://example.com/image4.jpg',
        musicTitle: 'Music 4',
        musicDescription: 'Description for Music 4',
        runningTime: DateTime.now().add(Duration(minutes: 6)),
        musicUrl: 'https://example.com/music4.mp3',
      ),
      Music(
        musicImgUrl: 'https://example.com/image5.jpg',
        musicTitle: 'Music 5',
        musicDescription: 'Description for Music 5',
        runningTime: DateTime.now().add(Duration(minutes: 3)),
        musicUrl: 'https://example.com/music5.mp3',
      ),
      Music(
        musicImgUrl: 'https://example.com/image6.jpg',
        musicTitle: 'Music 6',
        musicDescription: 'Description for Music 6',
        runningTime: DateTime.now().add(Duration(minutes: 4)),
        musicUrl: 'https://example.com/music6.mp3',
      ),
      Music(
        musicImgUrl: 'https://example.com/image7.jpg',
        musicTitle: 'Music 7',
        musicDescription: 'Description for Music 7',
        runningTime: DateTime.now().add(Duration(minutes: 5)),
        musicUrl: 'https://example.com/music7.mp3',
      ),
      Music(
        musicImgUrl: 'https://example.com/image8.jpg',
        musicTitle: 'Music 8',
        musicDescription: 'Description for Music 8',
        runningTime: DateTime.now().add(Duration(minutes: 6)),
        musicUrl: 'https://example.com/music8.mp3',
      ),
      Music(
        musicImgUrl: 'https://example.com/image9.jpg',
        musicTitle: 'Music 9',
        musicDescription: 'Description for Music 9',
        runningTime: DateTime.now().add(Duration(minutes: 3)),
        musicUrl: 'https://example.com/music9.mp3',
      ),
      Music(
        musicImgUrl: 'https://example.com/image10.jpg',
        musicTitle: 'Music 10',
        musicDescription: 'Description for Music 10',
        runningTime: DateTime.now().add(Duration(minutes: 4)),
        musicUrl: 'https://example.com/music10.mp3',
      ),
    ];
  }
}
