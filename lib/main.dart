import 'dart:math';
import 'dart:io';

import 'package:chatter/widgets/guide_card.dart';
import 'package:flutter/material.dart';

import 'package:splashscreen/splashscreen.dart';

import 'routes/posts.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MySplashscreen(),
  ));
}
//void main() => runApp(MySplashscreen());
//void main() => runApp(MyApp());

const IconData posts_icon = IconData(58336, fontFamily: 'MaterialIcons');
const IconData friends_icon = IconData(59375, fontFamily: 'MaterialIcons');
//const IconData pctrl_icon = IconData(60225, fontFamily: 'MaterialIcons');
const IconData pctrl_icon = IconData(59545, fontFamily: 'MaterialIcons');
const IconData info_icon = IconData(59534, fontFamily: 'MaterialIcons');
const IconData camera_icon = IconData(58288, fontFamily: 'MaterialIcons');
const IconData gallery_icon = IconData(57937, fontFamily: 'MaterialIcons');
const IconData close_icon = IconData(58825, fontFamily: 'MaterialIcons');
const IconData swap_icon = IconData(59604, fontFamily: 'MaterialIcons');

var logo = Image.asset('images/Logo.png');
var tagHelp = Image.asset('images/TagHelp.png');

List<Map<String, Object>> _addTags(List<Map<String, Object>> usersWithoutTags) {
  var rng = new Random();
  var users = usersWithoutTags;
  bool repeat;
  for (var i = 0; i < users.length; i++) {
    repeat = true;
    while (repeat) {
      users[i]['tag'] = (users[i]['tag'] as String) + '#';
      users[i]['tag'] =
          (users[i]['tag'] as String) + rng.nextInt(10).toString();
      users[i]['tag'] =
          (users[i]['tag'] as String) + rng.nextInt(10).toString();
      users[i]['tag'] =
          (users[i]['tag'] as String) + rng.nextInt(10).toString();
      users[i]['tag'] =
          (users[i]['tag'] as String) + rng.nextInt(10).toString();
      users[i]['tag'] =
          (users[i]['tag'] as String) + rng.nextInt(10).toString();
      users[i]['tag'] =
          (users[i]['tag'] as String) + rng.nextInt(10).toString();
      for (var j in users) {
        if (i != users.indexOf(j)) {
          if (j['tag'] == users[i]['tag']) {
            users[i]['tag'] = "";
            break;
          }
        } else {
          repeat = false;
        }
      }
    }
  }
  return users;
}

var usersWithoutTags = [
  {
    'name': "Aditya L",
    'tag': "",
    'image': Image.asset('images/Avatar/Avatar1.jpg'),
    'friends': <String>[],
    'friends-inbox': <String>[],
    'friends-outbox': <String>[],
    'posts': <Map>[]
  },
  {
    'name': "A Friend",
    'tag': "",
    'image': Image.asset('images/Avatar/Avatar2.jpg'),
    'friends': <String>[],
    'friends-inbox': <String>[],
    'friends-outbox': <String>[],
    'posts': <Map>[]
  },
  {
    'name': "Nice Guy",
    'tag': "",
    'image': Image.asset('images/Avatar/Avatar3.jpg'),
    'friends': <String>[],
    'friends-inbox': <String>[],
    'friends-outbox': <String>[],
    'posts': <Map>[]
  },
  {
    'name': "Hello World",
    'tag': "",
    'image': Image.asset('images/Avatar/Avatar4.jpg'),
    'friends': <String>[],
    'friends-inbox': <String>[],
    'friends-outbox': <String>[],
    'posts': <Map>[]
  },
  {
    'name': "Another Friend",
    'tag': "",
    'image': Image.asset('images/Avatar/Avatar5.jpg'),
    'friends': <String>[],
    'friends-inbox': <String>[],
    'friends-outbox': <String>[],
    'posts': <Map>[]
  },
  {
    'name': " A Good Boy",
    'tag': "",
    'image': Image.asset('images/Avatar/Avatar6.jpg'),
    'friends': <String>[],
    'friends-inbox': <String>[],
    'friends-outbox': <String>[],
    'posts': <Map>[]
  },
  {
    'name': "An Unnamed Person",
    'tag': "",
    'image': Image.asset('images/Avatar/Avatar7.jpg'),
    'friends': <String>[],
    'friends-inbox': <String>[],
    'friends-outbox': <String>[],
    'posts': <Map>[]
  },
  {
    'name': "Bob the Builder",
    'tag': "",
    'image': Image.asset('images/Avatar/Avatar8.jpg'),
    'friends': <String>[],
    'friends-inbox': <String>[],
    'friends-outbox': <String>[],
    'posts': <Map>[]
  },
];

var users = _addTags(usersWithoutTags);

var currentUser = 0;

var pin = '0743';
var pinRequired4Add = true;
var pinRequired4Del = true;
var pinRequired4Accept = true;
var searchAllowed = false;

//var guideNotRead = true;

final createPinFieldController = TextEditingController();

//var avatar1 = Image.asset('images/Avatar/Avatar1.jpg');
//var avatar2 = Image.asset('images/Avatar/Avatar2.jpg');

class MySplashscreen extends StatefulWidget {
  @override
  _MySplashscreenState createState() => new _MySplashscreenState();
}

class _MySplashscreenState extends State<MySplashscreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new MyApp(),
        title: new Text(
          'Chatter',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
        image: logo,
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 65.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.blue);
  }
}

class MyApp extends StatelessWidget {
  bool firstBuild = true;

  _showOpenDialog(dcontext) {
    showDialog(
      barrierDismissible: false,
      context: dcontext,
      builder: (context) => AlertDialog(
        actions: <Widget>[
          FlatButton(
            child: Text('Set'),
            onPressed: () {
              pin = createPinFieldController.text;
              Navigator.of(context).pop();
            },
          ),
        ],
        content: Stack(
          children: <Widget>[
            /*Positioned(
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  createPinFieldController.clear();
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
            ),*/
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(7.0),
                    child: Text(
                      "Please Set a Pin:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextField(
                    controller: createPinFieldController,
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
    showDialog(
      barrierDismissible: false,
      context: dcontext,
      builder: (BuildContext econtext) {
        return GuideCard(econtext);
      },
    );
    print('objectsyf');

    //sleep(const Duration(milliseconds: 950));
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (firstBuild) {
        firstBuild = false;
        _showOpenDialog(context);
      }
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Posts(),
    );
  }
}
