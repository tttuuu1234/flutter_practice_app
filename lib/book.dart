import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  Book(DocumentSnapshot doc) {
    id = doc.id;
    title = doc.data()['title'];
  }

  String id;
  String title;
}
