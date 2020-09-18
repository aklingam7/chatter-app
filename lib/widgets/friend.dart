import 'package:flutter/material.dart';

import '../main.dart';

class Friend extends StatelessWidget {
  final String userTag;
  final int mode;
  final Function setState;
  final pinFieldController1 = TextEditingController();
  final pinFieldController2 = TextEditingController();

  Friend({this.userTag, this.mode, this.setState});

  int _userIndex() {
    var tag = userTag;
    var done = false;
    for (var m in users) {
      if (m['tag'] == tag) {
        done = true;
        return users.indexOf(m);
      }
    }
    if (done == false) {
      return null;
    }
  }

  String _tag2Name() {
    var tag = userTag;
    var done = false;
    for (var m in users) {
      if (m['tag'] == tag) {
        done = true;
        return m['name'];
      }
    }
    if (done == false) {
      return "error";
    }
  }

  Image _tag2Img() {
    var tag = userTag;
    var done = false;
    for (var m in users) {
      if (m['tag'] == tag) {
        done = true;
        return m['image'];
      }
    }
    if (done == false) {
      return null;
    }
  }

  List<Widget> _content(BuildContext context) {
    List<Widget> _tempList = [
      CircleAvatar(
        backgroundImage: _tag2Img().image,
        radius: 35.0,
      ),
      Padding(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _tag2Name(),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              userTag,
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
    ];

    _tempList.add(
      (mode == 0)
          ? Padding(
              padding: EdgeInsets.all(5),
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => AlertDialog(
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Enter'),
                          onPressed: () async {
                            var tempPin = pinFieldController1.text;
                            if (tempPin == pin) {
                              (users[_userIndex()]['friends'] as List<String>)
                                  .removeAt(
                                (users[_userIndex()]['friends'] as List<String>)
                                    .indexOf(
                                  users[currentUser]['tag'],
                                ),
                              );
                              (users[currentUser]['friends'] as List<String>)
                                  .removeAt(
                                (users[currentUser]['friends'] as List<String>)
                                    .indexOf(userTag),
                              );

                              setState(() {});
                            } else {
                              var tempErrorMessageB = (pinFieldController1
                                          .text !=
                                      "")
                                  ? pinFieldController1.text +
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
                                pinFieldController1.clear();
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
                                  controller: pinFieldController1,
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
                child: Icon(Icons.clear),
              ),
            )
          : (mode == 1)
              ? Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => AlertDialog(
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Enter'),
                                  onPressed: () async {
                                    var tempPin = pinFieldController2.text;
                                    if (tempPin == pin) {
                                      (users[currentUser]['friends']
                                              as List<String>)
                                          .add(userTag);
                                      (users[_userIndex()]['friends']
                                              as List<String>)
                                          .add(users[currentUser]['tag']);

                                      (users[_userIndex()]['friends-outbox']
                                              as List<String>)
                                          .removeAt((users[_userIndex()]
                                                      ['friends-outbox']
                                                  as List<String>)
                                              .indexOf(
                                                  users[currentUser]['tag']));
                                      (users[currentUser]['friends-inbox']
                                              as List<String>)
                                          .removeAt(
                                        (users[currentUser]['friends-inbox']
                                                as List<String>)
                                            .indexOf(userTag),
                                      );
                                      setState(() {});
                                      print(54);

                                      Navigator.of(context).pop();
                                    } else {
                                      var tempErrorMessageB = (pinFieldController2
                                                  .text !=
                                              "")
                                          ? pinFieldController2.text +
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
                                        pinFieldController2.clear();
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
                                          controller: pinFieldController2,
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
                        child: Icon(Icons.check),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 7),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          (users[_userIndex()]['friends-outbox']
                                  as List<String>)
                              .removeAt((users[_userIndex()]['friends-outbox']
                                      as List<String>)
                                  .indexOf(users[currentUser]['tag']));
                          (users[currentUser]['friends-inbox'] as List<String>)
                              .removeAt(
                            (users[currentUser]['friends-inbox']
                                    as List<String>)
                                .indexOf(userTag),
                          );
                          setState(() {});
                        },
                        child: Icon(Icons.clear),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(5),
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
                    child: Text('Request Sent'),
                  ),
                ),
    );

    return _tempList;
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
        child: Row(
          children: _content(context),
        ),
      ),
    );
  }
}
