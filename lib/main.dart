import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_flutter_together/240411/core/router.dart';
import 'package:learn_flutter_together/240411/di/di_setup.dart';
import 'package:learn_flutter_together/todo_list/model/todo.dart';

late Box<Todo> todos;

void main() async {
  // Hive 초기화
  await Hive.initFlutter();
  // pubspec.yaml 의 hive_generator, build_runner 를 통해 g.dart 파일을 만들고
  // 그것들을 통해 TodoAdapter()를 만들 수 있다.
  Hive.registerAdapter(TodoAdapter());
  // todos(객체)를 통해서 DB 에 접근할 수 있다.
  todos = await Hive.openBox<Todo>('todolist.db');

  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
