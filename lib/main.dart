import 'package:flutter/material.dart';
import 'package:lasttaskdsc/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Timer",
      debugShowCheckedModeBanner: false,
      home: Splashpage(),
    );
  }
}
