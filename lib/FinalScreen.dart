// /*
// import 'package:audioplayers/audioplayers.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:sleek_circular_slider/sleek_circular_slider.dart';
//
// import 'AvailableSpeakers.dart';
//
// ScrollController drawerDevices = ScrollController();
//
// class FinalScreen extends StatefulWidget {
//   @override
//   _FinalScreenState  createState() => _FinalScreenState();
// }
//
// class _FinalScreenState extends State<FinalScreen> {
//
//   bool signIn = false;
//   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   List drawerItems = ['About','My Music', 'Privacy Policy', 'Warrenty Claim'];
//   AudioPlayer _audioPlayer = AudioPlayer();
//   AudioPlayer advancedPlayer = new AudioPlayer();
//   bool isPlaying = false;
//   String currentTime = "00:00";
//   String completeTime= "00:00";
//
//   bool showchild = false;
//
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     _audioPlayer.onAudioPositionChanged.listen((Duration duration){
//       setState(() {
//         currentTime = duration.toString().split(".")[0];
//       });
//     });
//
//     _audioPlayer.onDurationChanged.listen((Duration duration){
//       setState(() {
//         completeTime = duration.toString().split(".")[0];
//       });
//     });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       key: _scaffoldKey,
//       body: SafeArea(
//           top: false,
//           child: Container(
//             decoration: BoxDecoration(
//               image:  DecorationImage(
//                   image: AssetImage('assets/backcrop.jpg',),
//                   fit: BoxFit.cover
//               ),
//             ),
//             child: Column(
//               children: <Widget>[
//                 showchild?
//                 AnimatedContainer(
//                   duration: Duration(seconds: 10),
//                   curve: Curves.easeIn,
//                   child: AppBar(
//                     backgroundColor: Colors.transparent,
//                     elevation: 0,
//                     leading: IconButton(icon: Icon(Icons.menu,color: Colors.black,),onPressed: (){
//                       _scaffoldKey.currentState.openDrawer();
//                     },),
//                     actions: [
//                       IconButton(icon: Icon(Icons.bluetooth,color: Colors.black), onPressed: (){
//                         _scaffoldKey.currentState.openEndDrawer();
//                       })
//                     ],
//                   ),
//                 ):Container(),
//                 showchild?
//                 Text('M7',style: TextStyle(fontSize: size.width/13,fontWeight: FontWeight.bold),):Container(),
//                 TweenAnimationBuilder(
//                     onEnd: (){setState(() {
//                       showchild=true;
//                     });},
//                     curve: Curves.bounceIn,
//                     tween: Tween<double>(begin: size.height,end: size.height/8),      // ToDo set the height so that other children can also have space
//                     duration: Duration(seconds: 1),
//                     builder: (BuildContext context,dynamic value, Widget child){
//                       return Align(
//                         alignment: Alignment.topCenter,
//                         child: Column(
//                           children: [
//                             Container(child: Image.asset('assets/m73.png',),height: value,),
//                           ],
//                         ),
//                       );
//                     }
//                 ),
//                 *//*showchild?
//                 Container():Text('Connected'),*//*
//                 showchild?
//                 Container(
//                   child: Expanded(
//                     child: Column(
//                       children: [
//                         Flexible(child: FractionallySizedBox(heightFactor: 0.3,)),
//                         SleekCircularSlider(
//                           appearance: CircularSliderAppearance(
//                             size: size.height/3.5,
//                             customWidths: CustomSliderWidths(
//                                 progressBarWidth: 2,
//                                 trackWidth: 5,
//                                 handlerSize: 15
//                             ),
//                             customColors: CustomSliderColors(
//                               dotColor: Colors.green,
//                               progressBarColor: Colors.grey,
//                               trackColor: Colors.grey,
//                             ),
//                           ),
//                           onChange: (double value){
//                             ///TODO:
//                           },
//                         ),
//                         *//*Align(
//                                         heightFactor: 0.1,
//                                         child: Row(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               IconButton(icon: Icon(isPlaying?Icons.play_circle_outline:Icons.pause_circle_outline,size: size.height/15,), onPressed: (){
//                                                 if(isPlaying){
//                                                   _audioPlayer.pause();
//                                                   *//**//*_audioPlayer.stop();*//**//*
//
//                                                   setState(() {
//                                                     isPlaying = false;
//                                                   });
//                                                 }else{
//                                                   _audioPlayer.resume();
//
//                                                   setState(() {
//                                                     isPlaying = true;
//                                                   });
//                                                 }
//
//                                               }),
//                                               SizedBox(width: size.width/8,),
//
//                                               IconButton(icon: Icon(Icons.stop,size: size.height/15,), onPressed: (){
//                                                 _audioPlayer.stop();
//                                               }),
//                                             ]
//                                         ),
//                                       ),*//*
//                       ],
//                     ),
//                   ),
//                 ):Container(),
//                 *//*Text('M7',style: TextStyle(fontSize: size.width/13,fontWeight: FontWeight.bold),),
//                 Image.asset("assets/m73.png",scale: 3.5),*//*
//                 *//*Flexible(child: FractionallySizedBox(heightFactor: 0.3,)),
//                 SleekCircularSlider(
//                   appearance: CircularSliderAppearance(
//                     size: size.height/3.5,
//                     customWidths: CustomSliderWidths(
//                         progressBarWidth: 2,
//                         trackWidth: 5,
//                         handlerSize: 15
//                     ),
//                     customColors: CustomSliderColors(
//                       dotColor: Colors.green,
//                       progressBarColor: Colors.grey,
//                       trackColor: Colors.grey,
//                     ),
//                   ),
//                   onChange: (double value){
//                     ///TODO:
//                   },
//                 ),
//                 Align(
//                   heightFactor: 0.1,
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         IconButton(icon: Icon(isPlaying?Icons.play_circle_outline:Icons.pause_circle_outline,size: size.height/15,), onPressed: (){
//                           if(isPlaying){
//                             _audioPlayer.pause();
//                             *//**//*_audioPlayer.stop();*/
// import 'dart:async';
// /**//*
//
//                             setState(() {
//                               isPlaying = false;
//                             });
//                           }else{
//                             _audioPlayer.resume();
//
//                             setState(() {
//                               isPlaying = true;
//                             });
//                           }
//
//                         }),
//             SizedBox(width: size.width/8,),
//
//             IconButton(icon: Icon(Icons.stop,size: size.height/15,), onPressed: (){
//               _audioPlayer.stop();
//             }),
//                       ]
//                   ),
//                 ),*//*
//               ],
//             ),
//
//           )
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.audiotrack),
//         onPressed: () async{
//           ///TODO: MUST IMPLEMENT IOS DEPENDENCY AS AUDIO PLAYERS PACKAGE
//           String filePath = await FilePicker.getFilePath();
//
//           int status = await _audioPlayer.play(filePath, isLocal: true);
//           *//* await _audioPlayer.setReleaseMode(ReleaseMode.LOOP);*//* //LOOP: will never release; after completed, it will start playing again on loop.
//
//           if(status == 1){
//             setState(() {
//               isPlaying = true;
//             });
//           }
//         },
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             DrawerHeader(
//                 child: Center(
//                   child: ListTile(
//                       leading: CircleAvatar(
//                         radius: size.width/10,
//                         child: Icon(
//                             Icons.account_circle,
//                             size: 65,
//                             color: Colors.green),
//                         backgroundColor: Colors.white,),
//                       title:signIn==true? Text("Seerat Afreen"):
//                       GestureDetector(child: Text('Sign in' ,style: TextStyle(color: Colors.black),),
//                         onTap: (){
//                           setState(() {
//                             signIn = signIn==true? false: true;
//                           });
//                         },)
//                   ),
//                 )),
//             Divider(height: 1,color: Colors.black,thickness: size.height/120,),
//             ListView.builder(
//                 controller: drawerDevices,
//                 padding: EdgeInsets.only(left:size. width/13,top: size.height/11),
//                 itemExtent: size.height/15,
//                 shrinkWrap: true,
//                 itemCount: drawerItems.length,
//                 itemBuilder: (context,index){
//                   return Center(child: Text(drawerItems[index],style: TextStyle(fontWeight: FontWeight.bold),));
//                 }
//             ),
//             Divider(indent:size.width/7,endIndent: size.width/7,height: size.height/5,color: Colors.black,thickness: size.height/250,),
//             Center(child: Text('App Version')),
//             Center(child: Text('1.0.0'))
//
//           ],
//
//         ),
//       ),
//       endDrawer: FractionallySizedBox(
//         widthFactor: 0.70,
//         child: Padding(
//           padding: const EdgeInsets.only(bottom: 300,top: 80,right: 30 ),
//           child: Drawer(
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(size.width/20),
//
//               ),
//               child: ListView(
//                 children: [
//                   Center(child: Text('Available Speakers',style: TextStyle(fontSize: size.height/40,color: Colors.green),)),
//                   Divider(thickness: 2,height: 40,),
//                   ListView.builder(
//                       controller: drawerDevices,
//                       padding: EdgeInsets.only(left: size.width/13,top: size.height/11),
//                       itemExtent:size.height/15,
//                       shrinkWrap: true,
//                       itemCount: availableSpeakers.length,
//                       itemBuilder: (context,index){
//                         return Text(availableSpeakers[index]);
//                       }
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//
//     *//*return Scaffold(
//       key: _scaffoldKey,
//       body: SafeArea(
//         child: Container(
//           decoration: BoxDecoration(
//             image:  DecorationImage(
//                 image: AssetImage('assets/backcrop.jpg',),
//                 fit: BoxFit.cover
//             ),
//           ),
//           child: Column(
//
//             children: [
//               AppBar(
//                 backgroundColor: Colors.transparent,
//                 elevation: 0,
//                 leading: IconButton(icon: Icon(Icons.menu,color: Colors.black,),onPressed: (){
//                   _scaffoldKey.currentState.openDrawer();
//                 },),
//                 actions: [
//                   IconButton(icon: Icon(Icons.bluetooth,color: Colors.black), onPressed: (){
//                     _scaffoldKey.currentState.openEndDrawer();
//                   })
//                 ],
//               ),
//
//               Text('M7',style: TextStyle(fontSize: height/26,fontWeight: FontWeight.bold),),
//               Flexible(child: FractionallySizedBox(widthFactor: 0.30,heightFactor: 0.30,child: Image.asset("assets/m73.png"))),
//               Flexible(child: FractionallySizedBox(heightFactor: 0.50,)),
//               Flexible(
//                 fit: FlexFit.tight, /// must check if error comes
//                 child: FractionallySizedBox(
//                   widthFactor: 0.90,
//                   heightFactor: 0.70,
//                   child: SleekCircularSlider(
//                     appearance: CircularSliderAppearance(
//                       customWidths: CustomSliderWidths(
//                           progressBarWidth: 2,
//                           trackWidth: 5,
//                           handlerSize: 15
//                       ),
//                       customColors: CustomSliderColors(
//                         dotColor: Colors.green,
//                         progressBarColor: Colors.grey,
//                         trackColor: Colors.grey,
//                       ),
//                     ),
//                     onChange: (double value){
//                       ///TODO:
//                     },
//                   ),
//                 ),
//               ),
//
//               Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(icon: Icon(Icons.skip_previous,size: height/20,), onPressed: (){}),
//                     IconButton(icon: Icon(play?Icons.play_circle_outline:Icons.pause_circle_outline,size: height/20,), onPressed: (){
//                       setState(() {
//                         play = play == true?false:true;
//                       });
//                     }),
//                     IconButton(icon: Icon(Icons.skip_next,size: height/20,), onPressed: (){}),
//                   ]
//               ),
//
//             ],
//           ),
//         ),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             DrawerHeader(
//                 child: Center(
//                   child: ListTile(
//                       leading: CircleAvatar(
//                         radius: width/10,
//                         child: Icon(
//                             Icons.account_circle,
//                             size: 65,
//                             color: Colors.green),
//                         backgroundColor: Colors.white,),
//                       title:signIn==true? Text("Seerat Afreen"):
//                       GestureDetector(child: Text('Sign in' ,style: TextStyle(color: Colors.black),),
//                         onTap: (){
//                           setState(() {
//                             signIn = signIn==true? false: true;
//                           });
//                         },)
//                   ),
//                 )),
//             Divider(height: 1,color: Colors.black,thickness: height/120,),
//             ListView.builder(
//                 controller: drawerDevices,
//                 padding: EdgeInsets.only(left: width/13,top: height/11),
//                 itemExtent: height/15,
//                 shrinkWrap: true,
//                 itemCount: drawerItems.length,
//                 itemBuilder: (context,index){
//                   return Center(child: Text(drawerItems[index],style: TextStyle(fontWeight: FontWeight.bold),));
//                 }
//             ),
//             Divider(indent: width/7,endIndent: width/7,height: height/5,color: Colors.black,thickness: height/250,),
//             Center(child: Text('App Version')),
//             Center(child: Text('1.0.0'))
//
//           ],
//
//         ),
//       ),
//       endDrawer: FractionallySizedBox(
//         widthFactor: 0.70,
//         child: Padding(
//           padding: const EdgeInsets.only(bottom: 300,top: 80,right: 30 ),
//           child: Drawer(
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(width/20),
//
//               ),
//               child: ListView(
//                 children: [
//                   Center(child: Text('Available Speakers',style: TextStyle(fontSize: height/40,color: Colors.green),)),
//                   Divider(thickness: 2,height: 40,),
//                   ListView.builder(
//                       controller: drawerDevices,
//                       padding: EdgeInsets.only(left: width/13,top: height/11),
//                       itemExtent: height/15,
//                       shrinkWrap: true,
//                       itemCount: availableSpeakers.length,
//                       itemBuilder: (context,index){
//                         return Text(availableSpeakers[index]);
//                       }
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );*/ /*
//
//   }
// }*/
//
// // import 'package:audioplayers/audioplayers.dart';
// // import 'package:file_picker/file_picker.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
// // import 'package:sleek_circular_slider/sleek_circular_slider.dart';
// //
// // import 'AvailableSpeakers.dart';
// //
// // ScrollController drawerDevices = ScrollController();
// //
// // class FinalScreen extends StatefulWidget {
// // /*  final BluetoothDevice server;
// //
// //   const FinalScreen({this.server});*/
// //
// //   @override
// //   _FinalScreenState  createState() => _FinalScreenState();
// // }
// //
// // class _FinalScreenState extends State<FinalScreen> {
// //   /*BluetoothConnection connection;
// //   bool isConnecting = true;
// //   bool get isConnected => connection != null && connection.isConnected;
// //   bool isDisconnecting = false;*/
// //
// //   bool signIn = false;
// //   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
// //   List drawerItems = ['About','My Music', 'Privacy Policy', 'Warrenty Claim'];
// //   AudioPlayer _audioPlayer = AudioPlayer();
// //   AudioPlayer advancedPlayer = new AudioPlayer();
// //   bool isPlaying = false;
// //   String currentTime = "00:00";
// //   String completeTime= "00:00";
// //
// //   double _value = 0.0;
// //   void _setValue(double value) => setState(() => _value = value);
// //   static const double minValue = 0;
// //   static const double maxValue = 10;
// //
// //
// //   bool showchild = false;
// //   /*@override
// //   void initState() {
// //     super.initState();
// //
// //     BluetoothConnection.toAddress(widget.server.address).then((_connection) {
// //       print('Connected to the device');
// //       connection = _connection;
// //       setState(() {
// //         isConnecting = false;
// //         isDisconnecting = false;
// //       });
// //
// //       */
// //   /*connection.input.listen(_onDataReceived).onDone(() {
// //         // Example: Detect which side closed the connection
// //         // There should be `isDisconnecting` flag to show are we are (locally)
// //         // in middle of disconnecting process, should be set before calling
// //         // `dispose`, `finish` or `close`, which all causes to disconnect.
// //         // If we except the disconnection, `onDone` should be fired as result.
// //         // If we didn't except this (no flag set), it means closing by remote.
// //         if (isDisconnecting) {
// //           print('Disconnecting locally!');
// //         } else {
// //           print('Disconnected remotely!');
// //         }
// //         if (this.mounted) {
// //           setState(() {});
// //         }
// //       });*/
// //   /*
// //     }).catchError((error) {
// //       print('Cannot connect, exception occured');
// //       print(error);
// //     });
// //   }*/
// //
// //   /*@override
// //   void dispose() {
// //     // Avoid memory leak (`setState` after dispose) and disconnect
// //     if (isConnected) {
// //       isDisconnecting = true;
// //       connection.dispose();
// //       connection = null;
// //     }
// //
// //     super.dispose();
// //   }
// // */
// //
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //
// //     _audioPlayer.onAudioPositionChanged.listen((Duration duration){
// //       setState(() {
// //         currentTime = duration.toString().split(".")[0];
// //       });
// //     });
// //
// //     _audioPlayer.onDurationChanged.listen((Duration duration){
// //       setState(() {
// //         completeTime = duration.toString().split(".")[0];
// //       });
// //     });
// //
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     Size size = MediaQuery.of(context).size;
// //
// //     return Scaffold(
// //       key: _scaffoldKey,
// //       body: SafeArea(
// //           top: false,
// //           child: Container(
// //             decoration: BoxDecoration(
// //               image:  DecorationImage(
// //                   image: AssetImage('assets/backcrop.jpg',),
// //                   fit: BoxFit.cover
// //               ),
// //             ),
// //             child: Column(
// //               children: <Widget>[
// //                 showchild?
// //                 AnimatedContainer(
// //                   duration: Duration(seconds: 10),
// //                   curve: Curves.easeIn,
// //                   child: AppBar(
// //                     backgroundColor: Colors.transparent,
// //                     elevation: 0,
// //                     leading: IconButton(icon: Icon(Icons.menu,color: Colors.black,),onPressed: (){
// //                       _scaffoldKey.currentState.openDrawer();
// //                     },),
// //                     actions: [
// //                       IconButton(icon: Icon(Icons.bluetooth,color: Colors.black), onPressed: (){
// //                         _scaffoldKey.currentState.openEndDrawer();
// //                       })
// //                     ],
// //                   ),
// //                 ):Container(),
// //                 showchild?
// //                 Text('M7',style: TextStyle(fontSize: size.width/13,fontWeight: FontWeight.bold),):Container(),
// //                 TweenAnimationBuilder(
// //                     onEnd: (){setState(() {
// //                       showchild=true;
// //                     });},
// //                     curve: Curves.bounceIn,
// //                     tween: Tween<double>(begin: size.height,end: size.height/8),
// //                     duration: Duration(seconds: 1),
// //                     builder: (BuildContext context,dynamic value, Widget child){
// //                       return Align(
// //                         alignment: Alignment.topCenter,
// //                         child: Column(
// //                           children: [
// //                             Container(child: Image.asset('assets/m73.png',),height: value,),
// //                           ],
// //                         ),
// //                       );
// //                     }
// //                 ),
// //                 /*showchild?
// //                 Container():Text('Connected'),*/
// //                 showchild?
// //                 Container(
// //                   child: Expanded(
// //                     child: Column(
// //                       children: [
// //                         Flexible(child: FractionallySizedBox(heightFactor: 0.3,)),
// //                         SleekCircularSlider(
// //                           appearance: CircularSliderAppearance(
// //                             size: size.height/3.5,
// //                             customWidths: CustomSliderWidths(
// //                                 progressBarWidth: 2,
// //                                 trackWidth: 5,
// //                                 handlerSize: 15
// //                             ),
// //                             customColors: CustomSliderColors(
// //                               dotColor: Colors.green,
// //                               progressBarColor: Colors.grey,
// //                               trackColor: Colors.grey,
// //                             ),
// //                           ),
// //                           onChange: (double value){
// //                             ///TODO:
// //                           },
// //                         ),
// //
// //                         /*Align(
// //                                         heightFactor: 0.1,
// //                                         child: Row(
// //                                             mainAxisAlignment: MainAxisAlignment.center,
// //                                             children: [
// //                                               IconButton(icon: Icon(isPlaying?Icons.play_circle_outline:Icons.pause_circle_outline,size: size.height/15,), onPressed: (){
// //                                                 if(isPlaying){
// //                                                   _audioPlayer.pause();
// //                                                   *//*_audioPlayer.stop();*//*
// //
// //                                                   setState(() {
// //                                                     isPlaying = false;
// //                                                   });
// //                                                 }else{
// //                                                   _audioPlayer.resume();
// //
// //                                                   setState(() {
// //                                                     isPlaying = true;
// //                                                   });
// //                                                 }
// //
// //                                               }),
// //                                               SizedBox(width: size.width/8,),
// //
// //                                               IconButton(icon: Icon(Icons.stop,size: size.height/15,), onPressed: (){
// //                                                 _audioPlayer.stop();
// //                                               }),
// //                                             ]
// //                                         ),
// //                                       ),*/
// //                       ],
// //                     ),
// //                   ),
// //                 ):Container(),
// //                 // Knob(                              // TODO use knob instead of circular slider
// //                 //     radius: 100,
// //                 //     dotRadius: 10,
// //                 //     dotColor: Colors.green,
// //                 //   ringColor: Colors.black,
// //                 //   touchAble: true,
// //                 // )
// //                 /*Text('M7',style: TextStyle(fontSize: size.width/13,fontWeight: FontWeight.bold),),
// //                 Image.asset("assets/m73.png",scale: 3.5),*/
// //                 /*Flexible(child: FractionallySizedBox(heightFactor: 0.3,)),
// //                 SleekCircularSlider(
// //                   appearance: CircularSliderAppearance(
// //                     size: size.height/3.5,
// //                     customWidths: CustomSliderWidths(
// //                         progressBarWidth: 2,
// //                         trackWidth: 5,
// //                         handlerSize: 15
// //                     ),
// //                     customColors: CustomSliderColors(
// //                       dotColor: Colors.green,
// //                       progressBarColor: Colors.grey,
// //                       trackColor: Colors.grey,
// //                     ),
// //                   ),
// //                   onChange: (double value){
// //                     ///TODO:
// //                   },
// //                 ),
// //                 Align(
// //                   heightFactor: 0.1,
// //                   child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         IconButton(icon: Icon(isPlaying?Icons.play_circle_outline:Icons.pause_circle_outline,size: size.height/15,), onPressed: (){
// //                           if(isPlaying){
// //                             _audioPlayer.pause();
// //                             *//*_audioPlayer.stop();*//*
// //
// //                             setState(() {
// //                               isPlaying = false;
// //                             });
// //                           }else{
// //                             _audioPlayer.resume();
// //
// //                             setState(() {
// //                               isPlaying = true;
// //                             });
// //                           }
// //
// //                         }),
// //             SizedBox(width: size.width/8,),
// //
// //             IconButton(icon: Icon(Icons.stop,size: size.height/15,), onPressed: (){
// //               _audioPlayer.stop();
// //             }),
// //                       ]
// //                   ),
// //                 ),*/
// //               ],
// //             ),
// //
// //           )
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         child: Icon(Icons.audiotrack),
// //         onPressed: () async{
// //
// //           ///TODO: MUST IMPLEMENT IOS DEPENDENCY AS AUDIO PLAYERS PACKAGE
// //           String filePath = await FilePicker.getFilePath();
// //
// //          //  Map<String,String> filesPaths = await FilePicker.getMultiFilePath(); // to pick multiple files of any format
// //          // // filesPaths = await FilePicker.getMultiFilePath(); // to pick multiple image files
// //          //
// //          //  List<String> allNames = filesPaths.keys; // List of file names
// //          //  List<String> allPaths = filesPaths.values; // List of paths
// //
// //           int status = await _audioPlayer.play(filePath, isLocal: true);
// //           /* await _audioPlayer.setReleaseMode(ReleaseMode.LOOP);*/ //LOOP: will never release; after completed, it will start playing again on loop.
// //
// //           if(status == 1){
// //             setState(() {
// //               isPlaying = true;
// //             });
// //           }
// //         },
// //       ),
// //       drawer: Drawer(
// //         child: ListView(
// //           children: [
// //             DrawerHeader(
// //                 child: Center(
// //                   child: ListTile(
// //                       leading: CircleAvatar(
// //                         radius: size.width/10,
// //                         child: Icon(
// //                             Icons.account_circle,
// //                             size: 65,
// //                             color: Colors.green),
// //                         backgroundColor: Colors.white,),
// //                       title:signIn==true? Text("Seerat Afreen"):
// //                       GestureDetector(child: Text('Sign in' ,style: TextStyle(color: Colors.black),),
// //                         onTap: (){
// //                           setState(() {
// //                             signIn = signIn==true? false: true;
// //                           });
// //                         },)
// //                   ),
// //                 )),
// //             Divider(height: 1,color: Colors.black,thickness: size.height/120,),
// //             ListView.builder(
// //                 controller: drawerDevices,
// //                 padding: EdgeInsets.only(left:size. width/13,top: size.height/11),
// //                 itemExtent: size.height/15,
// //                 shrinkWrap: true,
// //                 itemCount: drawerItems.length,
// //                 itemBuilder: (context,index){
// //                   return Center(child: Text(drawerItems[index],style: TextStyle(fontWeight: FontWeight.bold),));
// //                 }
// //             ),
// //             Divider(indent:size.width/7,endIndent: size.width/7,height: size.height/5,color: Colors.black,thickness: size.height/250,),
// //             Center(child: Text('App Version')),
// //             Center(child: Text('1.0.0'))
// //
// //           ],
// //
// //         ),
// //       ),
// //       endDrawer: FractionallySizedBox(
// //         widthFactor: 0.70,
// //         child: Padding(
// //           padding: const EdgeInsets.only(bottom: 300,top: 80,right: 30 ),
// //           child: Drawer(
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(size.width/20),
// //
// //               ),
// //               child: ListView(
// //                 children: [
// //                   Center(child: Text('Available Speakers',style: TextStyle(fontSize: size.height/40,color: Colors.green),)),
// //                   Divider(thickness: 2,height: 40,),
// //                   ListView.builder(
// //                       controller: drawerDevices,
// //                       padding: EdgeInsets.only(left: size.width/13,top: size.height/11),
// //                       itemExtent:size.height/15,
// //                       shrinkWrap: true,
// //                       itemCount: availableSpeakers.length,
// //                       itemBuilder: (context,index){
// //                         return Text(availableSpeakers[index]);
// //                       }
// //                   )
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //
// //     /*return Scaffold(
// //       key: _scaffoldKey,
// //       body: SafeArea(
// //         child: Container(
// //           decoration: BoxDecoration(
// //             image:  DecorationImage(
// //                 image: AssetImage('assets/backcrop.jpg',),
// //                 fit: BoxFit.cover
// //             ),
// //           ),
// //           child: Column(
// //
// //             children: [
// //               AppBar(
// //                 backgroundColor: Colors.transparent,
// //                 elevation: 0,
// //                 leading: IconButton(icon: Icon(Icons.menu,color: Colors.black,),onPressed: (){
// //                   _scaffoldKey.currentState.openDrawer();
// //                 },),
// //                 actions: [
// //                   IconButton(icon: Icon(Icons.bluetooth,color: Colors.black), onPressed: (){
// //                     _scaffoldKey.currentState.openEndDrawer();
// //                   })
// //                 ],
// //               ),
// //
// //               Text('M7',style: TextStyle(fontSize: height/26,fontWeight: FontWeight.bold),),
// //               Flexible(child: FractionallySizedBox(widthFactor: 0.30,heightFactor: 0.30,child: Image.asset("assets/m73.png"))),
// //               Flexible(child: FractionallySizedBox(heightFactor: 0.50,)),
// //               Flexible(
// //                 fit: FlexFit.tight, /// must check if error comes
// //                 child: FractionallySizedBox(
// //                   widthFactor: 0.90,
// //                   heightFactor: 0.70,
// //                   child: SleekCircularSlider(
// //                     appearance: CircularSliderAppearance(
// //                       customWidths: CustomSliderWidths(
// //                           progressBarWidth: 2,
// //                           trackWidth: 5,
// //                           handlerSize: 15
// //                       ),
// //                       customColors: CustomSliderColors(
// //                         dotColor: Colors.green,
// //                         progressBarColor: Colors.grey,
// //                         trackColor: Colors.grey,
// //                       ),
// //                     ),
// //                     onChange: (double value){
// //                       ///TODO:
// //                     },
// //                   ),
// //                 ),
// //               ),
// //
// //               Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     IconButton(icon: Icon(Icons.skip_previous,size: height/20,), onPressed: (){}),
// //                     IconButton(icon: Icon(play?Icons.play_circle_outline:Icons.pause_circle_outline,size: height/20,), onPressed: (){
// //                       setState(() {
// //                         play = play == true?false:true;
// //                       });
// //                     }),
// //                     IconButton(icon: Icon(Icons.skip_next,size: height/20,), onPressed: (){}),
// //                   ]
// //               ),
// //
// //             ],
// //           ),
// //         ),
// //       ),
// //       drawer: Drawer(
// //         child: ListView(
// //           children: [
// //             DrawerHeader(
// //                 child: Center(
// //                   child: ListTile(
// //                       leading: CircleAvatar(
// //                         radius: width/10,
// //                         child: Icon(
// //                             Icons.account_circle,
// //                             size: 65,
// //                             color: Colors.green),
// //                         backgroundColor: Colors.white,),
// //                       title:signIn==true? Text("Seerat Afreen"):
// //                       GestureDetector(child: Text('Sign in' ,style: TextStyle(color: Colors.black),),
// //                         onTap: (){
// //                           setState(() {
// //                             signIn = signIn==true? false: true;
// //                           });
// //                         },)
// //                   ),
// //                 )),
// //             Divider(height: 1,color: Colors.black,thickness: height/120,),
// //             ListView.builder(
// //                 controller: drawerDevices,
// //                 padding: EdgeInsets.only(left: width/13,top: height/11),
// //                 itemExtent: height/15,
// //                 shrinkWrap: true,
// //                 itemCount: drawerItems.length,
// //                 itemBuilder: (context,index){
// //                   return Center(child: Text(drawerItems[index],style: TextStyle(fontWeight: FontWeight.bold),));
// //                 }
// //             ),
// //             Divider(indent: width/7,endIndent: width/7,height: height/5,color: Colors.black,thickness: height/250,),
// //             Center(child: Text('App Version')),
// //             Center(child: Text('1.0.0'))
// //
// //           ],
// //
// //         ),
// //       ),
// //       endDrawer: FractionallySizedBox(
// //         widthFactor: 0.70,
// //         child: Padding(
// //           padding: const EdgeInsets.only(bottom: 300,top: 80,right: 30 ),
// //           child: Drawer(
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(width/20),
// //
// //               ),
// //               child: ListView(
// //                 children: [
// //                   Center(child: Text('Available Speakers',style: TextStyle(fontSize: height/40,color: Colors.green),)),
// //                   Divider(thickness: 2,height: 40,),
// //                   ListView.builder(
// //                       controller: drawerDevices,
// //                       padding: EdgeInsets.only(left: width/13,top: height/11),
// //                       itemExtent: height/15,
// //                       shrinkWrap: true,
// //                       itemCount: availableSpeakers.length,
// //                       itemBuilder: (context,index){
// //                         return Text(availableSpeakers[index]);
// //                       }
// //                   )
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );*/
// //
// //   }
// // }
//
// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/widgets.dart';
// // import 'package:flutter_file_manager/flutter_file_manager.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:path_provider_ex/path_provider_ex.dart';
// // import 'package:flutter/foundation.dart';
// // //import package files
// //
// //
// // class Storage {
// //   Future<String> get localPath async {
// //     final dir = await getApplicationDocumentsDirectory();
// //     return dir.path;
// //   }
// //
// //   Future<File> get localFile async {
// //     final path = await localPath;
// //     return File('$path/db.txt');
// //   }
// //
// //   Future<String> readData() async {
// //     try {
// //       final file = await localFile;
// //       print(File);
// //       String body = await file.readAsString();
// //
// //       return body;
// //     } catch (e) {
// //       return e.toString();
// //     }
// //   }
// //
// //   Future<File> writeData(String data) async {
// //     final file = await localFile;
// //     return file.writeAsString("$data");
// //   }
// // }
// // //apply this class on home: attribute at MaterialApp()
// // class MyAudioList extends StatefulWidget{
// //   final Storage storage;
// //   MyAudioList({Key key, @required this.storage}) : super(key: key);
// //   @override
// //   State<StatefulWidget> createState() {
// //     return _MyAudioList(); //create state
// //   }
// // }
// //
// // class _MyAudioList extends State<MyAudioList>{
// //   var files;
// //
// //   void getFiles() async { //asyn function to get list of files
// //     List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
// //     var root = storageInfo[1].rootDir; //storageInfo[1] for SD card, geting the root directory
// //     var fm = FileManager(root: Directory(root)); //
// //     files = await fm.filesTree(
// //         excludedPaths: ["/storage/emulated/0/Android"],
// //         extensions: ["mp3"] //optional, to filter files, list only mp3 files
// //     );
// //     setState(() {}); //update the UI
// //   }
// //   Future<Directory> _appDocDir;
// //
// //   @override
// //   void initState() {
// //     // getFiles(); //call getFiles() function on initial state.
// //     super.initState();
// //   }
// //   void getAppDirectory() {
// //     setState(() {
// //       _appDocDir = getApplicationDocumentsDirectory();
// //       print(widget.storage.localPath);
// //       print(widget.storage.localFile);
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //             title:Text("Audio File list from Storage"),
// //             backgroundColor: Colors.redAccent
// //         ),
// //         body:  FutureBuilder<Directory>(
// //           future: _appDocDir,
// //           builder:
// //               (BuildContext context, AsyncSnapshot<Directory> snapshot) {
// //             Text text = Text('');
// //             if (snapshot.connectionState == ConnectionState.done) {
// //               if (snapshot.hasError) {
// //                 text = Text('Error: ${snapshot.error}');
// //               } else if (snapshot.hasData) {
// //                 text = Text('Path: ${snapshot.data.path}');
// //               } else {
// //                 text = Text('Unavailable');
// //               }
// //             }
// //             return new Container(
// //               child: text,
// //             );
// //           },
// //         ),
// //         floatingActionButton: FloatingActionButton(
// //         child: Icon(Icons.audiotrack),
// //           onPressed: (){
// //           getAppDirectory();
// //           },
// //     ),
// //         // body:files == null? Text("Searching Files"):
// //         // ListView.builder(  //if file/folder list is grabbed, then show here
// //         //   itemCount: files?.length ?? 0,
// //         //   itemBuilder: (context, index) {
// //         //     return Card(
// //         //         child:ListTile(
// //         //           title: Text(files[index].path.split('/').last),
// //         //           leading: Icon(Icons.audiotrack),
// //         //           trailing: Icon(Icons.play_arrow, color: Colors.redAccent,),
// //         //           onTap: (){
// //         //             // you can add Play/push code over here
// //         //           },
// //         //         )
// //         //     );
// //         //   },
// //         // )
// //     );
// //   }
// // }
//
//
//
// import 'dart:io';
//
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/foundation.dart';
//
//
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// /*
// class FilePickerDemo extends StatefulWidget {
//   @override
//   _FilePickerDemoState createState() => _FilePickerDemoState();
// }
//
// class _FilePickerDemoState extends State<FilePickerDemo> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   String _fileName;
//   var files;
//   List _paths;
//   String _directoryPath;
//   String _extension;
//   bool _loadingPath = false;
//   bool _multiPick = false;
//   FileType _pickingType = FileType.audio;
//   TextEditingController _controller = TextEditingController();
//   Future<Directory> _appDocDir;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(() => _extension = _controller.text);
//   }
//
//   void _openFileExplorer() async {
//     setState(() => _loadingPath = true);
//     try {
//
//       _paths = (await FilePicker.getMultiFile(
//         type: _pickingType,
//         allowedExtensions: (_extension?.isNotEmpty ?? false)
//             ? _extension?.replaceAll(' ', '')?.split(',')
//             : null,
//       ));
//           ;
//     } on PlatformException catch (e) {
//       print("Unsupported operation" + e.toString());
//     } catch (ex) {
//       print(ex);
//     }
//     if (!mounted) return;
//     setState(() {
//       _loadingPath = false;
//       _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
//     });
//   }
//
//   void _clearCachedFiles() {
//     FilePicker.clearTemporaryFiles().then((result) {
//       _scaffoldKey.currentState.showSnackBar(
//         SnackBar(
//           backgroundColor: result ? Colors.green : Colors.red,
//           content: Text((result
//               ? 'Temporary files removed with success.'
//               : 'Failed to clean temporary files')),
//         ),
//       );
//     });
//   }
//
//   void _selectFolder() {
//     FilePicker.getDirectoryPath().then((value) {
//       setState(() {
//         _directoryPath = value;
//
//
//       });
//     });
//   }
//   void getFiles() async { //asyn function to get list of files
//      List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
//      var root = storageInfo[1].rootDir; //storageInfo[1] for SD card, geting the root directory
//      var fm = FileManager(root: Directory(root)); //
//      files = await fm.filesTree(
//          excludedPaths: ["/storage/emulated/0/Android"],
//          extensions: ["mp3"] //optional, to filter files, list only mp3 files
//      );
//      setState(() {}); //update the UI
//    }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         key: _scaffoldKey,
//         appBar: AppBar(
//           title: const Text('File Picker example app'),
//         ),
//         body: Center(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20.0),
//                       child: DropdownButton(
//                           hint: const Text('LOAD PATH FROM'),
//                           value: _pickingType,
//                           items: <DropdownMenuItem>[
//                             DropdownMenuItem(
//                               child: const Text('FROM AUDIO'),
//                               value: FileType.audio,
//                             ),
//                             DropdownMenuItem(
//                               child: const Text('FROM IMAGE'),
//                               value: FileType.image,
//                             ),
//                             DropdownMenuItem(
//                               child: const Text('FROM VIDEO'),
//                               value: FileType.video,
//                             ),
//                             DropdownMenuItem(
//                               child: const Text('FROM MEDIA'),
//                               value: FileType.media,
//                             ),
//                             DropdownMenuItem(
//                               child: const Text('FROM ANY'),
//                               value: FileType.any,
//                             ),
//                             DropdownMenuItem(
//                               child: const Text('CUSTOM FORMAT'),
//                               value: FileType.custom,
//                             ),
//                           ],
//                           onChanged: (value) => setState(() {
//                             _pickingType = value;
//                             if (_pickingType != FileType.custom) {
//                               _controller.text = _extension = '';
//                             }
//                           })),
//                     ),
//                     ConstrainedBox(
//                       constraints: const BoxConstraints.tightFor(width: 100.0),
//                       child: _pickingType == FileType.custom
//                           ? TextFormField(
//                         maxLength: 15,
//                         autovalidateMode: AutovalidateMode.always,
//                         controller: _controller,
//                         decoration:
//                         InputDecoration(labelText: 'File extension'),
//                         keyboardType: TextInputType.text,
//                         textCapitalization: TextCapitalization.none,
//                       )
//                           : const SizedBox(),
//                     ),
//                     ConstrainedBox(
//                       constraints: const BoxConstraints.tightFor(width: 200.0),
//                       child: SwitchListTile.adaptive(
//                         title:
//                         Text('Pick multiple files', textAlign: TextAlign.right),
//                         onChanged: (bool value) =>
//                             setState(() => _multiPick = value),
//                         value: _multiPick,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
//                       child: Column(
//                         children: <Widget>[
//                           ElevatedButton(
//                             onPressed: () => _openFileExplorer(),
//                             child: const Text("Open file picker"),
//                           ),
//                           ElevatedButton(
//                             onPressed: () => _selectFolder(),
//                             child: const Text("Pick folder"),
//                           ),
//                           ElevatedButton(
//                             onPressed: () => _clearCachedFiles(),
//                             child: const Text("Clear temporary files"),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     Builder(
//                       builder: (BuildContext context) =>_directoryPath != null
//                           ? ListTile(
//                         title: const Text('Directory path'),
//                         subtitle: Text(_directoryPath),
//                       )
//                           : _paths != null
//                           ? Container(
//                         padding: const EdgeInsets.only(bottom: 30.0),
//                         height:
//                         MediaQuery.of(context).size.height * 0.50,
//                         child: Scrollbar(
//                             child: ListView.separated(
//                               itemCount:
//                               _paths != null && _paths.isNotEmpty
//                                   ? _paths.length
//                                   : 1,
//                               itemBuilder:
//                                   (BuildContext context, int index) {
//                                 final bool isMultiPath =
//                                     _paths != null && _paths.isNotEmpty;
//                                 final String name = 'File $index: ' +
//                                     (isMultiPath
//                                         ? _paths
//                                         .map((e) => e.name)
//                                         .toList()[index]
//                                         : _fileName ?? '...');
//                                 final path = _paths
//                                     .map((e) => e.path)
//                                     .toList()[index]
//                                     .toString();
//
//                                 return ListTile(
//                                   title: Text(
//                                     name,
//                                   ),
//                                   subtitle: Text(path),
//                                 );
//                               },
//                               separatorBuilder:
//                                   (BuildContext context, int index) =>
//                               const Divider(),
//                             )),
//                       )
//                           : const SizedBox(),
//                     ),
//                   ],
//                 ),
//               ),
//             )),
//       ),
//     );
//   }
// }
// */
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/foundation.dart';
//
// import 'package:path_provider/path_provider.dart';
//
// // class CharacteristList extends StatefulWidget {
// //   @override
// //   _CharacteristListState createState() => new _CharacteristListState();
// // }
// // class _CharacteristListState extends State<CharacteristList> {
// //   List<String> filesList = new List<String>();
// //   List<String> filesL = new List<String>();
// //   @override
// //   void initState() {
// //     super.initState();
// //     filesList = [];
// //   }
// //   Future<List<String>> _getFilesFromDir() async{
// //     filesL = await FilesInDirectory().getFilesFromDir();
// //     setState(() {
// //       filesList = filesL;
// //     });
// //     return filesList;
// //   }
// //   _getFilesCount(){
// //     _getFilesFromDir();
// //     int count = filesList.length;
// //     return count;
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return new Scaffold(
// //         appBar: new AppBar(
// //         title: const Text('Список документов'),
// //     ),
// //     body: new Column(
// //     children: <Widget>[
// //     new Expanded(
// //     child: new ListView.builder(
// //     //TODO не успевает сформировать список файлов
// //     itemCount: _getFilesCount(),
// //     itemBuilder: (context, index){
// //     return new CharacteristListItem(filesList[index]);
// //     },
// //     ),
// //     ),
// //     ],
// //     ),
//
//
// import 'dart:io' as io;
//
// import 'package:path_provider_ex/path_provider_ex.dart';
//
//
// class FinalScreen extends StatefulWidget {
//   @override
//   _FinalScreenState createState() => _FinalScreenState();
// }
//
// class _FinalScreenState extends State<FinalScreen> {
//   String directory;
//   String _directoryPath;
//   Directory _directoryPathdir = Directory('/storage/emulated/0/Android');
//   Directory _directoryfolder;
//    List<FileSystemEntity> songsList;
//  /* List songsList;*/
//   AudioPlayer _audioPlayer = AudioPlayer();
//   String exactSong;
//   Map<String, String> paths;
//   void _openFileExplorer() async {
//
//     try {
//
//         paths = await FilePicker.getMultiFilePath(type: FileType.audio,);
//         print("pathsvalue${paths.values}");
//         await _audioPlayer.play("/data/user/0/io.github.edufolly.flutterbluetoothserialexample/cache/file_picker/Teri_Jhuki_Nazar_(Film_Version)(MyMp3Song).mp3", isLocal: true);
//
//     }
//
//     on PlatformException catch (e) {
//       print("Unsupported operation" + e.toString());
//     }
//   }
//
//
//   void initlist() async {
//     Directory dir = await getExternalStorageDirectory();
//     songsList = dir.listSync(recursive: true, followLinks: false);
//     print("directoryyy$dir");
//     print("seerattt$songsList");
//   }
//   void _selectFolder() async{
//    /* File file =await FilePicker.getFile(type: FileType.audio);
//     Directory fileDir = file.parent;*/
//     Directory fileDir = _directoryPathdir;
//
//     List sogs =fileDir.listSync(recursive: true, followLinks: false);
//    /* await _audioPlayer.play(file.path, isLocal: true);*/
//
//    /* print("file $file");*/
//     print("fileDirectory $fileDir");
//     print("sogslist ${sogs}");
//    /* FilePicker.getDirectoryPath().then((value)async {
//       setState(() {
//         _directoryPath = value;
//         _directoryPathdir = Directory(_directoryPath);
//
//       });
//       List sogs =_directoryPathdir.listSync(recursive: true, followLinks: false);
//       setState(() {
//         exactSong = sogs[5];
//       });
//       await _audioPlayer.play(filePath, isLocal: true);
//
//       print(_directoryPath);
//       print("filepathss $filePath");
//      *//* print("allsongs${sogs}");
//       print("seeratafree${sogs[5]}");*//*
//     });*/
//
//   }
//   void getFiles() async { //asyn function to get list of files
//     List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
//     var root = storageInfo[1].appFilesDir; //storageInfo[1] for SD card, geting the root directory
//
//     print("rootdir $root");
//     print("storage ${storageInfo[1].rootDir}");
//     /*var fm = FileManager(root: Directory(root)); //
//     files = await fm.filesTree(
//         excludedPaths: ["/storage/emulated/0/Android"],
//         extensions: ["mp3"] //optional, to filter files, list only mp3 files
//     );*/
//     setState(() {}); //update the UI
//   }
//
//
//   void _selectFolderr() {
//      FilePicker.getDirectoryPath().then((value) {
//        setState(() {
//          _directoryPath =value;
//        });
//        _directoryfolder = Directory(_directoryPath);
//        print("directoryyy $_directoryPath");
//        print(_directoryPath);
//      });
//     var songList  =  _directoryfolder.listSync().map((item) => item.path).toList(growable: false);
//     print("songslist$songList");
//    }
//   @override
//   void initState(){
//     // TODO: implement initState
//     super.initState();
//    _listofFiles();
//
//
//     /*Future<List<io.File>> files =  FilePicker.getMultiFile(type: FileType.audio);
//      print("SEERATSEERATaFREEN$files");*/
//
//   }
//
// // Make New Function /// only use for android , no support for ios
//   /* void _listofFiles() async {
//      directory = (await getApplicationDocumentsDirectory()).path;
//      setState(() {
//        file = io.Directory("$directory/").listSync();  //use your folder name insted of resume.
//      });
//      var systemTempDir= io.Directory.systemTemp;
//      systemTempDir.list(recursive:  true, followLinks: false).listen((io.FileSystemEntity entity) {print(entity.path);});
//    print("directoryyy $directory");
//      print("filesss $file");
//    }*/
//
// // Build Part
//    void _listofFiles() async {
//      Directory gettemp = (await getExternalStorageDirectory());
//      setState(() {
//        songsList = Directory("$directory").listSync();  //use your folder name insted of resume.
//      });
//    print("directoryyy $_directoryfolder");
//    print("songsList $songsList");
//
//      // print("filesss $file");
//    }
//   @override
//   Widget build(BuildContext context) {
//
//     /* if (songsList.length > 0) {*/
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Xender Images"),
//         ),
//
//     //     body: if(songsList>0)
//     // {
//     //   child: Container(
//     //
//     //     padding: EdgeInsets.only(bottom: 60.0),
//     //     child: ListView.builder(
//     //       padding: const EdgeInsets.all(8.0),
//     //       itemCount: songsList.length,
//     //       itemBuilder: (context, index) {
//     //         String imgPath = songsList
//     //             .elementAt(index)
//     //             .path;
//     //         return Material(
//     //             elevation: 8.0,
//     //             borderRadius: BorderRadius.all(Radius.circular(8)),
//     //             child: Text(imgPath)
//     //         );
//     //       },),)
//     // },
//     // else {
//     // child: Container(
//     // padding: EdgeInsets.only(bottom: 60.0),
//     // child: Text("Sorry, No Images Where Found.", style: TextStyle(
//     // fontSize: 18.0
//     // ),),
//     // ),
//     //
//     //
//     // }
//     floatingActionButton: FloatingActionButton(
//     child: Icon(Icons.audiotrack),
//     onPressed: () async {
//     ///TODO: MUST IMPLEMENT IOS DEPENDENCY AS AUDIO PLAYERS PACKAGE
//     String filePath = await FilePicker.getFilePath();
//     /* FilePicker.getDirectoryPath().then((value) {
//              setState(() {
//                _directoryPath = value;
//              });
//            });
//     _directoryPath =Directory();
//     songsList =  _directoryPath.listSync().map((item) => item.path).toList(growable: false);
//     String songName = filePath
//         .split("/")
//         .last;*/
//     print("fileesss$filePath");
//     print("directoorryyy$_directoryPath");
//     int status = await _audioPlayer.play(filePath, isLocal: true);
//     await _audioPlayer.setReleaseMode(ReleaseMode
//         .LOOP); //LOOP: will never release; after completed, it will start playing again on loop.
//     if (status == 1) {
//     setState(() {});
//     }
//     },
//     ),
//
//     );
// // else {
// //   return Scaffold(
// //     appBar: AppBar(
// //       title: Text("Xender images"),
// //     ),
// //     body: Center(
// //       child: Container(
// //         padding: EdgeInsets.only(bottom: 60.0),
// //         child: Text("Sorry, No Images Where Found.", style: TextStyle(
// //             fontSize: 18.0 //
// //         ),),
// //       ),
// //     ),
// //   );
// // }
//
// }
// }
//
// //Declare Globaly
// // /data/user/0/io.github.edufolly.flutterbluetoothserialexample/cache/file_picker/Teri_Jhuki_Nazar_(Film_Version)(MyMp3Song).mp3
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';



class FinalScreen extends StatefulWidget {
  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  FilePickerCross filePickerCross;

  String _fileString = '';
  Set<String> lastFiles;
  FileQuotaCross quota = FileQuotaCross(quota: 0, usage: 0);

  @override
  void initState() {
    _selectFile();
    // FilePickerCross.listInternalFiles()
    //     .then((value) => setState(() => lastFiles = value.toSet()));
    // FilePickerCross.quota().then((value) => setState(() => quota = value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blueGrey, accentColor: Colors.lightGreen),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView(
          padding: EdgeInsets.all(8),
          children: <Widget>[
            Text(
              'Last files',
              style: Theme.of(context).textTheme.headline5,
            ),
            (lastFiles == null)
                ? Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                leading: Text('$index.'),
                title: Text(lastFiles.toList()[index]),
                onTap: () async => setFilePicker(
                    await FilePickerCross.fromInternalPath(
                        path: lastFiles.toList()[index])),
              ),
              itemCount: lastFiles.length,
            ),
            RaisedButton(
              onPressed: _selectFile,
              child: Text('Open File...'),
            ),
            (filePickerCross == null)
                ? Text('Open a file first, to save')
                : RaisedButton(
              onPressed: _selectSaveFile,
              child: Text('Save as...'),
            ),
            Text(
              'File system details',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text('Quota: ${(quota.quota / 1e6).round()} MB'),
            Text(
                'Usage: ${(quota.usage / 1e6).round()}; Remaining: ${(quota.remaining / 1e6).round()}'),
            Text('Percentage: ${quota.relative.roundToDouble()}'),
            Text(
              'File details',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
                'File path: ${filePickerCross?.path ?? 'unknown'} (Might cause issues on web)\n'),
            Text('File length: ${filePickerCross?.length ?? 0}\n'),
            Text('File as String: $_fileString\n'),
          ],
        ),
      ),
    );
  }

/*  void _selectFile() {
    FilePickerCross.importFromStorage()
        .then((filePicker) => setFilePicker(filePicker));
  }*/
  void _selectFile() {
    FilePickerCross.importFromStorage()
        .then((filePicker) => setFilePicker(filePicker));
  }

  void _selectSaveFile() {
    filePickerCross.exportToStorage();
  }

  setFilePicker(FilePickerCross filePicker) => setState(() {
    filePickerCross = filePicker;
    filePickerCross.saveToPath(path: filePickerCross.fileName);
    FilePickerCross.quota().then((value) {
      print(value);
      setState(() => quota = value);
    });
    lastFiles.add(filePickerCross.fileName);
    try {
      _fileString = filePickerCross.toString();
    } catch (e) {
      _fileString = 'Not a text file. Showing base64.\n\n' +
          filePickerCross.toBase64();
    }
  });
}
