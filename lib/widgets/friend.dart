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
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: _tag2Img().image,
          radius: 35.0,
        ),
        Column(
          children: [
            Text(
              _tag2Name(),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              userTag,
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
