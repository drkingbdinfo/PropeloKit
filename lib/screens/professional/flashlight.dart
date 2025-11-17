import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

class Flashlight extends StatefulWidget {
  @override
  _FlashlightState createState() => _FlashlightState();
}

class _FlashlightState extends State<Flashlight> {
  bool _isTorchOn = false;

  Future<void> _toggleTorch() async {
    try {
      if (_isTorchOn) {
        await TorchLight.disableTorch();
      } else {
        await TorchLight.enableTorch();
      }
      setState(() {
        _isTorchOn = !_isTorchOn;
      });
    } on Exception catch (_) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashlight Torch Application'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Using the Torch Light',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'The torch_light package provides a simple way to control the device\'s flashlight.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _toggleTorch,
              child: Text(_isTorchOn ? 'Turn Off' : 'Turn On'),
            ),
            SizedBox(height: 16),
            _buildCodeExample(
              'Toggling the torch',
              '''
// Add torch_light to your pubspec.yaml

// ... in your widget
bool _isTorchOn = false;

Future<void> _toggleTorch() async {
  try {
    if (_isTorchOn) {
      await TorchLight.disableTorch();
    } else {
      await TorchLight.enableTorch();
    }
    setState(() {
      _isTorchOn = !_isTorchOn;
    });
  } on Exception catch (_) {
    // Handle error
  }
}
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
