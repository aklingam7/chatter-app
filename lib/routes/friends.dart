import 'package:flutter/material.dart';

import '../main.dart';
import 'dart:io';
import 'posts.dart';

import '../widgets/friend.dart';
import '../widgets/info_card.dart';

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  final _formKey = GlobalKey<FormState>();

  final passwordFieldController = TextEditingController();
  final tagFieldController = TextEditingController();

  static const IconData add_friend_icon =
      IconData(59376, fontFamily: 'MaterialIcons');

  Widget friendsList() {
    if ((users[currentUser]['friends'] as List<String>).length != 0) {
      List<Widget> list = [];
      for (var c in users[currentUser]['friends']) {
        list.add(Friend(userTag: c));
      }
      return Container(
        width: double.infinity,
        child: ListView(
          children: list,
        ),
      );
    } else {
      return Center(
        child: Text(
          "You havn\'t added any friends.",
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
    return WillPopScope(
      onWillPop: () async {
        _popNavigationWithResult(context, 'from_back');
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Friends'),
            actions: <Widget>[
              IconButton(
                icon: Icon(info_icon),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return InfoCard();
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
                            heroTag: "btn3",
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
                    _popNavigationWithResult(context, 'from_button');
                  },
                ),
                ListTile(
                  leading: Icon(friends_icon),
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
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(7.0),
                                  child: Text(
                                    "Add a Friend:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: Text(
                                    "What\'s my friends tag?",
                                    //style: TextStyle(
                                    //fontSize: 20,
                                    //fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: Image(
                                    image: tagHelp.image,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 18.0,
                                    bottom: 1.0,
                                  ),
                                  child: Text("Friend\'s Tag"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: TextField(
                                    controller: tagFieldController,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 18.0,
                                    bottom: 1.0,
                                  ),
                                  child: Text("Parent\'s password"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: TextField(
                                    controller: passwordFieldController,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: RaisedButton(
                                    child: Text("Add the Friend!"),
                                    onPressed: () {
                                      if (passwordFieldController.text ==
                                          "0743") {
                                        //print("object-u");
                                        if (users[currentUser]['tag'] ==
                                            tagFieldController.text) {
                                          //print("object");
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: Text('Error!'),
                                              content: Text(
                                                  'You can\'t add yourself as a friend'),
                                            ),
                                          );
                                        } else {
                                          var exists = false;
                                          for (var k in users) {
                                            if (k['tag'] ==
                                                tagFieldController.text) {
                                              (users[currentUser]['friends']
                                                      as List<String>)
                                                  .add(tagFieldController.text);
                                              (users[users.indexOf(k)]
                                                          ['friends']
                                                      as List<String>)
                                                  .add(users[currentUser]
                                                      ['tag']);
                                              exists = true;
                                              Navigator.pop(context);
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                  title: Text('Added Friend!'),
                                                  content: Text((k['name']
                                                          as String) +
                                                      ' was added as a friend!' +
                                                      '😀'),
                                                ),
                                              );
                                            }
                                          }
                                          if (exists == false) {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      title:
                                                          Text('Invalid Tag!'),
                                                      content: Text(tagFieldController
                                                              .text +
                                                          ' is not a valid tag!' +
                                                          ' 😥' +
                                                          '\nAn Example: #123456'),
                                                    ));
                                          }
                                        }
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text('Incorrect Password!'),
                                            content: Text(
                                              passwordFieldController.text +
                                                  ' is the wrong password!' +
                                                  ' 😥' +
                                                  '\nNote to the reviewers of this app: the password is 0743',
                                            ),
                                          ),
                                        );
                                      }

                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();
                                      }
                                      tagFieldController.clear();
                                      passwordFieldController.clear();
                                      sleep(const Duration(milliseconds: 50));
                                      //print(users[currentUser]['friends']);
                                      setState(() {});
                                      tagFieldController.clear();
                                      passwordFieldController.clear();
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
              tagFieldController.clear();
              passwordFieldController.clear();
              sleep(const Duration(milliseconds: 50));
              //print(users[currentUser]['friends']);
              setState(() {});
              tagFieldController.clear();
              passwordFieldController.clear();
            },
            child: Icon(add_friend_icon),
          ),
          body: friendsList()),
    );
  }

  void _popNavigationWithResult(BuildContext context, dynamic result) {
    Navigator.pop(context, result);
  }
}
