import 'package:flutter/material.dart';
import 'package:learn_fluuter_together/240404_you_tube/data/mock_data.dart';
import 'package:learn_fluuter_together/240404_you_tube/data/model/home_menu_model.dart';
import 'package:learn_fluuter_together/240404_you_tube/presentation/collections/collections.dart';
import 'package:learn_fluuter_together/240404_you_tube/presentation/home/home_screen.dart';
import 'package:learn_fluuter_together/240404_you_tube/presentation/my_subscribe/my_subscribe_screen.dart';
import 'package:learn_fluuter_together/240404_you_tube/presentation/my_upload/upload_screen.dart';
import 'package:learn_fluuter_together/240404_you_tube/presentation/shorts/shorts_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      HomeScreen(
        homeMenus:
            MockData.homeMenus.map((e) => HomeMenuModel(name: e)).toList(),
        videos: MockData.videos,
        shorts: MockData.shorts,
      ),
      const ShortsScreen(),
      const UploadScreen(),
      const MySubscribeScreen(),
      const CollectionsScreen(),
    ];
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.offline_bolt_outlined), label: 'shorts'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: '새 게시물'),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.subscriptions_outlined),
                Positioned(
                  right: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
            label: '구독',
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.video_library), label: '보관함'),
        ],
        selectedItemColor: Colors.white,
      ),
    );
  }
}
