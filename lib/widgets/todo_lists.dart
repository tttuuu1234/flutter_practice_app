import 'package:flutter/material.dart';

import './todo_add.dart';
import './todo_edit.dart';
import './test.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // 下記の記述の意味は、配列<連想配列<keyが文字列, vakueが文字列>>
  // List<Map<String, String>> todoLists
  // final List<Map<String, String>> _todoLists = [
  //   {
  //     'todo': 'flutter勉強する',
  //   },
  //   {
  //     'todo': '昼寝する',
  //   }
  // ];

  final List<String> _todoLists = [
    '勉強します',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo一覧'),
      ),
      body: ListView.builder(
        itemCount: _todoLists.length,
        itemBuilder: (context, index) {
          return Container(
            child: Card(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_todoLists[index]),
                    Container(
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () async {
                              final editedTodo =
                                  await Navigator.of(context).pushNamed(
                                '/edit',
                                arguments: {
                                  'todo': _todoLists[index],
                                },
                              );
                              print(editedTodo);
                              if (editedTodo == null) {
                                return;
                              }
                              setState(
                                () {
                                  _todoLists[index] = editedTodo;
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(
                                () {
                                  _todoLists.removeAt(index);
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.ac_unit),
                            onPressed: () async {
                              final test = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Test('ツバサ'),
                                ),
                              );
                              print(test);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // pushで目的の画面に遷移させる 現在のページにその遷移させたい画面を上に乗っけているイメージ
          final newListText = await Navigator.of(context).pushNamed('/add');
          if (newListText == null) {
            return;
          }
          setState(
            () {
              _todoLists.add(newListText);
            },
          );
        },
      ),
    );
  }
}
