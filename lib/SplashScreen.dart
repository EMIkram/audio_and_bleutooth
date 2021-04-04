import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/SiginScreen.dart';
import 'package:flutter_bluetooth_serial_example/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(
        Duration(seconds: 8),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => SigninScreen())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: Image.asset("assets/soundcrush logo 2.gif",scale: 3)),
      ),
    );
  }
}