import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AddBookModel extends ChangeNotifier {
  String bookTitle;

  Future addBookToFirebase() async {
    if (bookTitle.isEmpty) {
      throw ErrorDescription('bookTitleに何もないよ');
    }

    FirebaseFirestore.instance.collection('books').add(
      {
        'title': bookTitle,
      },
    );
    print('追加成功 ' + bookTitle);
  }
}
