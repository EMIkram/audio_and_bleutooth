import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'dart:convert' ;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bluetooth_serial_example/SiginScreen.dart';
import 'package:flutter_bluetooth_serial_example/main.dart';
import 'SpeakerJson.dart';


final List<SpeakersCacheimageModelClass> speakerCacheImageMapList = [];
final List<SpeakersCacheimageModelClass> speakerCacheImageMapListExactName = [];
final List myspeakerImageBase64Lists = [];
final List myspeakerImageBase64List = [];
List speakersName = [];
List speakersExactName = [];
List speakersNameWithoutDublication = [];


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const String url = 'http://soundcrush.pk/wp-content/themes/speakers.json';

  Future getSpeakerData() async {
    try {
      String fileName = "SpeakersData.json";
    //  String imagebytesFilename = "Speakersimagebytes.json";

      var  dir = await getTemporaryDirectory(); /// for ios directory name has to change
      /// for image storage

      File files = File(dir.path + "/" + fileName);
     // File imagesbytesfile = File(dir.path + "/" + imagebytesFilename);

      if(files.existsSync()){
        print("cached from device");
        //final data = file.readAsBytesSync();

        final apiData = json.decode(files.readAsStringSync());
      /*  for(int i =0 ;i <apiData[0]["data"].length; i++){
          final image =await Image.network(apiData[0]["data"][i]["image"]);
         // final bytes = File(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)).readAsBytesSync();
             await imagesbytesfile.writeAsStringSync(image.toString());
          final bytes = File(imagesbytesfile.path).readAsBytesSync();

          //  final imageBytess =  await imageBytes.readAsBytesSync();
          //final encodedImage = convert.base64Encode(imageBytess);
          String base64Image = base64Encode(bytes);
          print(base64Image.substring(0,50));
          setState(() {
            myspeakerImageBase64Lists.add(base64Image);

          });

        }*/


        return apiData;
      }else{
        print("fetched from internet");
        final response = await http.get(url);
        if (200 == response.statusCode) {
          //save to file
          files.writeAsStringSync(response.body, flush: true , mode: FileMode.write);
          final apiBody = json.decode(response.body);
          return apiBody;
        } else {
          return json.decode(response.body);
        }
      }
    }catch (e) {

    }


  }





  @override
  void initState() {
   getSpeakerData().then((value) async{
     //String imagebytesFilename = "Speakersimagebytes.json";

    // var  dir = await getTemporaryDirectory(); /// for ios directory name has to change
     /// for image storage
   //  File imagesbytesfile = File(dir.path + "/" + imagebytesFilename);
     for(int i =0 ;i <value[0]["data"].length; i++){
      final cacheimage  = AdvancedNetworkImage(
           value[0]["data"][i]["image"],
           useDiskCache: true,
       /* postProcessing: (value)async{
          await imagesbytesfile.writeAsBytesSync(value);
          final bytes = File(imagesbytesfile.path).readAsBytesSync();
          String base64Image = base64Encode(bytes);
          setState(() {
            myspeakerImageBase64Lists.add(base64Image);
          });
          print(base64Image);

        }*/
       );
       //final image =await Image.network(value[0]["data"][i]["image"]);
       // final bytes = File(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)).readAsBytesSync();
     //  await imagesbytesfile.writeAsBytesSync(cacheimage);
       //final bytes = File(imagesbytesfile.path).readAsBytesSync();

       //  final imageBytess =  await imageBytes.readAsBytesSync();
       //final encodedImage = convert.base64Encode(imageBytess);
     //  String base64Image = base64Encode(bytes);
      // print(base64Image.substring(0,50));
       setState(() {
         String name  = value[0]["data"][i]["name"];
         String exactSpeakerName  = name.toUpperCase().split("-").first;

       //  if(fileData.contains (name))
         speakersName.add(name);
         speakersExactName.add(exactSpeakerName);
         //speakersNameWithoutDublication.add(speakersExactName.toSet());
         speakerCacheImageMapList.add(SpeakersCacheimageModelClass(speakersName[i],cacheimage));
         speakerCacheImageMapListExactName.add(SpeakersCacheimageModelClass(speakersExactName[i],cacheimage));


       });
       setState(() {
         speakersNameWithoutDublication = speakersExactName.toSet().toList();
        // myspeakerImageBase64MapListwithoutDublication = myspeakerImageBase64MapListExactname.toSet().toList();
         print("speakersNameWithoutDublication $speakersNameWithoutDublication");
         //print("myspeakerImageBase64MapListExactnamewithout dublication $myspeakerImageBase64MapListwithoutDublication");

       });
     }
   });
    Timer(
        Duration(seconds: 8),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => SigninScreen())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: Image.asset("assets/soundcrush logo 2.gif",scale: 3)),
      ),
    );
  }
}

class SpeakersCacheimageModelClass{
   String spkrName ;
   AdvancedNetworkImage imgBase64Bytes;

   SpeakersCacheimageModelClass(this.spkrName, this.imgBase64Bytes);

}