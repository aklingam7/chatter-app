import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:io';

import '../main.dart';

class GuideCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: double.maxFinite,
        child: ListView(
          children: [
            Text(
              "Quick guide for the reviewers of my Application: ",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 5)),
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
    );
  }
}
