import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_bluetooth_serial_example/UI/BlueSlider.dart';

import 'SearchingSpeakers.dart';
import 'main.dart';
import 'main.dart';

class BluetoothON extends StatefulWidget {
  @override
  _BluetoothONState createState() => _BluetoothONState();
}

class _BluetoothONState extends State<BluetoothON> with SingleTickerProviderStateMixin{

  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  String _address = "...";
  String _name = "...";
  bool value = false;
  double start = 0.25;
  AnimationController textOpacityController;
  Animation animation;


  Timer _discoverableTimeoutTimer;
  int _discoverableTimeoutSecondsLeft = 0;

  // BackgroundCollectingTask _collectingTask;

  // bool _autoAcceptPairingRequests = false;

  void bluetoothOnAnimation(){

  }

  @override
  void initState() {
    textOpacityController = AnimationController(vsync: this,animationBehavior: AnimationBehavior.normal,duration: Duration(milliseconds: 600));
    textOpacityController.repeat(reverse: true);
    animation = Tween(begin: 1.0,end: 0.0).animate(textOpacityController)..addListener((){
      setState(() {

      });
    });

    super.initState();
    // Get current state
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    Future.doWhile(() async {
      // Wait if adapter not enabled
      if (await FlutterBluetoothSerial.instance.isEnabled) {
        return false;
      }
      await Future.delayed(Duration(milliseconds: 0xDD));
      return true;
    }).then((_) {
      // Update the address field
      FlutterBluetoothSerial.instance.address.then((address) {
        setState(() {
          _address = address;
        });
      });
    });

    FlutterBluetoothSerial.instance.name.then((name) {
      setState(() {
        _name = name;
      });
    });

    // Listen for further state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;

        // Discoverable mode is disabled when Bluetooth gets disabled
        _discoverableTimeoutTimer = null;
        _discoverableTimeoutSecondsLeft = 0;
      });
    });
  }

  @override
  void dispose() {
    FlutterBluetoothSerial.instance.setPairingRequestHandler(null);
    // _collectingTask?.dispose();
    _discoverableTimeoutTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
   return constantWidgets.commonScaffold(context,
    Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,

      child: Stack(
        children: [

          constantWidgets.alignment(0.0, -0.5,AnimatedOpacity(
            opacity: animation.value,
              curve: Curves.linearToEaseOut,
              duration: Duration(milliseconds: 800),
              child: Text('Drag Down To Connect',style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 7,color: Colors.grey[700]),))),
          constantWidgets.alignment(0.0, 0.1, CustomRangeSelector(
            width:  SizeConfig.screenWidth*0.22,
            height: SizeConfig.screenHeight * 0.32 ,
            start: start,
            onStartChange: (value){
              setState(() {
                start = value;
              });
            },

          ),

          )
        ],
      ),
    )
    );
 }
}