import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqlite extends StatefulWidget {
  @override
  _SqliteState createState() => _SqliteState();
}

class _SqliteState extends State<Sqlite> {
  late Database _database;
  List<Map<String, dynamic>> _dogs = [];

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'doggie_database.db');

    _database = await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
      version: 1,
    );

    _refreshDogs();
  }

  Future<void> _insertDog() async {
    final dog = Dog(
      id: 0,
      name: 'Fido',
      age: 35,
    );

    await _database.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _refreshDogs();
  }

  Future<void> _refreshDogs() async {
    final List<Map<String, dynamic>> maps = await _database.query('dogs');
    setState(() {
      _dogs = maps;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Using SQLite in Flutter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'The sqflite package is the Flutter plugin for SQLite, a self-contained, high-reliability, embedded, SQL database engine.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _insertDog,
              child: Text('Insert a Dog'),
            ),
            SizedBox(height: 16),
            Text(
              'Dogs in Database:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _dogs.length,
              itemBuilder: (context, index) {
                final dog = _dogs[index];
                return ListTile(
                  title: Text('Name: ${dog['name']}'),
                  subtitle: Text('Age: ${dog['age']}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Dog {
  final int id;
  final String name;
  final int age;

  Dog({
    required this.id,
    required this.name,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}
