import 'package:flutter/material.dart';

class TodoAdd extends StatefulWidget {
  @override
  _TodoAddState createState() => _TodoAddState();
}

class _TodoAddState extends State<TodoAdd> {
  String _todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo追加'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Form(
              child: TextFormField(
                decoration: InputDecoration(labelText: '今日する事を入力しよう！'),
                keyboardType: TextInputType.text,
                onChanged: (String value) {
                  setState(
                    () {
                      _todo = value;
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
                      child: Text('追加'),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      onPressed: () {
                        // popで前の画面に戻させる 前の画面にのっかている画面を取り除くイメージ
                        Navigator.of(context).pop(_todo);
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
