import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_fluuter_together/240411/data/data_source/photo_data_source.dart';
import 'package:learn_fluuter_together/240411/data/repository/photo_repo_impl.dart';
import 'package:learn_fluuter_together/240411/presentation/search_list_screen.dart';
import 'package:learn_fluuter_together/240411/presentation/search_list_view_model.dart';
import 'package:learn_fluuter_together/gps/gps_map_app.dart';
import 'package:learn_fluuter_together/todo_list/model/todo.dart';
import 'package:learn_fluuter_together/todo_list/presentation/list_screen.dart';
import 'package:learn_fluuter_together/xylophone_app/xylophone_app.dart';
import 'package:provider/provider.dart';

import '240403_layout/birthday_card.dart';
import 'electronicFrame/my_gallery_app.dart';
import 'sensor/sensor.dart';
import 'stop_watch/stop_watch_screen.dart';
import 'web_view/web_view_screen.dart';

late Box<Todo> todos;

void main() async {
  // Hive 초기화
  await Hive.initFlutter();
  // pubspec.yaml 의 hive_generator, build_runner 를 통해 g.dart 파일을 만들고
  // 그것들을 통해 TodoAdapter()를 만들 수 있다.
  Hive.registerAdapter(TodoAdapter());
  // todos(객체)를 통해서 DB 에 접근할 수 있다.
  todos = await Hive.openBox<Todo>('todolist.db');

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
        child: const ListScreen(),
      ),
    );
  }
}
