import 'package:flutter/material.dart';
import 'package:learn_fluuter_together/main.dart';
import 'package:learn_fluuter_together/todo_list/model/todo.dart';
import 'package:learn_fluuter_together/todo_list/presentation/components/todo_item.dart';
import 'package:learn_fluuter_together/todo_list/presentation/create_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo 리스트'),
      ),
      body: ListView(
        children: todos.values
            .map((e) => TodoItem(
                  todo: e,
                  onTap: (todo) async {
                    todo.isDone = !todo.isDone;
                    // Hive 메서드
                    await todo.save();

                    setState(() {});
                  },
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 메모 작성 후 돌아올 때 await 를 걸어서 기다리게 해서
          // DB 의 내용을 리스트에 갱신한다.
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateScreen()),
          );

          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
