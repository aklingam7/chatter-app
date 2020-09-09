import 'package:flutter/material.dart';

import '../main.dart';
import 'posts.dart';

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _popNavigationWithResult(context, 'from_back');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Friends')),
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
                          heroTag: "btn3",
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
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Column(
                        children: <Widget>[
                          Text(
                            userNames[currentUser],
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            userTags[currentUser],
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
                  _popNavigationWithResult(context, 'from_button');
                },
              ),
              ListTile(
                title: Text('Friends'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "btn4",
          onPressed: () {},
        ),
        body: Container(
          child: Center(
            child: Text('Page 2',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  void _popNavigationWithResult(BuildContext context, dynamic result) {
    Navigator.pop(context, result);
  }
}
