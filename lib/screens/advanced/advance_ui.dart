import 'package:flutter/material.dart';
import 'dart:math';

class AdvanceUi extends StatefulWidget {
  @override
  _AdvanceUiState createState() => _AdvanceUiState();
}

class _AdvanceUiState extends State<AdvanceUi>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced UI'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Custom Painting and Animations',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildSectionTitle('Custom Painting with CustomPaint'),
            Text(
              'The CustomPaint widget provides a canvas on which to draw during the paint phase. This is useful for creating custom graphics and visual effects.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Container(
              height: 200,
              width: double.infinity,
              child: CustomPaint(
                painter: MyPainter(),
              ),
            ),
            SizedBox(height: 16),
            _buildCodeExample(
              'MyPainter',
              '''
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5;

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      50,
      paint..color = Colors.red,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
              ''',
            ),
            SizedBox(height: 32),
            _buildSectionTitle('Animations'),
            Text(
              'Flutter\'s animation system is powerful and flexible. You can create simple animations with Tween animations or more complex ones with the AnimationController.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _animation.value * 2 * pi,
                  child: FlutterLogo(size: 100),
                );
              },
            ),
            SizedBox(height: 16),
            _buildCodeExample(
              'Rotation Animation',
              '''
AnimationController _controller;
Animation<double> _animation;

@override
void initState() {
  super.initState();
  _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 2),
  )..repeat(reverse: true);
  _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
}

// ... in the build method

AnimatedBuilder(
  animation: _animation,
  builder: (context, child) {
    return Transform.rotate(
      angle: _animation.value * 2 * pi,
      child: FlutterLogo(size: 100),
    );
  },
),
              ''',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5;

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      50,
      paint..color = Colors.red,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
