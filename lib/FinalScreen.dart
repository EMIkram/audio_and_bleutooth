/*
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'AvailableSpeakers.dart';

ScrollController drawerDevices = ScrollController();

class FinalScreen extends StatefulWidget {
  @override
  _FinalScreenState  createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {

  bool signIn = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List drawerItems = ['About','My Music', 'Privacy Policy', 'Warrenty Claim'];
  AudioPlayer _audioPlayer = AudioPlayer();
  AudioPlayer advancedPlayer = new AudioPlayer();
  bool isPlaying = false;
  String currentTime = "00:00";
  String completeTime= "00:00";

  bool showchild = false;

  void initState() {
    // TODO: implement initState
    super.initState();

    _audioPlayer.onAudioPositionChanged.listen((Duration duration){
      setState(() {
        currentTime = duration.toString().split(".")[0];
      });
    });

    _audioPlayer.onDurationChanged.listen((Duration duration){
      setState(() {
        completeTime = duration.toString().split(".")[0];
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
          top: false,
          child: Container(
            decoration: BoxDecoration(
              image:  DecorationImage(
                  image: AssetImage('assets/backcrop.jpg',),
                  fit: BoxFit.cover
              ),
            ),
            child: Column(
              children: <Widget>[
                showchild?
                AnimatedContainer(
                  duration: Duration(seconds: 10),
                  curve: Curves.easeIn,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(icon: Icon(Icons.menu,color: Colors.black,),onPressed: (){
                      _scaffoldKey.currentState.openDrawer();
                    },),
                    actions: [
                      IconButton(icon: Icon(Icons.bluetooth,color: Colors.black), onPressed: (){
                        _scaffoldKey.currentState.openEndDrawer();
                      })
                    ],
                  ),
                ):Container(),
                showchild?
                Text('M7',style: TextStyle(fontSize: size.width/13,fontWeight: FontWeight.bold),):Container(),
                TweenAnimationBuilder(
                    onEnd: (){setState(() {
                      showchild=true;
                    });},
                    curve: Curves.bounceIn,
                    tween: Tween<double>(begin: size.height,end: size.height/8),      // ToDo set the height so that other children can also have space
                    duration: Duration(seconds: 1),
                    builder: (BuildContext context,dynamic value, Widget child){
                      return Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            Container(child: Image.asset('assets/m73.png',),height: value,),
                          ],
                        ),
                      );
                    }
                ),
                *//*showchild?
                Container():Text('Connected'),*//*
                showchild?
                Container(
                  child: Expanded(
                    child: Column(
                      children: [
                        Flexible(child: FractionallySizedBox(heightFactor: 0.3,)),
                        SleekCircularSlider(
                          appearance: CircularSliderAppearance(
                            size: size.height/3.5,
                            customWidths: CustomSliderWidths(
                                progressBarWidth: 2,
                                trackWidth: 5,
                                handlerSize: 15
                            ),
                            customColors: CustomSliderColors(
                              dotColor: Colors.green,
                              progressBarColor: Colors.grey,
                              trackColor: Colors.grey,
                            ),
                          ),
                          onChange: (double value){
                            ///TODO:
                          },
                        ),
                        *//*Align(
                                        heightFactor: 0.1,
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              IconButton(icon: Icon(isPlaying?Icons.play_circle_outline:Icons.pause_circle_outline,size: size.height/15,), onPressed: (){
                                                if(isPlaying){
                                                  _audioPlayer.pause();
                                                  *//**//*_audioPlayer.stop();*//**//*

                                                  setState(() {
                                                    isPlaying = false;
                                                  });
                                                }else{
                                                  _audioPlayer.resume();

                                                  setState(() {
                                                    isPlaying = true;
                                                  });
                                                }

                                              }),
                                              SizedBox(width: size.width/8,),

                                              IconButton(icon: Icon(Icons.stop,size: size.height/15,), onPressed: (){
                                                _audioPlayer.stop();
                                              }),
                                            ]
                                        ),
                                      ),*//*
                      ],
                    ),
                  ),
                ):Container(),
                *//*Text('M7',style: TextStyle(fontSize: size.width/13,fontWeight: FontWeight.bold),),
                Image.asset("assets/m73.png",scale: 3.5),*//*
                *//*Flexible(child: FractionallySizedBox(heightFactor: 0.3,)),
                SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                    size: size.height/3.5,
                    customWidths: CustomSliderWidths(
                        progressBarWidth: 2,
                        trackWidth: 5,
                        handlerSize: 15
                    ),
                    customColors: CustomSliderColors(
                      dotColor: Colors.green,
                      progressBarColor: Colors.grey,
                      trackColor: Colors.grey,
                    ),
                  ),
                  onChange: (double value){
                    ///TODO:
                  },
                ),
                Align(
                  heightFactor: 0.1,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(icon: Icon(isPlaying?Icons.play_circle_outline:Icons.pause_circle_outline,size: size.height/15,), onPressed: (){
                          if(isPlaying){
                            _audioPlayer.pause();
                            *//**//*_audioPlayer.stop();*//**//*

                            setState(() {
                              isPlaying = false;
                            });
                          }else{
                            _audioPlayer.resume();

                            setState(() {
                              isPlaying = true;
                            });
                          }

                        }),
            SizedBox(width: size.width/8,),

            IconButton(icon: Icon(Icons.stop,size: size.height/15,), onPressed: (){
              _audioPlayer.stop();
            }),
                      ]
                  ),
                ),*//*
              ],
            ),

          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.audiotrack),
        onPressed: () async{
          ///TODO: MUST IMPLEMENT IOS DEPENDENCY AS AUDIO PLAYERS PACKAGE
          String filePath = await FilePicker.getFilePath();

          int status = await _audioPlayer.play(filePath, isLocal: true);
          *//* await _audioPlayer.setReleaseMode(ReleaseMode.LOOP);*//* //LOOP: will never release; after completed, it will start playing again on loop.

          if(status == 1){
            setState(() {
              isPlaying = true;
            });
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Center(
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: size.width/10,
                        child: Icon(
                            Icons.account_circle,
                            size: 65,
                            color: Colors.green),
                        backgroundColor: Colors.white,),
                      title:signIn==true? Text("Seerat Afreen"):
                      GestureDetector(child: Text('Sign in' ,style: TextStyle(color: Colors.black),),
                        onTap: (){
                          setState(() {
                            signIn = signIn==true? false: true;
                          });
                        },)
                  ),
                )),
            Divider(height: 1,color: Colors.black,thickness: size.height/120,),
            ListView.builder(
                controller: drawerDevices,
                padding: EdgeInsets.only(left:size. width/13,top: size.height/11),
                itemExtent: size.height/15,
                shrinkWrap: true,
                itemCount: drawerItems.length,
                itemBuilder: (context,index){
                  return Center(child: Text(drawerItems[index],style: TextStyle(fontWeight: FontWeight.bold),));
                }
            ),
            Divider(indent:size.width/7,endIndent: size.width/7,height: size.height/5,color: Colors.black,thickness: size.height/250,),
            Center(child: Text('App Version')),
            Center(child: Text('1.0.0'))

          ],

        ),
      ),
      endDrawer: FractionallySizedBox(
        widthFactor: 0.70,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 300,top: 80,right: 30 ),
          child: Drawer(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width/20),

              ),
              child: ListView(
                children: [
                  Center(child: Text('Available Speakers',style: TextStyle(fontSize: size.height/40,color: Colors.green),)),
                  Divider(thickness: 2,height: 40,),
                  ListView.builder(
                      controller: drawerDevices,
                      padding: EdgeInsets.only(left: size.width/13,top: size.height/11),
                      itemExtent:size.height/15,
                      shrinkWrap: true,
                      itemCount: availableSpeakers.length,
                      itemBuilder: (context,index){
                        return Text(availableSpeakers[index]);
                      }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

    *//*return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image:  DecorationImage(
                image: AssetImage('assets/backcrop.jpg',),
                fit: BoxFit.cover
            ),
          ),
          child: Column(

            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(icon: Icon(Icons.menu,color: Colors.black,),onPressed: (){
                  _scaffoldKey.currentState.openDrawer();
                },),
                actions: [
                  IconButton(icon: Icon(Icons.bluetooth,color: Colors.black), onPressed: (){
                    _scaffoldKey.currentState.openEndDrawer();
                  })
                ],
              ),

              Text('M7',style: TextStyle(fontSize: height/26,fontWeight: FontWeight.bold),),
              Flexible(child: FractionallySizedBox(widthFactor: 0.30,heightFactor: 0.30,child: Image.asset("assets/m73.png"))),
              Flexible(child: FractionallySizedBox(heightFactor: 0.50,)),
              Flexible(
                fit: FlexFit.tight, /// must check if error comes
                child: FractionallySizedBox(
                  widthFactor: 0.90,
                  heightFactor: 0.70,
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                      customWidths: CustomSliderWidths(
                          progressBarWidth: 2,
                          trackWidth: 5,
                          handlerSize: 15
                      ),
                      customColors: CustomSliderColors(
                        dotColor: Colors.green,
                        progressBarColor: Colors.grey,
                        trackColor: Colors.grey,
                      ),
                    ),
                    onChange: (double value){
                      ///TODO:
                    },
                  ),
                ),
              ),

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(icon: Icon(Icons.skip_previous,size: height/20,), onPressed: (){}),
                    IconButton(icon: Icon(play?Icons.play_circle_outline:Icons.pause_circle_outline,size: height/20,), onPressed: (){
                      setState(() {
                        play = play == true?false:true;
                      });
                    }),
                    IconButton(icon: Icon(Icons.skip_next,size: height/20,), onPressed: (){}),
                  ]
              ),

            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Center(
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: width/10,
                        child: Icon(
                            Icons.account_circle,
                            size: 65,
                            color: Colors.green),
                        backgroundColor: Colors.white,),
                      title:signIn==true? Text("Seerat Afreen"):
                      GestureDetector(child: Text('Sign in' ,style: TextStyle(color: Colors.black),),
                        onTap: (){
                          setState(() {
                            signIn = signIn==true? false: true;
                          });
                        },)
                  ),
                )),
            Divider(height: 1,color: Colors.black,thickness: height/120,),
            ListView.builder(
                controller: drawerDevices,
                padding: EdgeInsets.only(left: width/13,top: height/11),
                itemExtent: height/15,
                shrinkWrap: true,
                itemCount: drawerItems.length,
                itemBuilder: (context,index){
                  return Center(child: Text(drawerItems[index],style: TextStyle(fontWeight: FontWeight.bold),));
                }
            ),
            Divider(indent: width/7,endIndent: width/7,height: height/5,color: Colors.black,thickness: height/250,),
            Center(child: Text('App Version')),
            Center(child: Text('1.0.0'))

          ],

        ),
      ),
      endDrawer: FractionallySizedBox(
        widthFactor: 0.70,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 300,top: 80,right: 30 ),
          child: Drawer(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width/20),

              ),
              child: ListView(
                children: [
                  Center(child: Text('Available Speakers',style: TextStyle(fontSize: height/40,color: Colors.green),)),
                  Divider(thickness: 2,height: 40,),
                  ListView.builder(
                      controller: drawerDevices,
                      padding: EdgeInsets.only(left: width/13,top: height/11),
                      itemExtent: height/15,
                      shrinkWrap: true,
                      itemCount: availableSpeakers.length,
                      itemBuilder: (context,index){
                        return Text(availableSpeakers[index]);
                      }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );*/ /*

  }
}*/

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:knob/knob.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'AvailableSpeakers.dart';

ScrollController drawerDevices = ScrollController();

class FinalScreen extends StatefulWidget {
/*  final BluetoothDevice server;

  const FinalScreen({this.server});*/

  @override
  _FinalScreenState  createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  /*BluetoothConnection connection;
  bool isConnecting = true;
  bool get isConnected => connection != null && connection.isConnected;
  bool isDisconnecting = false;*/

  bool signIn = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List drawerItems = ['About','My Music', 'Privacy Policy', 'Warrenty Claim'];
  AudioPlayer _audioPlayer = AudioPlayer();
  AudioPlayer advancedPlayer = new AudioPlayer();
  bool isPlaying = false;
  String currentTime = "00:00";
  String completeTime= "00:00";

  double _value = 0.0;
  void _setValue(double value) => setState(() => _value = value);
  static const double minValue = 0;
  static const double maxValue = 10;


  bool showchild = false;
  /*@override
  void initState() {
    super.initState();

    BluetoothConnection.toAddress(widget.server.address).then((_connection) {
      print('Connected to the device');
      connection = _connection;
      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });

      */
  /*connection.input.listen(_onDataReceived).onDone(() {
        // Example: Detect which side closed the connection
        // There should be `isDisconnecting` flag to show are we are (locally)
        // in middle of disconnecting process, should be set before calling
        // `dispose`, `finish` or `close`, which all causes to disconnect.
        // If we except the disconnection, `onDone` should be fired as result.
        // If we didn't except this (no flag set), it means closing by remote.
        if (isDisconnecting) {
          print('Disconnecting locally!');
        } else {
          print('Disconnected remotely!');
        }
        if (this.mounted) {
          setState(() {});
        }
      });*/
  /*
    }).catchError((error) {
      print('Cannot connect, exception occured');
      print(error);
    });
  }*/

  /*@override
  void dispose() {
    // Avoid memory leak (`setState` after dispose) and disconnect
    if (isConnected) {
      isDisconnecting = true;
      connection.dispose();
      connection = null;
    }

    super.dispose();
  }
*/

  void initState() {
    // TODO: implement initState
    super.initState();

    _audioPlayer.onAudioPositionChanged.listen((Duration duration){
      setState(() {
        currentTime = duration.toString().split(".")[0];
      });
    });

    _audioPlayer.onDurationChanged.listen((Duration duration){
      setState(() {
        completeTime = duration.toString().split(".")[0];
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
          top: false,
          child: Container(
            decoration: BoxDecoration(
              image:  DecorationImage(
                  image: AssetImage('assets/backcrop.jpg',),
                  fit: BoxFit.cover
              ),
            ),
            child: Column(
              children: <Widget>[
                showchild?
                AnimatedContainer(
                  duration: Duration(seconds: 10),
                  curve: Curves.easeIn,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(icon: Icon(Icons.menu,color: Colors.black,),onPressed: (){
                      _scaffoldKey.currentState.openDrawer();
                    },),
                    actions: [
                      IconButton(icon: Icon(Icons.bluetooth,color: Colors.black), onPressed: (){
                        _scaffoldKey.currentState.openEndDrawer();
                      })
                    ],
                  ),
                ):Container(),
                showchild?
                Text('M7',style: TextStyle(fontSize: size.width/13,fontWeight: FontWeight.bold),):Container(),
                TweenAnimationBuilder(
                    onEnd: (){setState(() {
                      showchild=true;
                    });},
                    curve: Curves.bounceIn,
                    tween: Tween<double>(begin: size.height,end: size.height/8),
                    duration: Duration(seconds: 1),
                    builder: (BuildContext context,dynamic value, Widget child){
                      return Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            Container(child: Image.asset('assets/m73.png',),height: value,),
                          ],
                        ),
                      );
                    }
                ),
                /*showchild?
                Container():Text('Connected'),*/
                showchild?
                Container(
                  child: Expanded(
                    child: Column(
                      children: [
                        Flexible(child: FractionallySizedBox(heightFactor: 0.3,)),
                        SleekCircularSlider(
                          appearance: CircularSliderAppearance(
                            size: size.height/3.5,
                            customWidths: CustomSliderWidths(
                                progressBarWidth: 2,
                                trackWidth: 5,
                                handlerSize: 15
                            ),
                            customColors: CustomSliderColors(
                              dotColor: Colors.green,
                              progressBarColor: Colors.grey,
                              trackColor: Colors.grey,
                            ),
                          ),
                          onChange: (double value){
                            ///TODO:
                          },
                        ),

                        /*Align(
                                        heightFactor: 0.1,
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              IconButton(icon: Icon(isPlaying?Icons.play_circle_outline:Icons.pause_circle_outline,size: size.height/15,), onPressed: (){
                                                if(isPlaying){
                                                  _audioPlayer.pause();
                                                  *//*_audioPlayer.stop();*//*

                                                  setState(() {
                                                    isPlaying = false;
                                                  });
                                                }else{
                                                  _audioPlayer.resume();

                                                  setState(() {
                                                    isPlaying = true;
                                                  });
                                                }

                                              }),
                                              SizedBox(width: size.width/8,),

                                              IconButton(icon: Icon(Icons.stop,size: size.height/15,), onPressed: (){
                                                _audioPlayer.stop();
                                              }),
                                            ]
                                        ),
                                      ),*/
                      ],
                    ),
                  ),
                ):Container(),
                // Knob(                              // TODO use knob instead of circular slider
                //     radius: 100,
                //     dotRadius: 10,
                //     dotColor: Colors.green,
                //   ringColor: Colors.black,
                //   touchAble: true,
                // )
                /*Text('M7',style: TextStyle(fontSize: size.width/13,fontWeight: FontWeight.bold),),
                Image.asset("assets/m73.png",scale: 3.5),*/
                /*Flexible(child: FractionallySizedBox(heightFactor: 0.3,)),
                SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                    size: size.height/3.5,
                    customWidths: CustomSliderWidths(
                        progressBarWidth: 2,
                        trackWidth: 5,
                        handlerSize: 15
                    ),
                    customColors: CustomSliderColors(
                      dotColor: Colors.green,
                      progressBarColor: Colors.grey,
                      trackColor: Colors.grey,
                    ),
                  ),
                  onChange: (double value){
                    ///TODO:
                  },
                ),
                Align(
                  heightFactor: 0.1,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(icon: Icon(isPlaying?Icons.play_circle_outline:Icons.pause_circle_outline,size: size.height/15,), onPressed: (){
                          if(isPlaying){
                            _audioPlayer.pause();
                            *//*_audioPlayer.stop();*//*

                            setState(() {
                              isPlaying = false;
                            });
                          }else{
                            _audioPlayer.resume();

                            setState(() {
                              isPlaying = true;
                            });
                          }

                        }),
            SizedBox(width: size.width/8,),

            IconButton(icon: Icon(Icons.stop,size: size.height/15,), onPressed: (){
              _audioPlayer.stop();
            }),
                      ]
                  ),
                ),*/
              ],
            ),

          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.audiotrack),
        onPressed: () async{
          ///TODO: MUST IMPLEMENT IOS DEPENDENCY AS AUDIO PLAYERS PACKAGE
          String filePath = await FilePicker.getFilePath();

          int status = await _audioPlayer.play(filePath, isLocal: true);
          /* await _audioPlayer.setReleaseMode(ReleaseMode.LOOP);*/ //LOOP: will never release; after completed, it will start playing again on loop.

          if(status == 1){
            setState(() {
              isPlaying = true;
            });
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Center(
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: size.width/10,
                        child: Icon(
                            Icons.account_circle,
                            size: 65,
                            color: Colors.green),
                        backgroundColor: Colors.white,),
                      title:signIn==true? Text("Seerat Afreen"):
                      GestureDetector(child: Text('Sign in' ,style: TextStyle(color: Colors.black),),
                        onTap: (){
                          setState(() {
                            signIn = signIn==true? false: true;
                          });
                        },)
                  ),
                )),
            Divider(height: 1,color: Colors.black,thickness: size.height/120,),
            ListView.builder(
                controller: drawerDevices,
                padding: EdgeInsets.only(left:size. width/13,top: size.height/11),
                itemExtent: size.height/15,
                shrinkWrap: true,
                itemCount: drawerItems.length,
                itemBuilder: (context,index){
                  return Center(child: Text(drawerItems[index],style: TextStyle(fontWeight: FontWeight.bold),));
                }
            ),
            Divider(indent:size.width/7,endIndent: size.width/7,height: size.height/5,color: Colors.black,thickness: size.height/250,),
            Center(child: Text('App Version')),
            Center(child: Text('1.0.0'))

          ],

        ),
      ),
      endDrawer: FractionallySizedBox(
        widthFactor: 0.70,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 300,top: 80,right: 30 ),
          child: Drawer(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width/20),

              ),
              child: ListView(
                children: [
                  Center(child: Text('Available Speakers',style: TextStyle(fontSize: size.height/40,color: Colors.green),)),
                  Divider(thickness: 2,height: 40,),
                  ListView.builder(
                      controller: drawerDevices,
                      padding: EdgeInsets.only(left: size.width/13,top: size.height/11),
                      itemExtent:size.height/15,
                      shrinkWrap: true,
                      itemCount: availableSpeakers.length,
                      itemBuilder: (context,index){
                        return Text(availableSpeakers[index]);
                      }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

    /*return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image:  DecorationImage(
                image: AssetImage('assets/backcrop.jpg',),
                fit: BoxFit.cover
            ),
          ),
          child: Column(

            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(icon: Icon(Icons.menu,color: Colors.black,),onPressed: (){
                  _scaffoldKey.currentState.openDrawer();
                },),
                actions: [
                  IconButton(icon: Icon(Icons.bluetooth,color: Colors.black), onPressed: (){
                    _scaffoldKey.currentState.openEndDrawer();
                  })
                ],
              ),

              Text('M7',style: TextStyle(fontSize: height/26,fontWeight: FontWeight.bold),),
              Flexible(child: FractionallySizedBox(widthFactor: 0.30,heightFactor: 0.30,child: Image.asset("assets/m73.png"))),
              Flexible(child: FractionallySizedBox(heightFactor: 0.50,)),
              Flexible(
                fit: FlexFit.tight, /// must check if error comes
                child: FractionallySizedBox(
                  widthFactor: 0.90,
                  heightFactor: 0.70,
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                      customWidths: CustomSliderWidths(
                          progressBarWidth: 2,
                          trackWidth: 5,
                          handlerSize: 15
                      ),
                      customColors: CustomSliderColors(
                        dotColor: Colors.green,
                        progressBarColor: Colors.grey,
                        trackColor: Colors.grey,
                      ),
                    ),
                    onChange: (double value){
                      ///TODO:
                    },
                  ),
                ),
              ),

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(icon: Icon(Icons.skip_previous,size: height/20,), onPressed: (){}),
                    IconButton(icon: Icon(play?Icons.play_circle_outline:Icons.pause_circle_outline,size: height/20,), onPressed: (){
                      setState(() {
                        play = play == true?false:true;
                      });
                    }),
                    IconButton(icon: Icon(Icons.skip_next,size: height/20,), onPressed: (){}),
                  ]
              ),

            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Center(
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: width/10,
                        child: Icon(
                            Icons.account_circle,
                            size: 65,
                            color: Colors.green),
                        backgroundColor: Colors.white,),
                      title:signIn==true? Text("Seerat Afreen"):
                      GestureDetector(child: Text('Sign in' ,style: TextStyle(color: Colors.black),),
                        onTap: (){
                          setState(() {
                            signIn = signIn==true? false: true;
                          });
                        },)
                  ),
                )),
            Divider(height: 1,color: Colors.black,thickness: height/120,),
            ListView.builder(
                controller: drawerDevices,
                padding: EdgeInsets.only(left: width/13,top: height/11),
                itemExtent: height/15,
                shrinkWrap: true,
                itemCount: drawerItems.length,
                itemBuilder: (context,index){
                  return Center(child: Text(drawerItems[index],style: TextStyle(fontWeight: FontWeight.bold),));
                }
            ),
            Divider(indent: width/7,endIndent: width/7,height: height/5,color: Colors.black,thickness: height/250,),
            Center(child: Text('App Version')),
            Center(child: Text('1.0.0'))

          ],

        ),
      ),
      endDrawer: FractionallySizedBox(
        widthFactor: 0.70,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 300,top: 80,right: 30 ),
          child: Drawer(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width/20),

              ),
              child: ListView(
                children: [
                  Center(child: Text('Available Speakers',style: TextStyle(fontSize: height/40,color: Colors.green),)),
                  Divider(thickness: 2,height: 40,),
                  ListView.builder(
                      controller: drawerDevices,
                      padding: EdgeInsets.only(left: width/13,top: height/11),
                      itemExtent: height/15,
                      shrinkWrap: true,
                      itemCount: availableSpeakers.length,
                      itemBuilder: (context,index){
                        return Text(availableSpeakers[index]);
                      }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );*/

  }
}