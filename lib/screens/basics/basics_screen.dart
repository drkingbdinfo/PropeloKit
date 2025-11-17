import 'package:flutter/material.dart';
import 'package:android_dev_app/screens/basics/introduction_to_android.dart';
import 'package:android_dev_app/screens/basics/architecture_and_software_stack.dart';

class BasicsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Basics'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Introduction To Android'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IntroductionToAndroid()),
              );
            },
          ),
          ListTile(
            title: Text('Architecture & Software Stack'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ArchitectureAndSoftwareStack()),
              );
            },
          ),
        ],
      ),
    );
  }
}
