import 'dart:io';
import 'dart:math' as math;


import 'package:deepmusicfinder/deepmusicfinder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/main.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:volume_control/volume_control.dart';
import 'dart:async';
import './NowPlaying.dart';

import 'package:flutter/services.dart';


import 'package:permission_handler/permission_handler.dart';



// void main() => runApp(MyApp());

bool equilizer = false;
class FinalPlay extends StatefulWidget {
  @override
  _FinalPlayState createState() => _FinalPlayState();
}

class _FinalPlayState extends State<FinalPlay> with SingleTickerProviderStateMixin{

  List<Map<dynamic, dynamic>> songsList = [];
  Deepmusicfinder dmf;
  bool paused = true;
  bool stop = true;
  int selectedSongIndex;
  int prevSongIndex;
  int duration = 0;
  int position = 0;
  double _val;
  double startAngle =0.0;
  double sliderValue = 5.0;
  bool mute = false;

  double Two_Pi = 3.14 * 2;
  double endAngle= 0.0 ;
  AnimationController knobAnimationController ;
  Animation knobAnimation;


  @override
  void initState() {
    knobAnimationController = AnimationController(vsync: this, duration: Duration(seconds:4 ),);
    knobAnimation = Tween(begin: startAngle,end: endAngle).animate(knobAnimationController);

    super.initState();
    initPlatformState();
    initVolumeState();
  }
  Future<void> initVolumeState() async {
    if (!mounted) return;

    //read the current volume
    _val = await VolumeControl.volume;
    print("value$_val");
  }
  Future<void> initPlatformState() async {
    dmf = new Deepmusicfinder();
    initPlayer();
    this.getPermission();
  }


  initPlayer() {
    dmf.getDuration.listen((d) {
      if (d != duration) {
        if (songsList[selectedSongIndex]["Duration"] != d) {
          setState(() {
            duration = d;
          });
        } else {
          setState(() {
            duration = songsList[selectedSongIndex]["Duration"];
          });
        }

      }
    });

    dmf.onComplete.listen((e) {
      if (e) {
        setState(() {
          stop = true;
          paused = true;
        });
      }
      onComplete();

    });

    dmf.onPositionChange.listen((pos) {
      if(pos > duration) {
        return;
      }
      setState(() {
        position = pos;
      });

    });
  }

  void getPermission() {
    PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage)
        .then((checkPermissionStatus) async {
      if (checkPermissionStatus == PermissionStatus.granted) {
        try {
          dynamic result = await dmf.fetchSong;

          if (result["error"] == true) {
            print(result["errorMsg"]);
            return;
          }

          setState(() {
            songsList = List.from(result["songs"]);
          });
        } catch (e) {
          print(e);
        }
      } else {
        PermissionHandler().requestPermissions([PermissionGroup.storage]).then(
                (reqPermissions) async {
              if (reqPermissions[PermissionGroup.storage] ==
                  PermissionStatus.granted) {
                try {
                  dynamic result = await dmf.fetchSong;

                  if (result["error"] == true) {
                    print(result["errorMsg"]);
                    return;
                  }

                  setState(() {
                    songsList = List.from(result["songs"]);
                  });
                } on PlatformException {
                  print("Error");
                }
              }
            });
      }
    });
  }

  Widget buildLeading(img) {
    if (img == null) {
      return ClipOval(child: Icon(Icons.library_music));
    }
    if (img == "unknown") {
      return ClipOval(child: Icon(Icons.library_music));
    }
    File pic = new File.fromUri(Uri.parse(img));
    return ClipOval(
      child: Image.file(pic, height: 50.0, width: 50.0),
    );
  }

  play(int index) async {
    stopSong();

    try {
      int result = await dmf.play(songsList[index]['path']);
      if (result == 1) {
        setState(() {
          prevSongIndex = index;
          selectedSongIndex = index;
          paused = false;
          stop = false;
        });
      }
    } catch (err) {
      print(err);
    }
  }


  pause() async {

    try {
      int result = await dmf.pause();
      if (result == 1) {
        setState(() {
          paused = true;
          stop = false;
        });
      }
    } catch (err) {
      print("_______________" + err);
    }
  }

  stopSong() async {
    try {
      int result = await dmf.stop();
      if (result == 1) {
        setState(() {
          paused = true;
          stop = true;
        });
      }
    } catch (err) {
      print("______________" + err);
    }
  }

  resume() async {
    try {
      int result = await dmf.play(songsList[selectedSongIndex]['path']);
      if (result == 1) {
        setState(() {
          paused = false;
          stop = false;
        });
      }
    } catch (err) {
      print(err);
    }
  }

  seek(int position) async {
    try {
      int result = await dmf.seek(position);
      if (result == 1) {}
    } catch (err) {
      print("______________" + err);
    }
  }

  onComplete() {
    if (selectedSongIndex >= songsList.length - 1) {
      this.play(0);
    } else {
      this.play(prevSongIndex + 1);
    }
  }
  playNext(){
    this.play(prevSongIndex + 1);
  }
  playPrev(){
    this.play(prevSongIndex - 1);
  }



  Widget buildNowPlaying() {
    if (selectedSongIndex == null) {
      return Center(
        child: Text("Song Not Played"),
      );
    }
    return NowPlaying({
      "song": songsList[selectedSongIndex],
      "resume": resume,
      "pause": pause,
      "nextSong": playNext,
      "prevSong": playPrev,
      "isPaused": paused,
      "isStop": stop,
      "duration": duration,
      'seek': seek,
      'selectedSongIndex': selectedSongIndex,
      'position': position,
    });
  }

  Widget songBuilder(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.0),
      child: ListTile(
        title: Text(songsList[index]["Title"]),
        leading: buildLeading(songsList[index]["Image"]),
        onTap: () {
          this.play(index);
        },
      ),
    );
  }

  // Widget iconChnage(iconKey,Color outerColor ,Color iconColor,icon ,iconSize,value){
  //   return Container(
  //     decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         color: outerColor,
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black,
  //             spreadRadius: 2,
  //             blurRadius: 5,
  //           )
  //         ]
  //     ),
  //     child:  IconButton(icon: Icon(icon,color: iconColor,key:iconKey,), onPressed: ()
  //     {
  //       setState(() {
  //         value;
  //       });
  //     },
  //         iconSize: iconSize),
  //   );
  // }

  Widget iconChnage(Color outerColor ,Color iconColor,icon ,iconSize,value){
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: outerColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 2,
              blurRadius: 5,
            )
          ]
      ),
      child:  IconButton(icon: Icon(icon,color: iconColor), onPressed: value,
          iconSize: iconSize),
    );
  }

  /* double angle = 0.0;

  void _onPanUpdateHandler(DragUpdateDetails details) {
    final touchPositionFromCenter = details.localPosition;
    setState(
          () {
        angle = touchPositionFromCenter.direction ;
        print("angle pi ${angle * (180/math.pi)}");
        print("angle $angle");

          },
    );
  }*/


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
   /* return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: greenColor,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: "Songs",
                ),
                Tab(
                  text: 'Now Playing',
                )
              ],
            ),
            title: const Text('Sound Crush'),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                child: ListView.builder(
                  itemBuilder: songBuilder,
                  itemCount: songsList.length,
                ),
              ),
              buildNowPlaying()
            ],
          ),
        ),
      ),
    );*/ /// donot remove this code

    return SafeArea(child: Scaffold(
      key: scaffoldKey,
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        color: Colors.grey[800],
        child: Stack(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(icon: Icon(Icons.menu), onPressed: (){
                scaffoldKey.currentState.openDrawer();
              }),
              actions: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Icon(Icons.battery_std),Text("100%")],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Flexible(
                    child: Image.asset("assets/bzoom.png",alignment: Alignment.topCenter),
                  ),
                  Text("Bzoom",style: TextStyle(color: Colors.white,),),
                  Knob(0.39,0.24,0.23,iconChnage(Colors.grey[800], Colors.white, mute?Icons.volume_mute_outlined:Icons.volume_up,35.0,
                          (){
                        setState(() {
                          mute=mute? mute =false:mute= true;
                        });
                      }
                  )),
                  SizedBox(height: 3,),
                  Flexible(child: Text("Said the sky - All I got",style: TextStyle(color: Colors.white),)),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "00:26",
                            style: TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                          Flexible(
                            flex: 2,
                            child: Slider(
                              value: sliderValue,
                              min: 0.0,
                              max: 10.0,
                              divisions: 10,
                              activeColor: Colors.grey[400],
                              inactiveColor: Colors.grey,
                              onChanged: (double value){
                                setState(() {
                                  sliderValue = value;
                                });
                              },
                            ),
                          ),
                          Text(
                            "03:54",
                            style: TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ClipPath(
                    clipper:OvalTopBorderClipper(),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.red,
                                  blurRadius: 20,
                                  spreadRadius: 20
                              )
                            ]
                        ),
                        height:SizeConfig.screenHeight * 0.25,
                        child: equilizer?
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(child: iconChnage(Colors.grey, Colors.black, Icons.equalizer,SizeConfig.screenWidth * 0.07,  (){
                              setState(() {
                                equilizer = equilizer? false:true;
                              });
                            } )),

                            Row(
                              children: [
                                Flexible(child: Knob(0.19,0.11,0.10,Text("Bass"))),

                                Flexible(child: Knob(0.19,0.11,0.10,Text("Treble"))),
                              ],
                            ),
                          ],
                        ):
                        Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(icon: Icon(Icons.skip_previous_rounded,color: Colors.black,), onPressed:(){
                                    },iconSize: SizeConfig.screenWidth * 0.12,),
                                    iconChnage(Colors.grey, Colors.black, paused?Icons.arrow_right:Icons.pause,SizeConfig.screenWidth * 0.15,
                                            (){
                                          setState(() {
                                            paused=paused?false:true;
                                          });
                                        }
                                    ),


                                    IconButton(icon: Icon(Icons.skip_next,color: Colors.black,), onPressed: null,iconSize: SizeConfig.screenWidth * 0.12),

                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(icon: Icon(Icons.repeat_rounded,color: Colors.black,), onPressed: null),
                                  IconButton(icon: Icon(Icons.equalizer,color: Colors.black,),
                                    onPressed: (){
                                      setState(() {
                                        equilizer= true;
                                      });
                                    },
                                  ),
                                  IconButton(icon: Icon(Icons.music_note_rounded,color: Colors.black,), onPressed: (){
                                    showModalBottomSheet<void>(context: (context), builder: (BuildContext context){
                                      return Container(
                                        height: SizeConfig.screenHeight,
                                        decoration: BoxDecoration(

                                          boxShadow: [
                                            BoxShadow(color: Colors.white70,blurRadius: 5,spreadRadius:5)
                                          ]
                                        ),
                                        child: ListView.builder(
                                          itemCount: songsList.length,
                                          itemBuilder:songBuilder
                                        ),
                                      );
                                    });
                                  }),

                                ],
                              ),
                            )
                          ],
                        ))

                    ),)
                  // Slider(
                  //   activeColor: Colors.white,
                  //   inactiveColor: Colors.white,
                  //   value: 1.0,
                  //  /* widget.position.inMilliseconds.toDouble()*/
                  //   onChanged: (val) {
                  //   /*  widget.seek(val.toInt());*/
                  //   },
                  //   min: 0.0,
                  //   max: 1.0,
                  // ),

                ],
              ),
            ),
          ],
        ),
      ),
      drawer: constantWidgets.drawer(context),
    ));

  }
}
class OvalTopBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, 80);
    path.quadraticBezierTo(size.width / 4, 3, size.width / 2, 0);
    path.quadraticBezierTo(size.width - size.width / 4, 0, size.width, 80);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}


