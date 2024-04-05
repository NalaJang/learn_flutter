
import 'package:learn_fluuter_together/240404_you_tube/data/model/video_model.dart';

import 'model/shorts_model.dart';

class MockData {
  static const List<VideoModel> videos = [
    VideoModel(
      videoImage: 'assets/images/img_you_tube_1.png',
      profileImage: 'assets/images/img_you_tube_profile.png',
      title: 'SegmentedButton',
      subtitle: 'Flutter',
      videoLength: '16:21',
    ),
    VideoModel(
      videoImage: 'assets/images/img_you_tube_2.png',
      profileImage: 'assets/images/img_you_tube_profile.png',
      title: 'Playlist 기분 좋은 하루의 시작',
      subtitle: '기분 재생목록',
      videoLength: '1:13:21',
    ),
    VideoModel(
      videoImage: 'assets/images/img_you_tube_3.png',
      profileImage: 'assets/images/img_you_tube_profile.png',
      title: 'SegmentedButton',
      subtitle: 'Flutter',
      videoLength: '50:40',
    ),
    VideoModel(
      videoImage: 'assets/images/img_you_tube_2.png',
      profileImage: 'assets/images/img_you_tube_profile.png',
      title: 'Playlist 기분 좋은 하루의 시작',
      subtitle: '기분 재생목록',
      videoLength: '1:13:21',
    )
  ];

  static const List<String> homeMenus = [
    '아이콘',
    '전체',
    '게임',
    '뉴스',
    '실시간',
    '믹스',
    '기타',
    '등등',
  ];

  static const List<ShortsModel> shorts = [
    ShortsModel(
      image: 'assets/images/img_shorts_1.png',
      title: "'화제의 전소미 하이라이터' 직접 써봤더니..!?",
      viewsTitle: '조회수',
      views: '34만회',
    ),
    ShortsModel(
      image: 'assets/images/img_shorts_2.png',
      title: '한국인이면 무조권 좋아함',
      viewsTitle: '조회수',
      views: '201만회',
    ),
    ShortsModel(
      image: 'assets/images/img_shorts_3.png',
      title: 'How to use Themes in #Flutter',
      viewsTitle: '조회수',
      views: '2.3만회',
    ),
    ShortsModel(
      image: 'assets/images/img_shorts_1.png',
      title: "'화제의 전소미 하이라이터' 직접 써봤더니..!?",
      viewsTitle: '조회수',
      views: '34만회',
    ),
  ];
}
