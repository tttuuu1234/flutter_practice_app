import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/book_list.dart';
import './add_book.dart';

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本一覧'),
        ),
        body: Consumer<BookListModel>(
          builder: (context, model, child) {
            // model.booksは、model(BookListModel)ないで定義しているbooks
            final books = model.books;
            final listTiles = books
                .map(
                  (book) => ListTile(
                    title: Text(book.title),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddBook(
                              book: book,
                            ),
                            fullscreenDialog: true,
                          ),
                        );
                        model.fetchBooks();
                      },
                    ),
                  ),
                )
                .toList();
            return ListView(
              children: listTiles,
            );
          },
        ),
        floatingActionButton: Consumer<BookListModel>(
          builder: (context, model, child) {
            return FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddBook(),
                    fullscreenDialog: true,
                  ),
                );
                model.fetchBooks();
              },
            );
          },
        ),
        // body: StreamBuilder<QuerySnapshot>(
        //   stream: FirebaseFirestore.instance.collection('books').snapshots(),
        //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //     return ListView(
        //       children: snapshot.data.docs.map((DocumentSnapshot document) {
        //         return ListTile(
        //           title: Text(document.data()['title']),
        //         );
        //       }).toList(),
        //     );
        //   },
        // ),
      ),
    );
  }
}
