import 'package:flutter/material.dart';

class Fragments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modular UI with Widgets'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Building with Widgets',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'In Android, you might use Fragments to create modular UI components. In Flutter, the equivalent is to create reusable widgets. You can compose complex UIs by combining smaller, single-purpose widgets.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            _buildCodeExample(
              'Creating a reusable widget',
              '''
class MyListItem extends StatelessWidget {
  final String title;
  final String subtitle;

  MyListItem({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
              ''',
            ),
            _buildCodeExample(
              'Using the reusable widget',
              '''
ListView(
  children: <Widget>[
    MyListItem(title: 'Item 1', subtitle: 'Subtitle 1'),
    MyListItem(title: 'Item 2', subtitle: 'Subtitle 2'),
    MyListItem(title: 'Item 3', subtitle: 'Subtitle 3'),
  ],
)
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
