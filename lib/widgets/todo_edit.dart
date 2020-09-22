import 'package:flutter/material.dart';

class TodoEdit extends StatefulWidget {
  @override
  _TodoEditState createState() => _TodoEditState();
}

class _TodoEditState extends State<TodoEdit> {
  Map _todo;
  String _newTodo;

  @override
  Widget build(BuildContext context) {
    final Map _targetTodo = ModalRoute.of(context).settings.arguments;
    _todo = _targetTodo;

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo編集'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Form(
              child: TextFormField(
                initialValue: _todo['todo'],
                decoration: InputDecoration(labelText: '今日する事を編集しよう！'),
                keyboardType: TextInputType.text,
                onChanged: (String value) {
                  setState(
                    () {
                      _newTodo = value;
                    },
                  );
                },
              ),
            ),
          ),
          Container(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 30),
                  child: SizedBox(
                    child: RaisedButton(
                      child: Text('編集'),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      onPressed: () {
                        if (_newTodo == null) {
                          Navigator.of(context).pop();
                        }
                        print('編集ボタン押下 ' + _newTodo);
                        _todo['todo'] = _newTodo;
                        // popで前の画面に戻させる 前の画面にのっかている画面を取り除くイメージ
                        Navigator.of(context).pop(_newTodo);
                      },
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    child: RaisedButton(
                      child: Text('キャンセル'),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      onPressed: () {
                        // popで前の画面に戻させる 前の画面にのっかている画面を取り除くイメージ
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
