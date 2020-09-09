import 'dart:math';

import 'package:flutter/material.dart';

import 'routes/posts.dart';

void main() => runApp(MyApp());

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
  {'name': "Aditya L", 'tag': "", 'friends': []},
  {'name': "A Friend", 'tag': "", 'friends': []},
];

var users = _addTags(usersWithoutTags);

var currentUser = 0;

var avatar1 = Image.asset('images/Avatar/Avatar1.jpg');
var avatar2 = Image.asset('images/Avatar/Avatar2.jpg');

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
