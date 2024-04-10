import 'package:flutter/material.dart';

import '240403_layout/birthday_card.dart';
import 'electronicFrame/my_gallery_app.dart';
import 'stop_watch/stop_watch_screen.dart';
import 'web_view/web_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyGalleryApp(),
    );
  }
}
