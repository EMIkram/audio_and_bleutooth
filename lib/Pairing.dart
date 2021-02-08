import 'dart:async';

import 'package:flutter/material.dart';

import 'BluetoothOn.dart';
import 'FinalScreen.dart';

class Pairing extends StatefulWidget {
  @override
  _PairingState createState() => _PairingState();
}

class _PairingState extends State<Pairing> {
  bool pairing = true;

  @override
  void initState() {
    Timer(
        Duration(seconds: 5),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => FinalScreen())));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return constantWidgets.backgroundScreen(context,
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(pairing? "Pairing Successful": "Pairing Failed",style: TextStyle(fontSize: 25),),
              pairing? Image.asset("assets/Bluetooth.png",scale: 1.2,): Column(
                children: [
                  Image.asset("assets/blueRed.png",scale: 1.2),
                  Icon(Icons.error,color: Colors.red,size: width/7,),
                  Container(
                    padding: EdgeInsets.all(width/50),
                    width: width/2,
                    height: height/10,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(width/30),
                        border: Border.all(color: Colors.grey[400])

                    ),
                    child: Center(child: Text('Make sure your Device is turned on & ready to pair',
                      style:TextStyle(fontSize: 15) ,
                    )),
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}