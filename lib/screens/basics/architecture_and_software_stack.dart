import 'package:flutter/material.dart';

class ArchitectureAndSoftwareStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Architecture & Software Stack'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Android Architecture',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'The Android architecture is a software stack of components to support mobile device needs. The Android software stack can be broadly categorized into the following layers:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            _buildArchitectureLayer(
              'The Linux Kernel',
              'The foundation of the Android platform is the Linux kernel. For example, the Android Runtime (ART) relies on the Linux kernel for underlying functionalities such as threading and low-level memory management.',
            ),
            _buildArchitectureLayer(
              'Hardware Abstraction Layer (HAL)',
              'The HAL provides standard interfaces that expose device hardware capabilities to the higher-level Java API framework. The HAL consists of multiple library modules, each of which implements an interface for a specific type of hardware component, such as the camera or Bluetooth module.',
            ),
            _buildArchitectureLayer(
              'Android Runtime',
              'For devices running Android version 5.0 (API level 21) or higher, each app runs in its own process and with its own instance of the Android Runtime (ART). ART is written to run multiple virtual machines on low-memory devices by executing DEX files, a bytecode format specially designed for Android that\'s optimized for minimal memory footprint.',
            ),
            _buildArchitectureLayer(
              'Native C/C++ Libraries',
              'Many core Android system components and services, such as ART and HAL, are built from native code that require native libraries written in C and C++. The Android platform provides Java framework APIs to expose the functionality of some of these native libraries to apps.',
            ),
            _buildArchitectureLayer(
              'Java API Framework',
              'The entire feature-set of the Android OS is available to you through APIs written in the Java language. These APIs form the building blocks you need to create Android apps by simplifying the reuse of core, modular system components and services.',
            ),
            _buildArchitectureLayer(
              'System Apps',
              'Android comes with a set of core apps for email, SMS messaging, calendars, internet browsing, contacts, and more. Apps included with the platform have no special status among the apps the user chooses to install. So a third-party app can become the user\'s default web browser, SMS messenger, or even the default keyboard.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArchitectureLayer(String title, String description) {
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
          ],
        ),
      ),
    );
  }
}
