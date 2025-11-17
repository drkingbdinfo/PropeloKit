import 'package:flutter/material.dart';

class MaterialDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material Design'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Material Design Components',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildWidgetExample(
              'Card',
              'A Material Design card: a panel with slightly rounded corners and a shadow.',
              '''
Card(
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      const ListTile(
        leading: Icon(Icons.album),
        title: Text('The Enchanted Nightingale'),
        subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
      ),
    ],
  ),
)
              ''',
            ),
            _buildWidgetExample(
              'FloatingActionButton',
              'A floating action button is a circular icon button that hovers over content to promote a primary, or most common, action in an application.',
              '''
FloatingActionButton(
  onPressed: () {
    // Add your onPressed code here!
  },
  child: const Icon(Icons.add),
  backgroundColor: Colors.green,
)
              ''',
            ),
            _buildWidgetExample(
              'SnackBar',
              'A lightweight message with an optional action which briefly displays at the bottom of the screen.',
              '''
ElevatedButton(
  onPressed: () {
    final snackBar = SnackBar(
      content: const Text('Yay! A SnackBar!'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  },
  child: const Text('Show SnackBar'),
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
