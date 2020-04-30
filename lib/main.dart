import 'package:flutter/material.dart';
import 'package:flutter_animation/navigator/tab_navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // print(student.name);
    return MaterialApp(
      home: TabNavgator(),
    );
  }
}