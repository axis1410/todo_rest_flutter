import 'package:flutter/material.dart  ';
import 'package:todo_rest/screens/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(),
      debugShowCheckedModeBanner: false,
      home: const TodoListPage(),
    );
  }
}
