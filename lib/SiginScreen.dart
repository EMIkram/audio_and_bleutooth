import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/BluetoothOn.dart';
import 'package:flutter_bluetooth_serial_example/main.dart';



class SigninScreen extends StatelessWidget {

  TextEditingController emailController =  TextEditingController();
  TextEditingController passController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold( /// must change to its commonScaffold widget
      body: SingleChildScrollView(
        child: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Stack(
            children: [
              constantWidgets.alignment(0.0,-0.8,  Image.asset("assets/logo.png",scale: 6),),
              constantWidgets.alignment(0.0,-0.3,  constantWidgets.entryField(context,hintText: "Email",controller: emailController),),
              constantWidgets.alignment(0.0,-0.15,  constantWidgets.entryField(context,hintText: "Password",controller: passController,obsecureText: true),),
              constantWidgets.alignment(0.0,0.1,  constantWidgets.customButton(context, "Sign in", greenColor,Colors.white,0.48 , 19,icon: Text(""),routeName:"bluetoothon")), /// add routName
              constantWidgets.alignment(0.0,0.3,
                Row(          ///Divider
                  children: <Widget>[
                    Expanded(
                        child: Divider(
                          indent: SizeConfig.screenWidth/4,
                          endIndent: SizeConfig.screenWidth/ 25,
                          thickness: 3,
                        )
                    ),
                    Text("OR",style: TextStyle(color: Colors.grey)),
                    Expanded(
                        child: Divider(
                          indent: SizeConfig.screenWidth/25,
                          endIndent: SizeConfig.screenWidth/ 4,
                          thickness: 3,
                        )
                    ),
                  ]
              ), ),/// add routename
              constantWidgets.alignment(0.0,0.4, Text("Continue with",style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2),),),
              constantWidgets.alignment(-0.3,0.55, Image.asset("assets/facebookIcon.png",scale: 10,),),
              constantWidgets.alignment(0.3,0.55, Image.asset("assets/google.png",scale: 10,),),
              constantWidgets.alignment(0.7,0.77, constantWidgets.customButton(context, "Skip", Colors.transparent,Colors.black,0.25,60,icon:
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.lightGreenAccent[700].withOpacity(0.9),
                child: Icon(Icons.arrow_forward_sharp,color: Colors.white,size: 20,),
              ),routeName: "bluetoothon"
              )),
              constantWidgets.alignment(0.0,0.9,constantWidgets.richText(context,"New User?  ", "Sign up") ),
            ],
          ),
        ),
      ),
    );
  }
}
