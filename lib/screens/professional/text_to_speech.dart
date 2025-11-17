import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech extends StatefulWidget {
  @override
  _TextToSpeechState createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  FlutterTts flutterTts = FlutterTts();
  TextEditingController _controller = TextEditingController();

  Future<void> _speak() async {
    await flutterTts.speak(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Convert Text to Speech'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Text to Speech',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter text to speak',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _speak,
              child: Text('Speak'),
            ),
          ],
        ),
      ),
    );
  }
}
