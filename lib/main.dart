import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/BluetoothOn.dart';
import 'package:flutter_bluetooth_serial_example/SearchingSpeakers.dart';



import './MainPage.dart';
import 'FinalScreen.dart';

void main() => runApp(new ExampleApplication());

class ExampleApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BluetoothON());
  }
}

class ConstantWidgets{
  Widget widget;

  Widget backgroundScreen (BuildContext context,widget,{margin,floatingActionButton}){
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/backcrop.jpg',),
                  fit: BoxFit.cover
              ),
            ),
            child: Container(
              margin: margin,
              child: widget,
            )
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }

}

/*
class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  double _sliderValue = 0.0;
  int maxVol, currentVol;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    await Volume.controlVolume(AudioManager
        .STREAM_MUSIC); // you can change which volume you want to change.
  }

  updateVolumes() async {
    maxVol = await Volume.getMaxVol;
    currentVol = await Volume.getVol;
    setState(() {});
  }

  setVol(int i) async {
    await Volume.setVol(i);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slider(
        activeColor: Colors.indigoAccent,
        min: 0.0,
        max: 15.0,
        onChanged: (newRating) async {
          setState(() {
            _sliderValue = newRating;
          });
          await setVol(newRating.toInt());
          await updateVolumes();
        },
        value: _sliderValue,
      ),
    );
  }
}
*/
