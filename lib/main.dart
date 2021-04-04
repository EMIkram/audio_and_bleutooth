import 'dart:ffi';


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/AvailableSpeakers.dart';
import 'package:flutter_bluetooth_serial_example/BluetoothOn.dart';
import 'package:flutter_bluetooth_serial_example/FinalPlay.dart';
import 'package:flutter_bluetooth_serial_example/NowPlaying.dart';
import 'package:flutter_bluetooth_serial_example/SearchingSpeakers.dart';
import 'package:flutter_bluetooth_serial_example/SiginScreen.dart';
import 'package:flutter_bluetooth_serial_example/SignupScreen.dart';
import 'package:flutter_bluetooth_serial_example/SpeakerJson.dart';
import 'package:flutter_bluetooth_serial_example/SplashScreen.dart';
import 'package:flutter_bluetooth_serial_example/UI/ImageSlider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import './MainPage.dart';
import 'FinalScreen.dart';



GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();
void main() => runApp(new ExampleApplication());
ConstantWidgets constantWidgets = ConstantWidgets();
Color greenColor = Colors.lightGreenAccent[700].withOpacity(0.9);
class ExampleApplication extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SpeakerStorageJson(),
      routes: <String, WidgetBuilder> {
        'signin': (BuildContext context) => new SigninScreen(),
        'signup' : (BuildContext context) => new SignupScreen(),
         'bluetoothon' : (BuildContext context) => new BluetoothON(),
        // '/screen4' : (BuildContext context) => new Screen4()
      },

    );
  }
}





class ConstantWidgets{
  bool value = false;
  Widget widget; ///has to remove
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
  } /// has to remove


  Widget entryField(BuildContext context,{hintText,final controller, bool obsecureText = false, textAlign = TextAlign.start})
  {
    return Container(
      width: SizeConfig.screenWidth/1.5,
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        textAlign: textAlign,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon:obsecureText? IconButton(icon: Icon(Icons.remove_red_eye),onPressed: (){


          },):Text(""),

        ),


      ),
    );
  }


  Widget customButton(BuildContext context,String title,Color color, textColor,widdth,heigght,{ routeName, icon,fontSize = 19.0})
  {

    return FlatButton(
      minWidth: SizeConfig.screenWidth * widdth,
      height: SizeConfig.screenHeight/heigght,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.50),
        side: BorderSide(
          color: Colors.grey[400],
          width: 2.0
        )
      ),
      color: color,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(width: 15,),
          icon

        ],
      ),


      onPressed: (){
        Navigator.of(context).pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
      },
    );
  }

  Widget richText(BuildContext context,title,label){
    return RichText(
        text: TextSpan(
          text: title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18
          ),
          children: [
            TextSpan(
              text: label ,
              recognizer: TapGestureRecognizer()..onTap = (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> SignupScreen()));
              },
              style: TextStyle(
                color: Colors.lightGreenAccent[700].withOpacity(0.9),
                fontWeight: FontWeight.bold,
                fontSize: 26
              )
            )
          ]
        ),

    );
  }

  Widget alignment(x,y,widget){
    return Align(
     alignment: Alignment(x,y),
      child: widget,
    );
  }

  Widget commonScaffold(BuildContext context,widget, {drawer}){

   SizeConfig().init(context);
   print({MediaQuery.of(context).padding});
   print("screenwidth${SizeConfig.screenWidth}");
    return SafeArea(
        child: Scaffold(
          body: widget,
          drawer: drawer,

        ),

    );
  }

  Widget availableScreenLayout(BuildContext context,title,widget,avatarWidget, {function}){
    return  constantWidgets.commonScaffold(context,
      Container(
        width: SizeConfig.screenWidth ,
        height: SizeConfig.screenHeight,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: SizeConfig.screenHeight * 0.25,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/cropAvailable.png"),
                      fit: BoxFit.fill
                  ),

              ),
            ),
            Text(title ,style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2.5,fontWeight: FontWeight.w700 ),textAlign: TextAlign.center,),
            widget,
           Stack(
             children: [
               Container(
                 height: SizeConfig.screenHeight * 0.15,
                 decoration: BoxDecoration(
                   gradient:LinearGradient(
                     colors: [Colors.white , Colors.grey[800]],
                     begin: Alignment.topCenter,
                     end: Alignment.bottomCenter,
                     stops: [0.0,0.0]

                   )
                 ),
               ),
               Container(
                 padding: EdgeInsets.all(0),
                 alignment: Alignment.bottomCenter,
                 height: SizeConfig.screenHeight * 0.05,
                 color: Colors.white
               ),
           Center(
             child: CircleAvatar(
               radius: 43,
               backgroundColor:Colors.white,
               child: InkWell(
                 onTap: (){
                   function;
                   /// function
                 },
                 child: CircleAvatar(
                   radius: 38,
                   backgroundColor: Colors.grey[800],
                   child: avatarWidget
                /*   Icon(
                     icon ,color: greenColor,size: 35,
                   )*/
                     ),
                   ),
                 ),
               ),


             ],
           )


          ],
        ),
      ),

    );}

   dialogBox(BuildContext context, childWidget){
    return showDialog(
      context: context,
      barrierDismissible: true,
      useSafeArea: true,
      builder: (context)=> Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: Colors.transparent,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: Colors.white,
            ),
            height: SizeConfig.screenHeight * 0.40,
            child: childWidget
        ),
//          backgroundColor: ,
//          shape: CircleBorder(),
        elevation: 10,
      ),
    );
  }

/*
  renameSpeaker(BuildContext context){
    return dialogBox(context,
      Column(
        children: [
          Text('RENAME SPEAKER'),
          entryField(context,hintText: "Speaker Name"),
          customButton(context, "DONE", Colors.white, Colors.black, 0.05, 19,icon: Text(''))
        ],
      )
    );
  }
*/

  List<String> dozeOffList = ["0","15",'30','45','50','55','60','',];

     drawerItem(widgetItem){
    return Column(
      children: [
        widgetItem,
        Divider(thickness: 3,color: Colors.grey,)
      ],
    );
    }

   drawer(BuildContext context){
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Drawer Header
          Flexible(
            child: Center(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.perm_identity,color: Colors.white,size: 35,),
                    backgroundColor: Colors.grey[500],
                  ),

                  Text('GUEST',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,letterSpacing: -1),),
                  Divider(height:0,thickness: 6,color: Colors.grey,endIndent: SizeConfig.screenWidth * 0.20,indent: SizeConfig.screenWidth * 0.20,)
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: ListView(
              padding: EdgeInsets.only(right: SizeConfig.screenWidth * 0.15),
              children: [
                constantWidgets.drawerItem(ListTile(title: Text("CREATE ACCOUNT",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17,letterSpacing: -1),),),),
                constantWidgets.drawerItem(ExpansionTile(
                  title: Text("ABOUT",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17,letterSpacing: -1)),
                  expandedAlignment: Alignment.topLeft,
                  childrenPadding: EdgeInsets.all(20),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("- Privacy Policy",),
                        Text("- Legal"),
                        Text("- Feedback"),
                      ],
                    )

                  ],
                )),
                constantWidgets.drawerItem(ListTile(title: Text("AVAILABLE DEVICES",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17,letterSpacing: -1),),),),
                constantWidgets.drawerItem(ExpansionTile(
                  title: Text("SETTING",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17,letterSpacing: -1)),
                  expandedAlignment: Alignment.topLeft,
                  childrenPadding: EdgeInsets.all(20),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          child: Text("- Rename Speaker",),
                          onTap: (){
                            return dialogBox(context,
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('RENAME SPEAKER',style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: -1, fontSize: 17),),
                                      entryField(context,hintText: "SPEAKER NAME HERE",textAlign: TextAlign.center),
                                      customButton(context, "DONE", Colors.white, Colors.black, 0.05, 29,icon: Text(''))
                                    ],
                                  ),
                                )
                            );
                          },
                        ),
                        InkWell(
                          child: Text("- Doze Off"),
                          onTap: (){
                            return dialogBox(context,
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Flexible(flex: 2,child: Text('DOZE OFF',style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: -1, fontSize: 17),)),
                                      Text('Min',style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: -1, fontSize: 17),),
                                      Flexible(
                                        flex: 2,
                                        child: ShaderMask(
                                          shaderCallback: (rect){
                                            return LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [Colors.black26,Colors.black,Colors.black26]
                                            ).createShader(rect);
                                          },
                                          child: ListView.builder(
                                            itemExtent: 40,
                                              shrinkWrap: true,
                                              itemCount: dozeOffList.length,
                                              itemBuilder: (context,i){
                                                return Container(alignment: Alignment.center,child: Text(dozeOffList[i],style: TextStyle(fontSize: 22,color: Colors.white),));
                                              }
                                          ),
                                        ),
                                      ),
                                      Align(alignment: Alignment.bottomRight,child: customButton(context, "DONE", Colors.white, Colors.black, 0.015, 31,icon: Text(''), fontSize: 15.0))
                                    ],
                                  ),
                                )
                            );
                          },
                        ),
                      ],
                    )

                  ],
                )),
                constantWidgets.drawerItem(ListTile(title: Text("FEATURES",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17,letterSpacing: -1),),),),
                ListTile(title: Text("LOGOUT",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17,letterSpacing: -1),),),

              ],
            ),
          ),

          Flexible(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  constantWidgets.customButton(context, 'DISCONNECT', Colors.black, Colors.white, 0.48 , 19,icon: Text("")),
                  Text("www.soundcrush.com"),
                  Divider(thickness: 6,color: Colors.grey,endIndent: SizeConfig.screenWidth * 0.15,indent: SizeConfig.screenWidth * 0.15,),
                  Text("App Version \n 1.0.0",textAlign: TextAlign.center,)
                ],
              ),
            ),
          ),



        ],
      ),
    );
  }









}

class Knob extends StatefulWidget {
  double knobMeter , maxCircle,minCircle ;
  Widget knobBottomWidget;


  Knob(this.knobMeter,this.maxCircle,this.minCircle,this.knobBottomWidget);
  @override
  _KnobState createState() => _KnobState();
}

class _KnobState extends State<Knob> {
  double Two_Pi = 3.14 * 2;
  double endAngle= 0.0 ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * widget.knobMeter
         /* 0.39*/,
      child: Stack(
        children: [
          ShaderMask(
              shaderCallback: (rect){
                return SweepGradient(
                    startAngle: 9.5 * 3.142 /2,
                    endAngle:  13.5 * 3.142 / 2,
                    colors: [Colors.indigo,Colors.white,],
                    center: Alignment.center,
                    tileMode: TileMode.repeated,
                    stops: [endAngle,endAngle]

                ).createShader(rect);

              },
              child: Container(

                  child: Center(child: Image.asset("assets/knobMeter.png",color:Colors.white,)))

          ),
          Center(
            child: Container(
              height: SizeConfig.screenHeight * widget.maxCircle
                 /* 0.24*/,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue,
                        spreadRadius: 2,
                        blurRadius: 5
                    )
                  ]
              ),
              child:  Center(
                child: Container(
                  height: SizeConfig.screenHeight * widget.minCircle
                     /* 0.23*/,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(color: Colors.blue, width: 2)

                  ),
                  child:  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.1),
                    child: Center(

                      child: SleekCircularSlider(
                        min:0,
                        max: 1,
                        initialValue: 0,
                        innerWidget: (value){
                          return Text("");
                        },

                        appearance: CircularSliderAppearance(

                          /*size: size.height/7,*/
                          customWidths: CustomSliderWidths(
                            shadowWidth: 1,
                            progressBarWidth:SizeConfig.screenHeight * 0.02,
                            trackWidth:SizeConfig.screenHeight * 0.06,
                            handlerSize: 4,
                          ),
                          customColors: CustomSliderColors(
                            dotColor: Colors.indigo,
                            shadowColor: Colors.transparent,
                            progressBarColor: Colors.transparent,
                            trackColor: Colors.transparent,
                          ),
                        ),
                        onChange: (double value)async{
                          print("3st ${3 * Two_Pi /2}");
                          print("7st ${7 * Two_Pi /2}");
                          print("400st ${5 * Two_Pi /400}");
                          ///TODO:
                          setState(() {
                            endAngle = value - 0.1;
                            print(value);
                            print(endAngle);
                          });
                          /* _setVolumeValue = value;
                  VolumeController.setVolume(_setVolumeValue);
                  setState(() {});*/
                        },
                        onChangeEnd: (double value)async{
                          /* _setVolumeValue = value;*/

                          setState(() {
                            endAngle =value - 0.1;
                            // *//* VolumeController.setVolume(_setVolumeValue);*//*
                          });
                        },
                      ),
                    ),
                  ),
                ),

              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: widget.knobBottomWidget
          ),
        ],
      ),
    );
  }
}


/*class EntryField extends StatefulWidget {
 String hintText;
 TextEditingController controller;
 bool obsecureText = false;

  EntryField({hintText, controller, obsecureText});
  @override
  _EntryFieldState createState() => _EntryFieldState();
}
class _EntryFieldState extends State<EntryField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth/1.5,
      child: TextField(
        controller: widget.controller,
        obscureText:widget.obsecureText,
        autofocus: true,
        decoration: InputDecoration(
          hintText: "Email",
          suffixIcon:widget.obsecureText? IconButton(icon: Icon(Icons.remove_red_eye),onPressed: (){
            setState(() {
              widget.obsecureText = widget.obsecureText? widget.obsecureText = false: true;
            });

          },):Text(""),

        ),


      ),
    );
  }
}*/ /// entry field

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
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
