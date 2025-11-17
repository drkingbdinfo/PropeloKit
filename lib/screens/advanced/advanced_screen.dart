import 'package:flutter/material.dart';
import 'package:android_dev_app/screens/advanced/advance_ui.dart';
import 'package:android_dev_app/screens/advanced/material_design.dart';
import 'package:android_dev_app/screens/advanced/sqlite.dart';

class AdvancedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Level'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Advance UI'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdvanceUi()),
              );
            },
          ),
          ListTile(
            title: Text('Material Design'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MaterialDesign()),
              );
            },
          ),
          ListTile(
            title: Text('SQLite'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Sqlite()),
              );
            },
          ),
        ],
      ),
    );
  }
}
