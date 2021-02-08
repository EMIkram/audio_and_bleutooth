import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import 'SearchingSpeakers.dart';
import 'main.dart';

ConstantWidgets constantWidgets = ConstantWidgets();
class BluetoothON extends StatefulWidget {
  @override
  _BluetoothONState createState() => _BluetoothONState();
}

class _BluetoothONState extends State<BluetoothON> {

  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  String _address = "...";
  String _name = "...";

  Timer _discoverableTimeoutTimer;
  int _discoverableTimeoutSecondsLeft = 0;

  // BackgroundCollectingTask _collectingTask;

  // bool _autoAcceptPairingRequests = false;

  @override
  void initState() {
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return constantWidgets.backgroundScreen(context, Center(
      child: Column(
        children: [
          SizedBox(height: height/4,),
          Text('Slide To Turn On',style: TextStyle(fontSize: width/12),),
          SizedBox(height:  height/30,),
          Draggable(
            child: Image.asset('assets/146052.png',
              scale: 2.8,
            ),
            feedback: Image.asset('assets/146052.png',
              scale: 2.8,
            ),
            childWhenDragging: Text(''),
            axis: Axis.vertical,
            onDragEnd: (end){
              // TODO:  BlueStatusOn
              future()async{
                return await FlutterBluetoothSerial.instance.requestEnable();
              }
              future().then((_) {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchingSpeaker()),
              );
              } );
            },
          ),
        ],
      ),
    ));

  }
}