import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:io';
import 'package:flutter/gestures.dart';

import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

class InfoCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: double.maxFinite,
        child: ListView(
          children: [
            Text(
              "Introduction: ",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Hi, Welcome to my app. It has all the core features of a social media app. you can add friends. And you create posts which your friends can see. It's separated from modern social media platforms in 3 ways. It has security features that require a password to be entered before adding friends, it's stripped down to not include the addictive features like followers, and it's extremely easy to use.",
              style: TextStyle(
                fontSize: 14,
                //fontWeight: FontWeight.bold,
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            Text(
              "Prototype vs Actual product: ",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "This application is completely production-ready except for one area: it is not connected to a server. This was done deliberately because this is meant to be a prototype to showcase and not a final app. However, Local user accounts do exist. I have created eight dummy user accounts that you can switch through by tapping on the swap button in the drawer. Also, the user accounts are all stored in a List<Map>, and the application is made using Google's Flutter. This makes it extremely easy to add network connectivity later through Firebase.",
              style: TextStyle(
                fontSize: 14,
                //fontWeight: FontWeight.bold,
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            Text(
              "How do I plan on developing this in the future: ",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        "I plan on taking this forward by adding features like IM and more developed Parental Controls. Because my application is made using Google's Flutter, I can generate a native IOS Application, which I also plan on publishing. You can view the source code and new releases on my ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "GitHub Repository",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launch('https://github.com/aklingam7/chatter-app');
                      },
                  ),
                  TextSpan(
                    text: ".",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
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
}
