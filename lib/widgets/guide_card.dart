import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:io';

import '../main.dart';

class GuideCard extends StatelessWidget {
  final BuildContext mainContext;

  GuideCard(this.mainContext);

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
                //guideNotRead = false;
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
          Container(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(4),
                  child: Text(
                    "Quick guide for the \nreviewers of my Application:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                "Press on the switch button next to the profile picture in the Navigation Drawer to switch through the eight dummy accounts. \n\nTo add a friend to an account, note down the friend's tag, this can be found here:",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                              child: Image(
                                image: tagHelp.image,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                  "Then go to the Friends Menu of the account you want to add that friend to, and enter his tag. The Parent's password is preset to 0743. \n\nAfter a few friends have been set up, you can imagine yourself as the owner of one of the accounts. \n\nGo to the Posts Menu, create a post, and then go to one of your friend's accounts to check if it is visible in their Posts Menu. \n\nView more info about the Application by tapping on the Info icon on the Appbar."),
                            ),
                          ],
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
  }
}
