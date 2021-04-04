
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui';
import 'package:volume_control/volume_control.dart';

import 'package:sleek_circular_slider/sleek_circular_slider.dart';


// ignore: must_be_immutable
class NowPlaying extends StatefulWidget {
  @override
  Map<String, dynamic> _song;
  Function resume, pause, seek, nextSong,prevSong; //  recent added next song
  bool isPaused, isStop;
  Duration duration, position;
  int index;



  NowPlaying(data)  {
    _song = data['song'];
    pause = data["pause"];
    resume = data["resume"];
    nextSong = data["nextSong"];// recent added
    prevSong = data["prevSong"];// recent added
    position = new Duration(milliseconds: data['position']);
    isPaused = data['isPaused'];
    isStop = data['isStop'];
    seek = data['seek'];
    index = data['selectedSongIndex'];
    duration = new Duration(milliseconds: data['duration']);
  }
  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  String currentPosition;
  double _volumeListenerValue = 0;
  double _getVolume = 0;
  double _setVolumeValue = 0;

  Key key = Key("1st");
  @override
  void initState() {
    super.initState();
   /* VolumeController.volumeListener.listen((volume) {
      setState(() => _volumeListenerValue = volume);
    });
    VolumeController.getVolume().then((volume) => _setVolumeValue = volume);*/
  }

  Widget buildBackground(img) {
    if (img != null) {
      if (img == 'unknown') {
        return Image(
          image: new AssetImage("./assets/songlogo.png"),
          color: Colors.black54,
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
        );
      } else {
        File pic = new File.fromUri(Uri.parse(img));

        return Image.file(
          pic,
          fit: BoxFit.cover,
          color: Colors.black54,
          colorBlendMode: BlendMode.darken,
        );
      }
    } else {
      return Image(
        image: new AssetImage("./assets/songlogo.png"),
        color: Colors.black54,
        fit: BoxFit.cover,
        colorBlendMode: BlendMode.darken,
      );
    }
  }

  buildImage(img) {
    if (img != null) {
      if (img == 'unknown') {
        return Image(
          image: new AssetImage("./assets/songlogo.png"),
        );
      } else {
        File pic = new File.fromUri(Uri.parse(img));

        return Image.file(
          pic,
        );
      }
    } else {
      return Image(
        image: new AssetImage("./assets/songlogo.png"),
      );
    }
  }

  String getDuration(Duration duration) {
    List<String> d = duration.toString().split(":");

    String Time = '';

    if (double.parse(d[0]) > 0.0) {
      Time = Time + d[0] + ":";
    }
    if (double.parse(d[1]) > 0.0) {
      Time = Time + d[1] + ":";
    }

    if (double.parse(d[2]) > 0.0) {
      Time = Time + d[2].split(".")[0];
    }
    if (Time == "") Time = "0:0";

    return Time;
  }

  Widget buildButton(bool paused) {
    if (paused) {
      return InkWell(
        child: Icon(Icons.play_arrow, color: Colors.white, size: 30.0),
        onTap: () {
          widget.resume();
        },
      );
    }

    return InkWell(
        child: Icon(Icons.pause, color: Colors.white, size: 30.0),
        onTap: () {
          widget.pause();
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(icon:Icon(Icons.menu),),
                actions: [Column(children: [Icon(Icons.battery_std),Text("100%")],)],
              )
            ],
          ),
        )
    );


    /*Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Stack(
        children: <Widget>[
          Container(
            child: buildBackground(widget._song["Image"]),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.black87.withOpacity(0.1)),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      widget._song["Title"],
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      widget._song["Artist"],
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ],
                ),
              ),
              Container
                (
                width:size.width/1,
                height: size.height/4,
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                          width:size.width/1,
                          height: size.height/4,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.indigo.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                // offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),child: Image.asset("Assets/blackknobpng.png",width: 650,height: 650,)),
                      Positioned(
                        height: 120,
                        left: 140,
                        child: SleekCircularSlider(
                          key: key,
                          min: 0,
                          max: 1,
                          initialValue: _setVolumeValue,
                          appearance: CircularSliderAppearance(
                            size: size.height/7,
                            customWidths: CustomSliderWidths(
                                progressBarWidth: 20,
                                trackWidth: 20,
                                handlerSize: 15
                            ),
                            customColors: CustomSliderColors(

                              dotColor: Colors.indigo,
                              shadowColor: Colors.black,
                              progressBarColor: Colors.black,
                              trackColor: Colors.black,
                            ),
                          ),
                          onChange: (double value)async{
                            ///TODO:
                            _setVolumeValue = value;
                           *//* VolumeController.setVolume(_setVolumeValue);*//*
                            setState(() {});
                          },
                          onChangeEnd: (double value)async{
                            _setVolumeValue = value;

                            setState(() {
                             *//* VolumeController.setVolume(_setVolumeValue);*//*
                            });
                          },
                        ),),
                      Positioned(
                        height: 250,
                        left: 140,
                        child: SleekCircularSlider(
                          key: key,
                          min: 0,
                          max: 1,
                          initialValue: _setVolumeValue,
                          appearance: CircularSliderAppearance(
                            size: size.height/7,
                            customWidths: CustomSliderWidths(
                                progressBarWidth: 20,
                                trackWidth: 20,
                                handlerSize: 15
                            ),
                            customColors: CustomSliderColors(

                              dotColor: Colors.indigo,
                              shadowColor: Colors.black,
                              progressBarColor: Colors.black,
                              trackColor: Colors.black,
                            ),
                          ),
                          onChange: (double value)async{
                            ///TODO:
                            _setVolumeValue = value;
                            *//*VolumeController.setVolume(_setVolumeValue);*//*
                            setState(() {});
                          },
                          onChangeEnd: (double value)async{
                            _setVolumeValue = value;

                            setState(() {
                              *//*VolumeController.setVolume(_setVolumeValue);*//*
                            });
                          },
                        ),)

                    ],

                  ),
                ),
              ),
              *//* FittedBox(
                fit: BoxFit.scaleDown,
                child: KnobCircularSilder()
            ),*//*
              *//*  Container(
                child: buildImage(_song["Image"]),
                height: 300,
                width: 300,
              ),*//*
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      getDuration(widget.position),
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                    Slider(
                      activeColor: Colors.white,
                      inactiveColor: Colors.white,
                      value: widget.position.inMilliseconds.toDouble(),
                      onChanged: (val) {
                        widget.seek(val.toInt());
                      },
                      min: 0.0,
                      max: widget.duration.inMilliseconds.toDouble(),
                    ),
                    Text(
                      getDuration(widget.duration),
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: Icon(
                        Icons.fast_rewind,
                        size: 40.0,
                        color: Colors.white,
                      ),
                      onTap: () {
                        widget.prevSong();
                      },
                    ),
                    buildButton(widget.isPaused),
                    InkWell(
                      child: Icon(Icons.fast_forward,
                          size: 40.0, color: Colors.white),
                      onTap: () {
                        *//* widget.seek(300000);*//*
                        widget.nextSong();

                      },
                    ),
                  ],
                ),
              )
            ],
          )
        ],
        fit: StackFit.expand,
      ),
    );*/
  }
}
