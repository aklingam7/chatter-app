import 'package:flutter/material.dart';

import '../main.dart';
import 'dart:io';
import 'posts.dart';

import '../widgets/friend.dart';
import '../widgets/info_card.dart';
import '../widgets/nav_drawer.dart';

class Friends extends StatefulWidget {
  static var sFriendsContext;
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  final _formKey = GlobalKey<FormState>();

  final passwordFieldController = TextEditingController();
  final tagFieldController = TextEditingController();

  static const IconData add_friend_icon =
      IconData(59376, fontFamily: 'MaterialIcons');

  Widget friendsList(Function rSetState) {
    if ((users[currentUser]['friends'] as List<String>).length != 0) {
      List<Widget> list = [];
      for (var c in users[currentUser]['friends']) {
        list.add(
          Friend(
            userTag: c,
            mode: 0,
            setState: rSetState,
          ),
        );
      }
      return Container(
        width: double.infinity,
        child: ListView(
          children: list,
        ),
      );
    } else {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            "You haven\'t added any friends.",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  Widget friendsInboxList(Function rSetState) {
    if ((users[currentUser]['friends-inbox'] as List<String>).length != 0) {
      List<Widget> list = [];
      for (var c in users[currentUser]['friends-inbox']) {
        list.add(
          Friend(
            userTag: c,
            mode: 1,
            setState: rSetState,
          ),
        );
      }
      return Container(
        width: double.infinity,
        child: ListView(
          children: list,
        ),
      );
    } else {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            "No friend requests right now.",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  Widget friendsOutboxList(Function rSetState) {
    if ((users[currentUser]['friends-outbox'] as List<String>).length != 0) {
      List<Widget> list = [];
      for (var c in users[currentUser]['friends-outbox']) {
        list.add(
          Friend(
            userTag: c,
            mode: 2,
            setState: rSetState,
          ),
        );
      }
      return Container(
        width: double.infinity,
        child: ListView(
          children: list,
        ),
      );
    } else {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            "You haven\'t sent any friend requests.",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  Widget friendsContent;
  Widget inboxContent;
  Widget outboxContent;

  _FriendsState() {}

  @override
  Widget build(BuildContext context) {
    this.friendsContent = friendsList(setState);
    this.inboxContent = friendsInboxList(setState);
    this.outboxContent = friendsOutboxList(setState);

    Posts.sPostsContext = context;

    return WillPopScope(
      onWillPop: () async {
        _popNavigationWithResult(context, 'from_back');
        return false;
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Friends'),
            actions: <Widget>[
              IconButton(
                icon: Icon(info_icon),
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return InfoCard(context);
                    },
                  );
                },
              ),
            ],
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.group),
                      Text("Friends"),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.inbox),
                      Text("Inbox"),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.send),
                      Text("Outbox"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          drawer: Drawer(
            child: NavDrawer(
              setState,
              1,
              postsSetState: Posts.sPostsSetState,
              postscontext: Posts.sPostsContext,
              friendscontext: context,
            ),

            /*
            ListView(
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
            */
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: "btn4",
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Add the Friend"),
                        onPressed: () {
                          print(users.where(
                                  (f) => f['tag'] == tagFieldController.text) ==
                              null);
                          if (passwordFieldController.text == pin) {
                            //print("object-u");
                            if (users[currentUser]['tag'] ==
                                tagFieldController.text) {
                              //print("object");
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Error!'),
                                  content: Text(
                                    'You can\'t add yourself as a friend.',
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
                            } else {
                              var exists = false;
                              for (var k in users) {
                                print(((users[currentUser]['friends']
                                                as List<String>)
                                            .where((f) =>
                                                f == tagFieldController.text)
                                            .isNotEmpty)
                                        .toString() +
                                    " hi");
                                print((users[currentUser]['friends']
                                        as List<String>)
                                    .where(
                                        (f) => f == tagFieldController.text));
                                if ((users[currentUser]['friends']
                                        as List<String>)
                                    .where((f) => f == tagFieldController.text)
                                    .isNotEmpty) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text('Error!'),
                                      content: Text(
                                        'You already added ' +
                                            k['name'] +
                                            ' as a friend',
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
                                  exists = true;
                                  break;
                                }

                                if ((users[currentUser]['friends-outbox']
                                        as List<String>)
                                    .where((f) => f == tagFieldController.text)
                                    .isNotEmpty) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text('Error!'),
                                      content: Text(
                                        'You already sent a friend request to ' +
                                            k['name'] +
                                            '.',
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
                                  exists = true;
                                  break;
                                }

                                if (k['tag'] == tagFieldController.text) {
                                  (users[currentUser]['friends-outbox']
                                          as List<String>)
                                      .add(tagFieldController.text);
                                  (users[users.indexOf(k)]['friends-inbox']
                                          as List<String>)
                                      .add(users[currentUser]['tag']);

                                  exists = true;
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text('Request Sent!'),
                                      content: Text(
                                        'A friend request was sent to ' +
                                            (k['name'] as String) +
                                            '!' +
                                            ' 😀',
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
                                  break;
                                }
                              }
                              if (exists == false) {
                                var tempErrorMessageA =
                                    (tagFieldController.text != "")
                                        ? tagFieldController.text +
                                            ' is not a valid tag!' +
                                            ' 😥' +
                                            '\nAn Example: #123456'
                                        : null;

                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                      (tempErrorMessageA != null)
                                          ? 'Invalid Tag!'
                                          : 'Error!',
                                    ),
                                    content: Text(
                                      (tempErrorMessageA ??
                                          "You have not entered a Tag"),
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
                            }
                          } else {
                            var tempErrorMessageB = (passwordFieldController
                                        .text !=
                                    "")
                                ? passwordFieldController.text +
                                    ' is the wrong pin!' +
                                    ' 😥' +
                                    '\nNote to the reviewers of this app: the default pin is 0743'
                                : null;
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  (tempErrorMessageB != null)
                                      ? "Incorrect Pin!"
                                      : "Error!",
                                ),
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

                          tagFieldController.clear();
                          passwordFieldController.clear();
                          sleep(const Duration(milliseconds: 50));
                          //print(users[currentUser]['friends']);
                          setState(() {});
                          tagFieldController.clear();
                          passwordFieldController.clear();
                          print('objectd');
                        },
                      ),
                    ],
                    contentPadding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 7,
                      bottom: 7,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    content: Stack(
                      children: <Widget>[
                        Positioned(
                          right: 0.0,
                          child: GestureDetector(
                            onTap: () {
                              tagFieldController.clear();
                              passwordFieldController.clear();
                              Navigator.of(context).pop();
                            },
                            child: Align(
                              alignment: Alignment.topRight,
                              child: CircleAvatar(
                                radius: 14.0,
                                backgroundColor: Colors.white,
                                child: Icon(Icons.close, color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                width: double.maxFinite,
                                padding: EdgeInsets.all(7.0),
                                child: Center(
                                  child: Text(
                                    "Add a Friend:",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              //Expanded(
                              //child:
                              ListView(
                                shrinkWrap: true,
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
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
                                          child: Text("Friend\'s Tag:"),
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
                                          child: Text("Parent\'s Pin:"),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(1.0),
                                          child: TextField(
                                            controller: passwordFieldController,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              //),
                              /*Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: RaisedButton(
                                  child: Text("Add the Friend!"),
                                  onPressed: () {
                                    print(users.where((f) =>
                                            f['tag'] ==
                                            tagFieldController.text) ==
                                        null);
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
                                              'You can\'t add yourself as a friend.',
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
                                      } else {
                                        var exists = false;
                                        for (var k in users) {
                                          print(((users[currentUser]['friends']
                                                          as List<String>)
                                                      .where((f) =>
                                                          f ==
                                                          tagFieldController
                                                              .text)
                                                      .isNotEmpty)
                                                  .toString() +
                                              " hi");
                                          print((users[currentUser]['friends']
                                                  as List<String>)
                                              .where((f) =>
                                                  f ==
                                                  tagFieldController.text));
                                          if ((users[currentUser]['friends']
                                                  as List<String>)
                                              .where((f) =>
                                                  f == tagFieldController.text)
                                              .isNotEmpty) {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text('Error!'),
                                                content: Text(
                                                  'You already added ' +
                                                      k['name'] +
                                                      ' as a friend',
                                                ),
                                                actions: <Widget>[
                                                  FlatButton(
                                                    child: Text('Okay'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                            exists = true;
                                            break;
                                          }
                                          if (k['tag'] ==
                                              tagFieldController.text) {
                                            (users[currentUser]['friends']
                                                    as List<String>)
                                                .add(tagFieldController.text);
                                            (users[users.indexOf(k)]['friends']
                                                    as List<String>)
                                                .add(users[currentUser]['tag']);
                                            exists = true;
                                            Navigator.pop(context);
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text('Added Friend!'),
                                                content: Text(
                                                  (k['name'] as String) +
                                                      ' was added as a friend!' +
                                                      '😀',
                                                ),
                                                actions: <Widget>[
                                                  FlatButton(
                                                    child: Text('Okay'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                            break;
                                          }
                                        }
                                        if (exists == false) {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: Text('Invalid Tag!'),
                                              content: Text(
                                                tagFieldController.text +
                                                    ' is not a valid tag!' +
                                                    ' 😥' +
                                                    '\nAn Example: #123456',
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

                                    tagFieldController.clear();
                                    passwordFieldController.clear();
                                    sleep(const Duration(milliseconds: 50));
                                    //print(users[currentUser]['friends']);
                                    setState(() {});
                                    tagFieldController.clear();
                                    passwordFieldController.clear();
                                    print('objectd');
                                  },
                                ),
                              ),*/
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
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
          body: TabBarView(
            children: <Widget>[
              friendsContent,
              inboxContent,
              outboxContent,
            ],
          ),
        ),
      ),
    );
  }

  void _popNavigationWithResult(BuildContext context, dynamic result) {
    Navigator.pop(context, result);
  }
}
