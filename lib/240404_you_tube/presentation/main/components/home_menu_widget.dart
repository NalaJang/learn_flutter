import 'package:flutter/material.dart';
import 'package:learn_fluuter_together/240404_you_tube/data/model/home_menu_model.dart';

class HomeMenuWidget extends StatelessWidget {
  final HomeMenuModel homeMenu;

  const HomeMenuWidget({
    super.key,
    required this.homeMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.only(
          top: 5,
          bottom: 5,
          left: 10,
          right: 10,
        ),
        child: Text(homeMenu.name),
      ),
    );
  }
}
