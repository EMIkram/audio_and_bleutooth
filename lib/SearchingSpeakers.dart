import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_bluetooth_serial_example/FinalScreen.dart';
import 'AvailableSpeakers.dart';
import 'ChatPage.dart';
import 'DiscoveryPage.dart';
import 'SelectBondedDevicePage.dart';
import 'BluetoothOn.dart';

class SearchingSpeaker extends StatefulWidget {

  @override
  _SearchingSpeakerState createState() => _SearchingSpeakerState();
}

class _SearchingSpeakerState extends State<SearchingSpeaker> {

  @override
  void initState() {
    Timer(
        Duration(seconds: 5), // ToDo Make dynamic when searching complete then navigate
            () async {
          final BluetoothDevice selectedDevice =
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return AvailableSpeakers();
              },
            ),
          );

          if (selectedDevice != null) {
            print('Discovery -> selected ' + selectedDevice.address);
          } else {
            print('Discovery -> no device selected');
          }
        },
            /*() => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => AvailableSpeakers()))*/
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height=  MediaQuery.of(context).size.height;
    return constantWidgets.backgroundScreen(context,
        Container(
          color: Colors.grey[900].withOpacity(0.7), /// check with anum
          child: Center(
            child: Column(
              children: [
                SizedBox(height: height/6,),
                Image.asset('assets/logo.png',   //TODO image not properly loaded => resolve this issue
                  scale: 4.8,
                ),
                SizedBox(height: height/8,),
                Text('Searching...',style: TextStyle(fontSize: height/30,color: Colors.grey),),
              ],
            ),
          ),
        ));
  }
  // void _startChat(BuildContext context, BluetoothDevice server) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) {
  //         return FinalScreen(server: server,);
  //       },
  //     ),
  //   );
  // }

}