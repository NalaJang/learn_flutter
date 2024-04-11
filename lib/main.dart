import 'package:flutter/material.dart';
import 'package:learn_fluuter_together/240411/data/data_source/photo_data_source.dart';
import 'package:learn_fluuter_together/240411/data/repository/photo_repo_impl.dart';
import 'package:learn_fluuter_together/240411/presentation/search_list_screen.dart';
import 'package:learn_fluuter_together/240411/presentation/search_list_view_model.dart';
import 'package:learn_fluuter_together/xylophone_app/xylophone_app.dart';
import 'package:provider/provider.dart';

import '240403_layout/birthday_card.dart';
import 'electronicFrame/my_gallery_app.dart';
import 'sensor/sensor.dart';
import 'stop_watch/stop_watch_screen.dart';
import 'web_view/web_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => SearchListViewModel(
          repository: PhotoRepositoryImpl(
            dataSource: PhotoDataSource(),
          ),
        ),
        child: const XylophoneApp(),
      ),
    );
  }
}
