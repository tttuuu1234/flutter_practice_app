import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_add.dart';
import 'package:todo_app/widgets/todo_edit.dart';

import './widgets/todo_lists.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todoアプリ',
      home: TodoList(), // 最初に起動させたいページ
      // routesのなかには上記のhome引数の値を設定しない(無限ループっぽくなってアプリが落ちた)
      // homeに設定した値をroutesにかきたいならhomeを消してから、routesにかく
      routes: <String, WidgetBuilder> {
        '/add': (BuildContext context) => new TodoAdd(),
        '/edit': (BuildContext context) => new TodoEdit(),
      },
    );
  }
}