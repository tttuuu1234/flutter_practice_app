import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../book.dart';

class BookListModel extends ChangeNotifier {
  List<Book> books = [];

  Future fetchBooks() async {
    // firebaseからcollectionのbooksを取得している
    final documentSnapshots =
        await FirebaseFirestore.instance.collection('books').get();
    // 取得したbooksの配列を一つずつBookコンストラクタにtitleを入れて、値を保持するようにしている?
    // bookと言う型に変換しているらしい
    final docBooks = documentSnapshots.docs
        .map(
          (doc) => Book(
            // collection内のdocument内のtitleを引数に与えている
            doc.data()['title'],
          ),
        )
        .toList();
    print(books[1].title);
    // 定義したbooksにdocBooksをいれる
    this.books = docBooks;
    notifyListeners();
  }
}
