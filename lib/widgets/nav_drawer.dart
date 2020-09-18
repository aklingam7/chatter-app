import 'package:chatter/routes/parental_ctrls.dart';
import 'package:chatter/routes/posts.dart';
import 'package:flutter/material.dart';
import 'dart:core';

import '../main.dart';
import '../routes/friends.dart';

class NavDrawer extends StatelessWidget {
  final Function setState;
  final int curScr;
  final Function postsSetState;
  final BuildContext postscontext;
  final BuildContext friendscontext;
  final BuildContext pctrlcontext;
  final pinFieldController = TextEditingController();
  static Function rpop;

  NavDrawer(
    this.setState,
    this.curScr, {
    this.postsSetState,
    this.postscontext,
    this.friendscontext,
    this.pctrlcontext,
  });

  @override
  Widget build(BuildContext context) {
    rpop = () {
      Navigator.pop(context);
    };

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
                    var navigationResult = await Navigator.push(
                      postscontext,
                      new MaterialPageRoute(
                        builder: (context) => Friends(),
                      ),
                    );

                    Navigator.pop(postscontext);
                    setState(() {});
                  },
                ),
                ListTile(
                    leading: Icon(pctrl_icon),
                    title: Text('Parental Controls'),
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Enter'),
                              onPressed: () async {
                                var tempPin = pinFieldController.text;
                                if (tempPin == pin) {
                                  Navigator.pop(postscontext);
                                  print(0);
                                  Posts.changeScreen(0);

                                  print(4);
                                } else {
                                  var tempErrorMessageB = (pinFieldController
                                              .text !=
                                          "")
                                      ? pinFieldController.text +
                                          ' is the wrong pin!' +
                                          ' 😥' +
                                          '\nNote to the reviewers of this app: the default pin is 0743'
                                      : null;
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text((tempErrorMessageB != null)
                                          ? "Incorrect Pin!"
                                          : "Error!"),
                                      content: Text(
                                        tempErrorMessageB ??
                                            "You haven't entered a Pin",
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('Okay'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                          content: Stack(
                            children: <Widget>[
                              Positioned(
                                right: 0.0,
                                child: GestureDetector(
                                  onTap: () {
                                    pinFieldController.clear();
                                    Navigator.of(context).pop();
                                  },
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: CircleAvatar(
                                      radius: 14.0,
                                      backgroundColor: Colors.white,
                                      child:
                                          Icon(Icons.close, color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: double.maxFinite,
                                      padding: EdgeInsets.all(7.0),
                                      child: Center(
                                        child: Text(
                                          "Enter the Pin:",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextField(
                                      controller: pinFieldController,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
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
                    /*onTap: () async {
                    var navigationResult = await Navigator.push(
                      postscontext,
                      new MaterialPageRoute(
                        builder: (context) => ParentalControls(),
                      ),
                    );

                    Navigator.pop(postscontext);
                    setState(() {});
                  },*/
                    ),
              ]
            : (curScr == 1)
                ? [
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
                    ListTile(
                      leading: Icon(pctrl_icon),
                      title: Text('Parental Controls'),
                      onTap: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertDialog(
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Enter'),
                                onPressed: () {
                                  var tempPin = pinFieldController.text;
                                  if (tempPin == pin) {
                                    Navigator.pop(friendscontext);
                                    Posts.changeScreen(1);
                                    Navigator.of(context).pop();
                                  } else {
                                    var tempErrorMessageB = (pinFieldController
                                                .text !=
                                            "")
                                        ? pinFieldController.text +
                                            ' is the wrong pin!' +
                                            ' 😥' +
                                            '\nNote to the reviewers of this app: the default pin is 0743'
                                        : null;
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text((tempErrorMessageB != null)
                                            ? "Incorrect Pin!"
                                            : "Error!"),
                                        content: Text(
                                          tempErrorMessageB ??
                                              "You haven't entered a Pin",
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('Okay'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                            content: Stack(
                              children: <Widget>[
                                Positioned(
                                  right: 0.0,
                                  child: GestureDetector(
                                    onTap: () {
                                      pinFieldController.clear();
                                      Navigator.of(context).pop();
                                    },
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: CircleAvatar(
                                        radius: 14.0,
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.close,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: double.maxFinite,
                                        padding: EdgeInsets.all(7.0),
                                        child: Center(
                                          child: Text(
                                            "Enter the Pin:",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextField(
                                        controller: pinFieldController,
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ]
                : [
                    ListTile(
                      leading: Icon(posts_icon),
                      title: Text('Posts'),
                      onTap: () {
                        print('objecthello');

                        Navigator.pop(pctrlcontext);
                        Navigator.pop(pctrlcontext);
                      },
                    ),
                    ListTile(
                      leading: Icon(friends_icon),
                      title: Text('Friends'),
                      onTap: () {
                        Navigator.pop(pctrlcontext);

                        Posts.changeScreen(2);
                      },
                    ),
                    ListTile(
                      leading: Icon(pctrl_icon),
                      title: Text('Parental Controls'),
                      onTap: () {
                        Navigator.pop(pctrlcontext);
                      },
                    ),
                  ]
      ],
    );
  }
}
