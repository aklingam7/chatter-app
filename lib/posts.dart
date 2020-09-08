import 'package:flutter/material.dart';
import './friends.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(title: Text('Posts')),
            drawer: Drawer(

            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Chatter'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: Text('Posts'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Friends'),
                  onTap: () async {
                    var navigationResult = await Navigator.push(
                        context, new MaterialPageRoute(builder: (context) => Page2()));

                    if (navigationResult == 'from_back') {
                      Navigator.pop(context);
                    } else if (navigationResult == 'from_button') {
                      Navigator.pop(context);
                      //showDialog(
                          //context: context,
                          //builder: (context) => AlertDialog(
                            //title: Text('Navigation from button'),
                          //));
                    }
                  },
                ),
              ],
            ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

        },
      ),
      body: Container(
        child: Center(
          child: Text(
            'Page 1',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
