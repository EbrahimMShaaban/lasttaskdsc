import 'package:flutter/material.dart';
import 'package:lasttaskdsc/home.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class Splashpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: Home(),
      duration: 3000,

      backgroundColor: Colors.blueGrey,
      imageSize: 200,
      imageSrc: "images/1.jpg",
      text: "Clock App",
      textStyle: TextStyle(
          color: Colors.white, fontStyle: FontStyle.italic, fontSize: 30),
    );
  }
}
