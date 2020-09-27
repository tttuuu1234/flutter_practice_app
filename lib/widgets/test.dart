import 'package:flutter/material.dart';

// import './todo_lists.dart';

class Test extends StatelessWidget {
  final String name;

  Test(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ああああああああああ'),
      ),
      // body: Container(
      //   child: Column(
      //     children: <Widget>[
      //       // Image.asset('images/0008781035769226-web.jpg'),
      //       // Image.network(
      //       //   'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
      //       // ),
      //       Icon(Icons.access_time),
      //       Text(name + 'がテスとページにきました'),
      //       IconButton(
      //         icon: Icon(Icons.ac_unit),
      //         onPressed: () {
      //           Navigator.pop(context, 'ツバサくんが戻ったよ');
      //         },
      //       ),
      //       TextField(
      //         autofocus: true,
      //         decoration: InputDecoration(hintText: '名前を入力 '),
      //         onChanged: (text) {
      //           print('変わっているかな? $text');
      //         },
      //       ),
      //       RaisedButton(
      //         child: Text('押してね'),
      //         onPressed: () {
      //           showDialog(
      //             context: context,
      //             builder: (context) {
      //               return AlertDialog(
      //                 content: Text('保存しますか？'),
      //               );
      //             },
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      // body: ListView(
      //     children: <Widget>[
      //       ListTile(
      //         leading: Icon(Icons.map),
      //         title: Text('Map'),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.photo_album),
      //         title: Text('Album'),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.phone),
      //         title: Text('Phone'),
      //       ),
      //     ],
      //   ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 3,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(100, (index) {
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline5,
            ),
          );
        }),
      ),
    );
  }
}
