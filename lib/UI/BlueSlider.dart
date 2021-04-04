


import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_bluetooth_serial_example/AvailableSpeakers.dart';
import 'package:flutter_bluetooth_serial_example/main.dart';
import 'package:location/location.dart';

import '../SearchingSpeakers.dart';


class CustomRangeSelector extends StatefulWidget {
  final double start;
  final Function(double start) onStartChange;
  final double width, height;


  const CustomRangeSelector(
      {Key key, @required this.start, @required this.onStartChange, @required this.width, @required this.height})
      : super(key: key);


  @override
  _CustomRangeSelectorState createState() => _CustomRangeSelectorState();
}

class _CustomRangeSelectorState extends State<CustomRangeSelector> with SingleTickerProviderStateMixin {

  double startPosition = 0;

  AnimationController colorFillController;
  Animation animation;
  Animation glowAnimation;
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  future()async{
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.DENIED) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.GRANTED) {
        return;
      }
    }
  }


  @override
  void initState() {
    colorFillController = AnimationController(vsync: this,animationBehavior: AnimationBehavior.normal,duration: Duration(milliseconds: 1900));
    colorFillController.repeat(reverse: true,);
    animation = Tween(begin:0.0,end:1.0).animate(colorFillController);
    glowAnimation = Tween(begin: 10.0, end: 4.0).animate(colorFillController);

    future();


    super.initState();

    startPosition = widget.start * widget.width;


  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
        shaderCallback: (rect){
      return LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: <Color>[
              greenColor,Colors.white
          ],
          stops: [
            animation.value,animation.value

          ]
      ).createShader(rect);
    },
    child: Container(
    width: widget.width,
    height: widget.height,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(widget.width * 5),
    color:Colors.transparent,
    border: Border.all(color: Colors.white,width: 5),

    ),

    ),
    ),
    /*Positioned(
      left: 4,
        top: 4,
        child: Container(
            width: widget.width-8,
            height: widget.height-8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.width * 5),
              color:Colors.white,
              )
        )
    ),*/

    Positioned(
    top :  startPosition,
    left: widget.width/3.4,
    child: GestureDetector(
    onPanUpdate: (panUpdate) {
    double newPosition = (startPosition + panUpdate.delta.dy).clamp(widget.width * 0.25, widget.height * 0.75);

    widget.onStartChange(double.parse((newPosition / widget.height).toStringAsFixed(2)));
    setState(() {
    startPosition = newPosition;
    });

    },
    onPanEnd: (panEnd){
    setState(() {
    startPosition = widget.width * 0.25;
    });
    future()async{
                    await FlutterBluetoothSerial.instance.requestEnable();
                 }
                 future().then((_) async{/// again uncomment it

                    if(await FlutterBluetoothSerial.instance.isEnabled){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>AvailableSpeakers()),
                      );
                    }
                 } );
   /* Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AvailableSpeakers()));*/
    },
    child: Container(
        width: widget.width/2.5,
        height: widget.width/2.5,
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.grey[700],
    border: Border.all(color: Colors.white , width: 4),
    boxShadow: [
    BoxShadow(
    color: greenColor,
    blurRadius: glowAnimation.value, // soften the shadow
    spreadRadius: glowAnimation.value, //extend the shadow
    )

      ],

    )))
    )
    ]
    );

  }
}