import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:io';
import 'package:flutter/gestures.dart';

import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

class InfoCard extends StatelessWidget {
  final BuildContext routeContext;

  InfoCard(this.routeContext);

  Widget build(BuildContext context) {
    return AlertDialog(
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
                Navigator.of(routeContext).pop();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(4),
                  child: Text(
                    "App Info: ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "Introduction: ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "Hi, Welcome to my app. It contains the core features of a social media app. You can add friends and create posts which your friends can see. It's separated from modern social media platforms in 3 ways. It has security features that require a password to be entered before adding friends, it's stripped down to not include the addictive features like followers, and it's extremely easy to use.",
                          style: TextStyle(

                              //fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 15)),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "Prototype vs Actual product: ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "This application is completely production-ready except for one area: it is not connected to a server. This was done deliberately because this is meant to be a prototype to showcase and not a final app. However, Local user accounts do exist. I have created eight dummy user accounts that you can switch through by tapping on the swap button in the drawer. Also, the user accounts are all stored in a List<Map>, and the application is made using Google's Flutter. This makes it extremely easy to add network connectivity later through Firebase.",
                          style: TextStyle(

                              //fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 15)),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "How do I plan on developing this in the future: ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: RichText(
                          //textScaleFactor: 1,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    "I plan on taking this forward by adding features like IM and more developed Parental Controls. Because my application is made using Google's Flutter, I can generate a native IOS Application, which I also plan on publishing. You can view the source code and new releases on my ",
                              ),
                              TextSpan(
                                text: "GitHub Repository",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launch(
                                        'https://github.com/aklingam7/chatter-app');
                                  },
                              ),
                              TextSpan(
                                text: ".",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          /*Positioned(
            right: 0.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(mainContext).pop();
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
          Column(
            children: <Widget>[
              /*Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(3.0),
                child: Text(
                  "Quick guide for the \nreviewers of my Application:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),*/
              Expanded(
                flex: 7,
                child: Container(
                  child: SingleChildScrollView(
                    child: Container(
                      //height: double.maxFinite,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              top: 18.0,
                              bottom: 1.0,
                            ),
                            child: Text(
                                "Press on the switch button next to the profile picture in the Navigation Drawer to switch through the eight dummy accounts. \n\nTo add a friend to an account, note down the friend's tag, this can be found here:"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Image(
                              image: tagHelp.image,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Text(
                                "Then go to the Friends Menu of the account you want to add that friend to, and enter his tag. The Parent's password is preset to 0743. \n\nAfter a few friends have been set up, you can imagine yourself as the owner of one of the accounts. \n\nGo to the Posts Menu, create a post, and then go to one of your friend's accounts to check if it is visible in their Posts Menu. \n\nView more info about the Application by tapping on the Info icon on the Appbar."),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),*/
        ],
      ),
      /*
      content: Stack(
        children: <Widget>[
          Positioned(
            right: 0.0,
            child: Container(
              child: GestureDetector(
                //behavior: HitTestBehavior.translucent,
                onTap: () {
                  print('objectsd');
                  Navigator.of(mainContext).pop();
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
          ),
          Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Text(
                    "Quick guide for the reviewers of my Application: ",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 5)),
                Container(
                  width: double.maxFinite,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Press on the switch button next to the profile picture in the Navigation Drawer to switch through the eight dummy accounts. \n\nTo add a friend to an account, note down the friend's tag, this can be found here:",
                          style: TextStyle(
                            fontSize: 14,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 3)),
                        Image(
                          image: tagHelp.image,
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Text(
                          "Then go to the Friends Menu of the account you want to add that friend to, and enter his tag. The Parent's password is preset to 0743. \n\nAfter a few friends have been set up, you can imagine yourself as the owner of one of the accounts. \n\nGo to the Posts Menu, create a post, and then go to one of your friend's accounts to check if it is visible in their Posts Menu. \n\nView more info about the Application by tapping on the Info icon on the Appbar.",
                          style: TextStyle(
                            fontSize: 14,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),

                        //Padding(padding: EdgeInsets.only(bottom: 15)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      */
    );
    /*
    AlertDialog(
      content: Container(
        width: double.maxFinite,
        child: Stack(
          children: <Widget>[
            Positioned(
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(routeContext).pop();
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
            ListView(
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
          ],
        ),
      ),
    );
    */
  }
}
