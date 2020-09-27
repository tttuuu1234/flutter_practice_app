import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/second_test.dart';

class SecondTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SecondTestModel>(
      create: (_) => SecondTestModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('二つ目のテストページです'),
        ),
        // Consumer<モデル名>
        body: Consumer<SecondTestModel>(builder: (context, model, child) {
          return Container(
            child: Center(
              child: Column(
                children: [
                  Text(
                    // model名.そのモデルに定義されている定数
                    SecondTestModel.name,
                    style: TextStyle(fontSize: 24),
                  ),
                  RaisedButton(
                    child: Text('ボタンです'),
                    onPressed: () {
                      model.changeText();
                    },
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
