import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter_together/240404_you_tube/data/model/home_menu_model.dart';
import 'package:learn_flutter_together/240404_you_tube/data/model/shorts_model.dart';
import 'package:learn_flutter_together/240404_you_tube/data/model/video_model.dart';
import 'package:learn_flutter_together/240404_you_tube/presentation/main/components/home_menu_widget.dart';
import 'package:learn_flutter_together/240404_you_tube/presentation/main/components/shorts_widget.dart';
import 'package:learn_flutter_together/240404_you_tube/presentation/main/components/video_list_widget.dart';

class HomeScreen extends StatelessWidget {
  final List<HomeMenuModel> homeMenus;
  final List<VideoModel> videos;
  final List<ShortsModel> shorts;

  const HomeScreen({
    super.key,
    required this.homeMenus,
    required this.videos,
    required this.shorts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _appBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                _homeMenu(),
                _videoList(),
                _shorts(),
                _videoList(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      // 스크롤 다운했을 때 appBar 가 화면 위로 사라짐
      floating: true,
      leading: Image.asset('assets/images/ic_you_tube.png'),
      actions: const [
        Icon(Icons.cast),
        SizedBox(
          width: 20,
        ),
        Icon(Icons.notifications_none),
        SizedBox(
          width: 20,
        ),
        Icon(Icons.search_outlined),
        SizedBox(
          width: 20,
        ),
        Icon(Icons.person),
      ],
    );
  }

  Widget _homeMenu() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: homeMenus
            .map((homeMenu) => HomeMenuWidget(homeMenu: homeMenu))
            .toList(),
      ),
    );
  }

  Widget _videoList() {
    return Column(
      children:
          videos.map((video) => VideoListWidget(videoModel: video)).toList(),
    );
  }

  Widget _shorts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/ic_shorts.png'),
        const SizedBox(height: 10,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: shorts.map((shorts) => ShortsWidget(shorts: shorts)).toList(),
          ),
        ),
      ],
    );
  }
}
