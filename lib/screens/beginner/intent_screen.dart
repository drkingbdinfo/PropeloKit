import 'package:flutter/material.dart';

class IntentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation and "Intents"'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Navigation in Flutter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'In Android development, you use Intents to navigate between activities. In Flutter, navigation is handled by a Navigator widget, which manages a stack of Route objects. The most common way to navigate to a new screen is by using MaterialPageRoute.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            _buildCodeExample(
              'Navigating to a new screen',
              '''
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondScreen()),
);
              ''',
            ),
            _buildCodeExample(
              'Returning to the previous screen',
              '''
Navigator.pop(context);
              ''',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeExample(String title, String code) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.grey[200],
              child: Text(
                code.trim(),
                style: TextStyle(fontFamily: 'monospace'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
