import 'package:flutter/material.dart';
import 'package:android_dev_app/screens/professional/download_manager.dart';
import 'package:android_dev_app/screens/professional/flashlight.dart';
import 'package:android_dev_app/screens/professional/qr_code_scanner.dart';
import 'package:android_dev_app/screens/professional/speech_to_text.dart';
import 'package:android_dev_app/screens/professional/text_to_speech.dart';
import 'package:android_dev_app/screens/professional/bitcoin_price_index.dart';
import 'package:android_dev_app/screens/professional/firebase_auth.dart';
import 'package:android_dev_app/screens/professional/youtube_player.dart';

class ProfessionalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Professional Level'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Android Download Manager'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DownloadManager()),
              );
            },
          ),
          ListTile(
            title: Text('Flashlight Torch Application'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Flashlight()),
              );
            },
          ),
          ListTile(
            title: Text('QR Code Scanner Application'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QrCodeScanner()),
              );
            },
          ),
          ListTile(
            title: Text('Convert Speech to Text'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SpeechToText()),
              );
            },
          ),
          ListTile(
            title: Text('Convert Text to Speech'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TextToSpeech()),
              );
            },
          ),
          ListTile(
            title: Text('Bitcoin Price Index Application'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BitcoinPriceIndex()),
              );
            },
          ),
          ListTile(
            title: Text('Firebase User Authentication App'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FirebaseAuthScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Youtube Player Application'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YoutubePlayerScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
