import 'dart:math';

import 'package:flutter/material.dart';

import 'routes/posts.dart';

void main() => runApp(MyApp());

const IconData posts_icon = IconData(58336, fontFamily: 'MaterialIcons');
const IconData friends_icon = IconData(59375, fontFamily: 'MaterialIcons');
const IconData info_icon = IconData(59534, fontFamily: 'MaterialIcons');

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
    'posts': <Map>[]
  },
  {
    'name': "A Friend",
    'tag': "",
    'image': Image.asset('images/Avatar/Avatar2.jpg'),
    'friends': <String>[],
    'posts': <Map>[]
  },
  {
    'name': "Nice Guy",
    'tag': "",
    'image': Image.asset('images/Avatar/Avatar3.jpg'),
    'friends': <String>[],
    'posts': <Map>[]
  },
  {
    'name': "Hello World",
    'tag': "",
    'image': Image.asset('images/Avatar/Avatar4.jpg'),
    'friends': <String>[],
    'posts': <Map>[]
  },
  {
    'name': "Another Friend",
    'tag': "",
    'image': Image.asset('images/Avatar/Avatar5.jpg'),
    'friends': <String>[],
    'posts': <Map>[]
  },
  {
    'name': " A Good Boy",
    'tag': "",
    'image': Image.asset('images/Avatar/Avatar6.jpg'),
    'friends': <String>[],
    'posts': <Map>[]
  },
  {
    'name': "An Unnamed Person",
    'tag': "",
    'image': Image.asset('images/Avatar/Avatar7.jpg'),
    'friends': <String>[],
    'posts': <Map>[]
  },
  {
    'name': "Bob the Builder",
    'tag': "",
    'image': Image.asset('images/Avatar/Avatar8.jpg'),
    'friends': <String>[],
    'posts': <Map>[]
  },
];

var users = _addTags(usersWithoutTags);

var currentUser = 0;

//var avatar1 = Image.asset('images/Avatar/Avatar1.jpg');
//var avatar2 = Image.asset('images/Avatar/Avatar2.jpg');

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Posts(),
    );
  }
}
