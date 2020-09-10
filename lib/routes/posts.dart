import 'dart:core';

import 'package:flutter/material.dart';

import '../main.dart';
import 'friends.dart';
import 'new_post.dart';

import '../widgets/post.dart';
import '../widgets/info_card.dart';

class Posts extends StatefulWidget {
  static const IconData add_icon =
      IconData(0xe145, fontFamily: 'MaterialIcons');
  static const IconData swap_icon =
      IconData(59604, fontFamily: 'MaterialIcons');

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  Widget postList() {
    List<int> displayingUsers = [currentUser];
    List<Map> postsUnordered = [];
    List<String> dateTimes;
    List<Map> postsOrdered = [];
    for (var jk in users[currentUser]['friends']) {
      var done = false;
      for (var m in users) {
        if (m['tag'] == jk) {
          done = true;
          displayingUsers.add(users.indexOf(m));
        }
      }
      if (done == false) {
        throw "Error!";
      }
    }

    print(displayingUsers);

    for (var lt in displayingUsers) {
      if ((users[lt]['posts'] as List<Map>).isNotEmpty) {
        for (var jkl in users[lt]['posts']) {
          var hkl = jkl;
          hkl['user-index'] = lt;
          hkl['post-index'] = (users[lt]['posts'] as List<Map>).indexOf(jkl);
          postsUnordered.add(hkl);
        }
      }
    }

    print(postsUnordered);
    print(postsUnordered != []);
    print(postsUnordered.isNotEmpty);

    if (postsUnordered.isNotEmpty) {
      for (var post in postsUnordered) {
        print((dateTimes == null).toString() + ".....");
        //print(post[]);
        if (dateTimes != null) {
          dateTimes.add((post['date-time'] as DateTime).year.toString() +
              (post['date-time'] as DateTime).month.toString() +
              (post['date-time'] as DateTime).day.toString() +
              (post['date-time'] as DateTime).hour.toString() +
              (post['date-time'] as DateTime).minute.toString() +
              (post['date-time'] as DateTime).second.toString() +
              (post['date-time'] as DateTime).millisecond.toString());
        } else {
          print("wed");
          dateTimes = [
            ((post['date-time'] as DateTime).year.toString() +
                (post['date-time'] as DateTime).month.toString() +
                (post['date-time'] as DateTime).day.toString() +
                (post['date-time'] as DateTime).hour.toString() +
                (post['date-time'] as DateTime).minute.toString() +
                (post['date-time'] as DateTime).second.toString() +
                (post['date-time'] as DateTime).millisecond.toString())
          ];
          print("wed");
        }
      }

      print(dateTimes);

      dateTimes.sort((b, a) => a.toString().compareTo(b.toString()));

      print(dateTimes);

      for (var datetime in dateTimes) {
        var done = false;
        for (var thing in postsUnordered) {
          if (datetime ==
              ((thing['date-time'] as DateTime).year.toString() +
                  (thing['date-time'] as DateTime).month.toString() +
                  (thing['date-time'] as DateTime).day.toString() +
                  (thing['date-time'] as DateTime).hour.toString() +
                  (thing['date-time'] as DateTime).minute.toString() +
                  (thing['date-time'] as DateTime).second.toString() +
                  (thing['date-time'] as DateTime).millisecond.toString())) {
            done = true;
            postsOrdered.add(thing);
          }
        }
        if (done == false) {
          throw "Error! (2)";
        }
      }

      print(postsOrdered.toString() + 'dd');

      List<Widget> postWidgets = [];
      for (var individualPost in postsOrdered) {
        if (postWidgets.isNotEmpty) {
          postWidgets.add(Post(users[individualPost['user-index']]['tag'],
              individualPost['post-index']));
        } else {
          postWidgets = [
            Post(users[individualPost['user-index']]['tag'],
                individualPost['post-index'])
          ];
        }
      }

      print(postsOrdered.toString() + 'dd');

      return Container(
        width: double.infinity,
        child: ListView(
          children: postWidgets,
        ),
      );
    } else {
      return Center(
        child: Text(
          "Nothing here yet.",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        actions: <Widget>[
          IconButton(
            icon: Icon(info_icon),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: InfoCard(),
                  );
                },
              );
            },
          ),
        ],
      ),
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
                            (users[currentUser]['image'] as Image).image,
                        radius: 35.0,
                      ),
                      Spacer(),
                      FloatingActionButton(
                        heroTag: "btn1",
                        child: Icon(Posts.swap_icon),
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
              leading: Icon(posts_icon),
              title: Text('Posts'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(friends_icon),
              title: Text('Friends'),
              onTap: () async {
                var navigationResult = await Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Friends()));

                if (navigationResult == 'from_back') {
                  Navigator.pop(context);
                  setState(() {});
                } else if (navigationResult == 'from_button') {
                  Navigator.pop(context);
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn2",
        child: Icon(Posts.add_icon),
        onPressed: () async {
          var navigationResult = await Navigator.push(context,
              new MaterialPageRoute(builder: (context) => NewPost(setState)));

          //if (navigationResult == 'from_button' ||
          //navigationResult == 'from_back') {
          //setState(() {});
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
      body: postList(),
    );
  }
}
