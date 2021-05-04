
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_device_details_demo/device_detail_demo.dart';
import 'package:flutter_device_details_demo/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}
