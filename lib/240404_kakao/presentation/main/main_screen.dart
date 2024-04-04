import 'package:flutter/material.dart';
import 'package:learn_fluuter_together/240404_kakao/presentation/collections/collections.dart';
import 'package:learn_fluuter_together/240404_kakao/presentation/home/home_screen.dart';
import 'package:learn_fluuter_together/240404_kakao/presentation/my_subscribe/my_subscribe_screen.dart';
import 'package:learn_fluuter_together/240404_kakao/presentation/my_upload/upload_screen.dart';
import 'package:learn_fluuter_together/240404_kakao/presentation/shorts/shorts_screen.dart';

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
      const HomeScreen(),
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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.offline_bolt_outlined)),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline)),
          BottomNavigationBarItem(icon: Icon(Icons.subscriptions_outlined)),
          BottomNavigationBarItem(icon: Icon(Icons.video_library)),
        ],
      ),
    );
  }
}
