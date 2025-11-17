import 'package:flutter/material.dart';
import 'package:android_dev_app/screens/basics/basics_screen.dart';
import 'package:android_dev_app/screens/beginner/beginner_screen.dart';
import 'package:android_dev_app/screens/advanced/advanced_screen.dart';
import 'package:android_dev_app/screens/professional/professional_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Android Dev Learning App'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('The Basics'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BasicsScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Beginner Level'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BeginnerScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Advanced Level'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdvancedScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Professional Level'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfessionalScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
