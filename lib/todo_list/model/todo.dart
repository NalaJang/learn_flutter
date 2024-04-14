import 'package:hive/hive.dart';

part 'todo.g.dart';

// Hive DB 에 저장
@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final int dateTime;

  Todo({
    required this.title,
    required this.dateTime,
  });
}