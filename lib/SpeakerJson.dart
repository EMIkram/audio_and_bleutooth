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





Directory _appDocsDir;

 class SpeakersApiData{
   static const String url = 'http://soundcrush.pk/wp-content/themes/speakers.json';

    Future getSpeakerData() async {
     try {


       String fileName = "SpeakersData.json";

       var  dir = await getTemporaryDirectory(); /// for ios directory name has to change
      /// for image storage

       File file = File(dir.path + "/" + fileName);

       if(file.existsSync()){
         print("cached from device");
         // final data = file.readAsStringSync();
          final apiData = json.decode(file.readAsStringSync());


          return apiData;
       }else{
         print("fetched from internet");
         final response = await http.get(url);
         if (200 == response.statusCode) {
           //save to file
           file.writeAsStringSync(response.body , flush: true , mode: FileMode.write);







           final apiBody = json.decode(response.body);

           return apiBody;
         } else {
           return json.decode(response.body);
         }
       }
       }catch (e) {

     }


   }
  // File fileFromDocsDir(String filename) {
  //
  //    String pathName = p.join(_appDocsDir.path, filename);
  //    File(pathName);
  //    return File(pathName);
  //  }
/// for image storage purpose
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
  Future cachedNetworkImg(){

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
                  return ListTile(
                    title: Text(snapshot.data[0]["data"][index]["name"]),
                    subtitle: Image(
                      image:  AdvancedNetworkImage(
                        snapshot.data[0]["data"][index]["image"] ,

                      ),
                    ),
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
