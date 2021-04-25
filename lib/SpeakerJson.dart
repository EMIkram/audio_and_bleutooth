import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_bluetooth_serial_example/ConnectionScreen.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:network_to_file_image/network_to_file_image.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'SplashScreen.dart';





Directory _appDocsDir;
File imageFile;



 class SpeakersApiData{
   static const String url = 'http://soundcrush.pk/wp-content/themes/speakers.json';

    Future getSpeakerData() async {
     try {


       String fileName = "SpeakersData.json";
       String imagebytesFilename = "Speakersimagebytes.json";

       var  dir = await getTemporaryDirectory(); /// for ios directory name has to change
      /// for image storage

       File files = File(dir.path + "/" + fileName);
       File imagesbytesfile = File(dir.path + "/" + imagebytesFilename);

       if(files.existsSync()){
         print("cached from device");
         //final data = file.readAsBytesSync();

          final apiData = json.decode(files.readAsStringSync());


         for(int i =0 ;i <apiData[0]["data"].length; i++){
          //final image = Image.network(apiData[0]["data"][i]["image"]);
         final imageBytes =  await imagesbytesfile.writeAsBytes(apiData[0]["data"][i]["image"].bodyBytes);
         final imageBytess =  await imageBytes.readAsBytesSync();
           final encodedImage = convert.base64Encode(imageBytess);
           myspeakerImageBase64List.add(encodedImage);

        }
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


 }


class SpeakerStorageJson extends StatefulWidget {
  //
  SpeakerStorageJson() : super();

  @override
  _SpeakerStorageJsonState createState() => _SpeakerStorageJsonState();
}

class _SpeakerStorageJsonState extends State<SpeakerStorageJson> {
  //
  var apiImages;
  var apiImagesList =[];
 @override
  void initState() {
   
   SpeakersApiData().getSpeakerData().then((value) {
     for(int i =0 ;i <value[0]["data"].length; i++){
       setState(() {
         speakersName.add(value[0]["data"][i]["name"]);
       });


        AdvancedNetworkImage(
            value[0]["data"][i]["image"],
         useDiskCache: true
        );
     }
     print("filedataseerat $speakersName");

   });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Colors.white,
        child: FutureBuilder(
          future:SpeakersApiData().getSpeakerData(),
          builder: (context,snapshot){
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            }else{
              print(snapshot.data);
              return ListView.builder
                (
                itemCount: snapshot.data[0]["data"].length,
                  itemBuilder: (context,index){
                  final encodeimage = convert.Base64Encoder().convert((snapshot.data[0]["data"][index]["image"]));
                  final decodeimage = convert.base64Decode(encodeimage);
                  return ListTile(
                    title: Text(snapshot.data[0]["data"][index]["name"]),
                    subtitle: Image.memory(decodeimage),


                    /*Image(
                      image:  AdvancedNetworkImage(
                        snapshot.data[0]["data"][index]["image"] ,

                      ),
                    ),*/
                    /*subtitle: CachedNetworkImage(
                    
                      placeholder: (context, url) => CircularProgressIndicator(),
                      imageUrl:snapshot.data[0]["data"][index]["image"],

                    ),*/

                    /*Image(
                      image: NetworkToFileImage(
                        url: snapshot.data[0]["data"][index]["image"],
                        file: SpeakersApiData().fileFromDocsDir("flutter.png"),
                        debug: true,
                      ),
                    ),*/



                  );
                  }
              );
            }
        },

        )
      ),
    );
  }
}
