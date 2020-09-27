import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_add.dart';
import 'package:todo_app/widgets/todo_edit.dart';

import './widgets/todo_lists.dart';

void main() async {
  runApp(Home());
}

class Home extends StatelessWidget {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      title: 'todoアプリ',
      home: TodoList(), // 最初に起動させたいページ
      // routesのなかには上記のhome引数の値を設定しない(無限ループっぽくなってアプリが落ちた)
      // homeに設定した値をroutesにかきたいならhomeを消してから、routesにかく
      routes: <String, WidgetBuilder>{
        '/add': (BuildContext context) => new TodoAdd(),
        '/edit': (BuildContext context) => new TodoEdit(),
      },
    );
  }
}
