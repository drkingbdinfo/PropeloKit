import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DownloadManager extends StatefulWidget {
  @override
  _DownloadManagerState createState() => _DownloadManagerState();
}

class _DownloadManagerState extends State<DownloadManager> {
  String? _localPath;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _prepare();
  }

  Future<void> _prepare() async {
    final enabled = await _checkPermission();
    if (enabled) {
      await _prepareSaveDir();
    }
  }

  Future<bool> _checkPermission() async {
    // Note: The flutter_downloader plugin handles permissions automatically.
    // This is just a placeholder for any additional permission checks you might need.
    return true;
  }

  Future<void> _prepareSaveDir() async {
    _localPath = (await _findLocalPath())!;
    final savedDir = Directory(_localPath!);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  Future<String?> _findLocalPath() async {
    if (Platform.isAndroid) {
      return "/sdcard/download/";
    } else {
      var directory = await getApplicationDocumentsDirectory();
      return directory.path + Platform.pathSeparator + 'Download';
    }
  }

  void _downloadFile() async {
    setState(() {
      _isLoading = true;
    });

    final taskId = await FlutterDownloader.enqueue(
      url: 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
      savedDir: _localPath!,
      showNotification: true,
      openFileFromNotification: true,
    );

    FlutterDownloader.registerCallback((id, status, progress) {
      if (id == taskId && status == DownloadTaskStatus.complete) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Android Download Manager'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Using the Flutter Downloader',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'The flutter_downloader package provides a simple way to create and manage download tasks. It runs in the background and shows notifications to the user.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _downloadFile,
                    child: Text('Download a File'),
                  ),
            SizedBox(height: 16),
            _buildCodeExample(
              'Initializing the downloader and starting a download',
              '''
// Add flutter_downloader and path_provider to your pubspec.yaml

// ... in your main.dart
await FlutterDownloader.initialize(
  debug: true // optional: set false to disable printing logs to console
);

// ... in your widget
final taskId = await FlutterDownloader.enqueue(
  url: 'your-download-url',
  savedDir: 'your-save-directory',
  showNotification: true,
  openFileFromNotification: true,
);
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
