import 'package:flutter/material.dart';
import 'package:android_dev_app/screens/beginner/ui_widgets.dart';
import 'package:android_dev_app/screens/beginner/menu.dart';
import 'package:android_dev_app/screens/beginner/intent_screen.dart';
import 'package:android_dev_app/screens/beginner/fragments.dart';

class BeginnerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beginner Level'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('UI Widgets'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UiWidgets()),
              );
            },
          ),
          ListTile(
            title: Text('Menu'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Menu()),
              );
            },
          ),
          ListTile(
            title: Text('Intent'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IntentScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Fragments'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Fragments()),
              );
            },
          ),
        ],
      ),
    );
  }
}
