import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/main.dart';

import 'BluetoothOn.dart';
import 'SiginScreen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController =  TextEditingController();

  TextEditingController passController =  TextEditingController();

  TextEditingController userNameController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Stack(
            children: [
              constantWidgets.alignment(0.0,-0.6,  Image.asset("assets/logo.png",scale: 6),),
              constantWidgets.alignment(0.0,-0.1,constantWidgets.entryField(context,hintText: "Username",controller: userNameController)),
              constantWidgets.alignment(0.0,0.1,  constantWidgets.entryField(context,hintText: "Email",controller: emailController),),
              constantWidgets.alignment(0.0,0.3,  constantWidgets.entryField(context,hintText: "Password",controller: passController,obsecureText: true),),
              constantWidgets.alignment(0.0,0.6,  constantWidgets.customButton(context, "Sign up", greenColor,Colors.white,0.48 , 19,icon: Text(""),routeName: "bluetoothon")), /// add routName

            ],
          ),
        ),
      ),
    );

  }
}
