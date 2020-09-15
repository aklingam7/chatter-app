import 'package:flutter/material.dart';
import 'dart:core';

import '../main.dart';
import '../routes/friends.dart';

class NavDrawer extends StatelessWidget {
  final Function setState;
  final int curScr;
  final BuildContext postscontext;
  final BuildContext friendscontext;

  NavDrawer(this.setState, this.curScr,
      {this.postscontext, this.friendscontext});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                        (users[currentUser]['image'] as Image).image,
                    radius: 35.0,
                  ),
                  Spacer(),
                  FloatingActionButton(
                    heroTag: (curScr == 0)
                        ? "btn1"
                        : (curScr == 1) ? "btn3" : "btn10",
                    child: Icon(swap_icon),
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
        ...(curScr == 0)
            ? [
                ListTile(
                  leading: Icon(posts_icon),
                  title: Text('Posts'),
                  onTap: () {
                    Navigator.pop(postscontext);
                  },
                ),
                ListTile(
                  leading: Icon(friends_icon),
                  title: Text('Friends'),
                  onTap: () async {
                    var navigationResult = await Navigator.push(postscontext,
                        new MaterialPageRoute(builder: (context) => Friends()));

                    Navigator.pop(postscontext);
                    setState(() {});
                  },
                ),
              ]
            : [
                ListTile(
                  leading: Icon(posts_icon),
                  title: Text('Posts'),
                  onTap: () {
                    print('objecthello');

                    Navigator.pop(friendscontext);
                    Navigator.pop(friendscontext);
                  },
                ),
                ListTile(
                  leading: Icon(friends_icon),
                  title: Text('Friends'),
                  onTap: () {
                    Navigator.pop(friendscontext);
                  },
                ),
              ]
      ],
    );
  }
}
