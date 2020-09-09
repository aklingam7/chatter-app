import 'dart:math';

import 'package:flutter/material.dart';

import 'routes/posts.dart';

void main() => runApp(MyApp());

List<String> _createUserTags(List<String> userNames) {
  var rng = new Random();
  List<String> lclUserTags = userNames.map((x) => "").toList();
  for (var i = 0; i < userNames.length; i++) {
    while (true) {
      lclUserTags[i] = "";
      lclUserTags[i] = lclUserTags[i] + '#';
      lclUserTags[i] = lclUserTags[i] + rng.nextInt(10).toString();
      lclUserTags[i] = lclUserTags[i] + rng.nextInt(10).toString();
      lclUserTags[i] = lclUserTags[i] + rng.nextInt(10).toString();
      lclUserTags[i] = lclUserTags[i] + rng.nextInt(10).toString();
      lclUserTags[i] = lclUserTags[i] + rng.nextInt(10).toString();
      lclUserTags[i] = lclUserTags[i] + rng.nextInt(10).toString();
      if (lclUserTags.indexOf(lclUserTags[i]) == i) {
        break;
      }
    }
  }
  return lclUserTags;
}

var userNames = ["Aditya L", "A Friend"];
var userTags = _createUserTags(userNames);

var currentUser = 0;

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
