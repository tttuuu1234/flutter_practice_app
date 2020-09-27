import 'package:flutter/material.dart';

class SecondTestModel extends ChangeNotifier {
  static String name = 'ツバサ';

  void changeText() {
    name = 'ツバサくんから隆くんへ';
    // notifyListeners()でこのモデルのclassを使用しているConsumerに変更を知らせてくれる
    notifyListeners();
  }
}
