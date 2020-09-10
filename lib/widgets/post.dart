import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:io';

import '../main.dart';

class Post extends StatelessWidget {
  final String _userTag;
  final int _postIndex;

  Map _userMap;
  String _userName;
  Image _avatar;
  String _postText;
  File _image;
  String _time;
  String _date;

  Post(this._userTag, this._postIndex) {
    var tag = _userTag;
    var done = false;
    for (var mp in users) {
      if (mp['tag'] == tag) {
        done = true;
        this._userMap = mp;
      }
    }
    if (done == false) {
      this._userMap = null;
    }
    this._userName = _userMap['name'];
    this._avatar = _userMap['image'];
    this._postText = _userMap['posts'][_postIndex]['text'];
    this._image = _userMap['posts'][_postIndex]['image'];
    this._date = (_userMap['posts'][_postIndex]['date-time'] as DateTime)
            .day
            .toString() +
        '/' +
        (_userMap['posts'][_postIndex]['date-time'] as DateTime)
            .month
            .toString() +
        '/' +
        (_userMap['posts'][_postIndex]['date-time'] as DateTime)
            .year
            .toString();
    this._time = (_userMap['posts'][_postIndex]['date-time'] as DateTime)
            .hour
            .toString() +
        ':' +
        (_userMap['posts'][_postIndex]['date-time'] as DateTime)
            .minute
            .toString();
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
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: _avatar.image,
                  radius: 35.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _userName,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        _userTag,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _date,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        _time,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  color: Color.fromARGB(90, 210, 207, 200),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                child: Column(
                  children: (_image != null)
                      ? [
                          Text(
                            _postText,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(6),
                            child: Image.file(_image),
                            decoration: ShapeDecoration(
                              color: Color.fromARGB(90, 205, 201, 195),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                            ),
                          )
                        ]
                      : [
                          Text(
                            _postText,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
