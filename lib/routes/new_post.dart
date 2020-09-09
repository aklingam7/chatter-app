import 'package:chatter/main.dart';
import 'package:flutter/material.dart';

class NewPost extends StatelessWidget {
  static const IconData arrow_back_icon =
      IconData(0xe5c4, fontFamily: 'MaterialIcons', matchTextDirection: true);
  static const IconData check_icon =
      IconData(58826, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(arrow_back_icon),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Create new post:'),
        actions: <Widget>[
          IconButton(
            icon: Icon(info_icon),
            onPressed: () {
              null;
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn5",
        child: Icon(check_icon),
        onPressed: () async {},
      ),
      body: Container(
        child: Center(
          child: Text(
            'Stuff',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
