import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/book.dart';
import 'package:todo_app/models/add_book.dart';

class AddBook extends StatelessWidget {
  AddBook({this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final bool isUpdate = book != null;
    final bookTitleController = TextEditingController();
    if (isUpdate) {
      bookTitleController.text = book.title;
    }

    return ChangeNotifierProvider<AddBookModel>(
      create: (_) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(isUpdate ? '本のタイトルを更新できるよ' : '本を追加できるよ'),
        ),
        body: Consumer<AddBookModel>(
          builder: (context, model, child) {
            return Column(
              children: [
                TextField(
                  controller: bookTitleController,
                  onChanged: (text) {
                    model.bookTitle = text;
                  },
                ),
                RaisedButton(
                  child: Text(isUpdate ? '更新' : '追加'),
                  onPressed: () async {
                    if (isUpdate) {
                      await updateBook(book, model, context);
                    } else {
                      await addBook(model, context);
                    }
                  },
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                )
              ],
            );
          },
        ),
        floatingActionButton:
            FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
      ),
    );
  }
}

// 本の追加
Future addBook(AddBookModel model, BuildContext context) async {
  try {
    await model.addBookToFirebase();
    Navigator.of(context).pop();
  } catch (e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('bookTitleに何も値が入っていないよ'),
        );
      },
    );
  }
}

// 本のタイトルの更新
Future updateBook(Book book, AddBookModel model, BuildContext context) async {
  try {
    await model.updateBookToFirebase(book);
    Navigator.of(context).pop();
  } catch (e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('bookTitleに何も値が入っていないから更新ができないよ'),
        );
      },
    );
  }
}
