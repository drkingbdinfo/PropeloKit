import 'package:flutter/material.dart';

class IntroductionToAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Introduction to Android'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Introduction to Android',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. Android is developed by a consortium of developers known as the Open Handset Alliance and commercially sponsored by Google.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Key Features of Android:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Open Source: The source code for Android is available for free, which allows for a large community of developers to contribute to its development.'),
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Large App Ecosystem: The Google Play Store features millions of apps, offering a wide range of functionality to users.'),
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Customizable User Interface: Android allows manufacturers and users to customize the user interface, providing a more personalized experience.'),
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Support for Multiple Languages: Android supports a wide variety of languages, making it accessible to users worldwide.'),
            ),
          ],
        ),
      ),
    );
  }
}
