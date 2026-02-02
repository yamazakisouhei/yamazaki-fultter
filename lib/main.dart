import 'package:flutter/material.dart';
import 'package:simple_navigation_mock/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Navigation Mock',
      home: HomePage(),
    );
  }
}
