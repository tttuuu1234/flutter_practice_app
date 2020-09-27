import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/add_book.dart';

class AddBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBookModel>(
      create: (_) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本を追加できるよ'),
        ),
        body: Consumer<AddBookModel>(
          builder: (context, model, child) {
            return Column(
              children: [
                TextField(
                  onChanged: (text) {
                    model.bookTitle = text;
                  },
                ),
                RaisedButton(
                  child: Text('追加'),
                  onPressed: () async {
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
