import 'package:flutter/material.dart';

class NewPost extends StatelessWidget {

  static const IconData arrow_back = IconData(0xe5c4, fontFamily: 'MaterialIcons', matchTextDirection: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new post:'),
        actions: <Widget>[
          IconButton(
            icon: Icon(arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
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
