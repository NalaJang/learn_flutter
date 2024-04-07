import 'package:flutter/material.dart';

import '../../data/mock_data.dart';
import '../home/home_sreen.dart';
import '../order/order_screen.dart';
import '../other/other_screen.dart';
import '../pay/pay_screen.dart';
import '../shop/shop_screen.dart';

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
      HomeScreen(whatsNews: ModeData.whatsNew),
      PayScreen(),
      OrderScreen(),
      ShopScreen(),
      OtherScreen(),
    ];

    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.payment_outlined), label: 'Pay'),
          BottomNavigationBarItem(icon: Icon(Icons.local_drink), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'Other'),
        ],
      ),
    );
  }
}
