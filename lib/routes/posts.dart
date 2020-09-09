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
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Text(userNames[currentUser]),
                      Spacer(),
                      FloatingActionButton(
                        child: Icon(Posts.swap),
                        //width: 100,
                        onPressed: () => {
                          if ((currentUser + 1) != userNames.length)
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
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Posts'),
              onTap: () {
                // Update the state of the app.
                // ...
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
                  //showDialog(
                  //context: context,
                  //builder: (context) => AlertDialog(
                  //title: Text('Navigation from button'),
                  //));
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
