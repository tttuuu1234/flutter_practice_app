import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/book.dart';

class AddBookModel extends ChangeNotifier {
  String bookTitle;

  void checkBookTitle() {
    if (bookTitle.isEmpty) {
      throw ErrorDescription('bookTitleはnullです');
    }
  }

  Future addBookToFirebase() async {
    checkBookTitle();

    FirebaseFirestore.instance.collection('books').add(
      {
        'title': bookTitle,
      },
    );
    print('追加成功 ' + bookTitle);
  }

  Future updateBookToFirebase(book) async {
    checkBookTitle();

    await FirebaseFirestore.instance.collection('books').doc(book.id).update(
      {
        'title': bookTitle,
        'updated_at': Timestamp.now(),
      },
    );

    print('更新完了 ' + bookTitle);
  }
}
