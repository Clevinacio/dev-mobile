import 'package:flutter/material.dart';
import 'package:tutorial_flutter/views/TaskDetailPage.dart';
import 'package:tutorial_flutter/views/TodoListPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (c) => const TodoListPage(),
        '/task-detail': (c) => TaskDetailPage(),
      },
    );
  }
}
