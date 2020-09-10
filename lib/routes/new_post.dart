import 'package:chatter/main.dart';
import 'package:flutter/material.dart';
import 'dart:core';

import '../main.dart';

class NewPost extends StatelessWidget {
  static const IconData arrow_back_icon =
      IconData(0xe5c4, fontFamily: 'MaterialIcons', matchTextDirection: true);
  static const IconData check_icon =
      IconData(58826, fontFamily: 'MaterialIcons');

  final ptFieldController = TextEditingController();

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
        onPressed: () {
          var dt = new DateTime.now();
          if (ptFieldController.text.length != 0) {
            (users[currentUser]['posts'] as List<Map>).add(
              {
                'date-time': dt,
                'text': ptFieldController.text,
                //'image': ,
              },
            );
            Navigator.pop(context);
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error!"),
                content: Text(
                    'You need to write something in the Text Box before you try to post.'),
              ),
            );
          }
        },
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: 3,
              ),
              child: Text(
                "Your Post: ",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 3,
                bottom: 20,
              ),
              child: TextField(
                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: 8,
                controller: ptFieldController,
                decoration: InputDecoration(
                  hintText: 'What would you like you friends to know?',
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: 1,
              ),
              child: Text(
                "Add Image (optional): ",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ), //I'm here filling this with new post stuff
      ),
    );
  }
}
