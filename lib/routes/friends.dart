import 'package:flutter/material.dart';

class Friends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
          _popNavigationWithResult(context, 'from_back');
          return false;
        },
      child: Scaffold(
        appBar: AppBar(title: Text('Friends')),
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
                  Navigator.pop(context);
                  _popNavigationWithResult(context, 'from_button');
                },
              ),
              ListTile(
                title: Text('Friends'),
                onTap: () {
                  // Update the state of the app.
                  // ...

                  Navigator.pop(context);
                },
              ),
            ],
          ),

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
        ),
        body: Container(
          child: Center(
            child: Text('Page 2',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  void _popNavigationWithResult(BuildContext context, dynamic result) {
    Navigator.pop(context, result);
  }
}
