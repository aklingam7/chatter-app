import 'package:flutter/material.dart';

import '../main.dart';

class Friend extends StatelessWidget {
  final String userTag;

  Friend({this.userTag});

  String _tag2Name() {
    var tag = userTag;
    var done = false;
    for (var m in users) {
      if (m['tag'] == tag) {
        done = true;
        return m['name'];
      }
    }
    if (done == false) {
      return "error";
    }
  }

  Image _tag2Img() {
    var tag = userTag;
    var done = false;
    for (var m in users) {
      if (m['tag'] == tag) {
        done = true;
        return m['image'];
      }
    }
    if (done == false) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 13, left: 10, right: 10, bottom: 1),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: ShapeDecoration(
          color: Color.fromARGB(90, 227, 226, 219),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: _tag2Img().image,
              radius: 35.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _tag2Name(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    userTag,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
