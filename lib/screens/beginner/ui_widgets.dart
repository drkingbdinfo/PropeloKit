import 'package:flutter/material.dart';

class UiWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI Widgets'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Common UI Widgets',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildWidgetExample(
              'Text',
              'A widget that displays a short string of text.',
              '''
Text(
  'Hello, World!',
  style: TextStyle(fontSize: 24),
)
              ''',
            ),
            _buildWidgetExample(
              'TextField',
              'A text input field.',
              '''
TextField(
  decoration: InputDecoration(
    labelText: 'Enter your name',
    border: OutlineInputBorder(),
  ),
)
              ''',
            ),
            _buildWidgetExample(
              'Button',
              'A material design button.',
              '''
ElevatedButton(
  onPressed: () {},
  child: Text('Click Me'),
)
              ''',
            ),
            _buildWidgetExample(
              'Image',
              'A widget that displays an image.',
              '''
Image.network(
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
)
              ''',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetExample(
      String title, String description, String code) {
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
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 16),
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
