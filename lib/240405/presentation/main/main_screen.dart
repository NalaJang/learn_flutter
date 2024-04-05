import 'package:flutter/material.dart';
import 'package:learn_fluuter_together/240405/presentation/home/home_sreen.dart';
import 'package:learn_fluuter_together/240405/presentation/order/order_screen.dart';
import 'package:learn_fluuter_together/240405/presentation/other/other_screen.dart';
import 'package:learn_fluuter_together/240405/presentation/pay/pay_screen.dart';
import 'package:learn_fluuter_together/240405/presentation/shop/shop_screen.dart';

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
      HomeScreen(),
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
