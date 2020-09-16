import 'dart:core';

import 'package:flutter/material.dart';

import '../main.dart';
import './posts.dart';
import './friends.dart';

import '../widgets/nav_drawer.dart';
import '../widgets/info_card.dart';

class ParentalControls extends StatefulWidget {
  @override
  _ParentalControlsState createState() => _ParentalControlsState();
}

class _ParentalControlsState extends State<ParentalControls> {
  final pinFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parental Controls'),
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
      ),
      drawer: Drawer(
        child: NavDrawer(
          setState,
          2,
          postsSetState: Posts.sPostsSetState,
          postscontext: Posts.sPostsContext,
          friendscontext: Friends.sFriendsContext,
          pctrlcontext: context,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(7),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                //selected: true,
                title: Text('Pin:'),
                trailing: Container(
                  //alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Change'),
                              onPressed: () {
                                pin = pinFieldController.text;
                                setState(() {});
                                Navigator.of(context).pop();
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
                                          "Enter a new Pin:",
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
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(90, 227, 226, 219),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('Change Pin'),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                //selected: true,
                title: Text('Require Pin for creating a friend request:'),
                trailing: Container(
                  //alignment: Alignment.centerRight,
                  child: Switch(
                    value: pinRequired4Add,
                    onChanged: (bool newValue) {
                      pinRequired4Add = newValue;
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                //selected: true,
                title: Text('Require Pin for accepting a friend request:'),
                trailing: Container(
                  //alignment: Alignment.centerRight,
                  child: Switch(
                    value: pinRequired4Accept,
                    onChanged: (bool newValue) {
                      pinRequired4Accept = newValue;
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                //selected: true,
                title: Text(
                    'Enable searching for users instead of entering a tag:'),
                trailing: Container(
                  //alignment: Alignment.centerRight,
                  child: Switch(
                    value: searchAllowed,
                    onChanged: (bool newValue) {
                      searchAllowed = newValue;
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),

            /*
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Pin:'),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Change'),
                              onPressed: () {
                                pin = pinFieldController.text;
                                setState(() {});
                                Navigator.of(context).pop();
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
                                          "Enter a new Pin:",
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
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(90, 227, 226, 219),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('Change Pin'),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  alignment: Alignment.centerLeft,
                  child: Text('Require Pin for creating a friend request:'),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.centerRight,
                  child: Switch(
                    value: pinRequired4Add,
                    onChanged: (bool newValue) {
                      pinRequired4Add = newValue;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  alignment: Alignment.centerLeft,
                  child: Text('Require Pin for accepting a friend request:'),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.centerRight,
                  child: Switch(
                    value: pinRequired4Accept,
                    onChanged: (bool newValue) {
                      pinRequired4Accept = newValue;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Enable searching for users instead of entering a tag:'),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.centerRight,
                  child: Switch(
                    value: searchAllowed,
                    onChanged: (bool newValue) {
                      searchAllowed = newValue;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            */
          ],
        ),
      ),
    );
  }
}
