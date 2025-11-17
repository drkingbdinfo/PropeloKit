import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:android_dev_app/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MainApp());

    // Verify that our home screen is displayed.
    expect(find.text('Android Dev Learning App'), findsOneWidget);
  });
}
