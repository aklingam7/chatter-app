import 'dart:core';

import 'package:flutter/material.dart';

import '../main.dart';
import 'friends.dart';
import 'new_post.dart';

class Posts extends StatefulWidget {
  static const IconData add = IconData(0xe145, fontFamily: 'MaterialIcons');
  static const IconData swap = IconData(59604, fontFamily: 'MaterialIcons');

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage:
                            currentUser == 0 ? avatar1.image : avatar2.image,
                        radius: 35.0,
                      ),
                      Spacer(),
                      FloatingActionButton(
                        heroTag: "btn1",
                        child: Icon(Posts.swap),
                        //width: 100,
                        onPressed: () => {
                          if ((currentUser + 1) != users.length)
                            {
                              setState(() {
                                currentUser += 1;
                              })
                            }
                          else
                            {
                              setState(() {
                                currentUser = 0;
                              })
                            }
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Column(
                      children: <Widget>[
                        Text(
                          users[currentUser]['name'],
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          users[currentUser]['tag'],
                          style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Posts'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Friends'),
              onTap: () async {
                var navigationResult = await Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Friends()));

                if (navigationResult == 'from_back') {
                  Navigator.pop(context);
                } else if (navigationResult == 'from_button') {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn2",
        child: Icon(Posts.add),
        onPressed: () async {
          var navigationResult = await Navigator.push(
              context, new MaterialPageRoute(builder: (context) => NewPost()));

          //if (navigationResult == 'from_back') {
          //Navigator.pop(context);
          //} else if (navigationResult == 'from_button') {
          //Navigator.pop(context);
          //showDialog(
          //context: context,
          //builder: (context) => AlertDialog(
          //title: Text('Navigation from button'),
          //));
          //}
        },
      ),
      body: Container(
        child: Center(
          child: Text(
            'Page 1',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
