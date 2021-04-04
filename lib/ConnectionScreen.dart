import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/UI/ImageSlider.dart';
import 'package:flutter_bluetooth_serial_example/main.dart';

import 'FinalPlay.dart';

class ConnectionScreen extends StatefulWidget {
  String title;Widget widget; final icon;
  ConnectionScreen(this.title,this.widget,this.icon);

  @override
  _ConnectionScreenState createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {

   @override
  void initState() {
     connected?Timer(
         Duration(seconds: 3),
             () => Navigator.of(context).pushReplacement(MaterialPageRoute(
             builder: (BuildContext context) => FinalPlay()))):Text("");

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return constantWidgets.availableScreenLayout(context,widget.title,widget.widget, widget.icon);
  }
}
