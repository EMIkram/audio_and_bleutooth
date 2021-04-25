import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_bluetooth_serial_example/FinalScreen.dart';
import 'package:flutter_bluetooth_serial_example/UI/ImageSlider.dart';
import 'package:flutter_bluetooth_serial_example/SplashScreen.dart';

import 'BluetoothDeviceListEntry.dart';
import 'BluetoothOn.dart';
import 'FinalPlay.dart';
import 'SpeakerJson.dart';
import 'main.dart';


List<BluetoothDiscoveryResult> results = List<BluetoothDiscoveryResult>();
List<BluetoothDiscoveryResult> resultsWithoutDuplication = List<BluetoothDiscoveryResult>();
List<BluetoothDiscoveryResult>  filteredList = List<BluetoothDiscoveryResult>();
List detectedSpeakersImagesList = [];
List<SpeakersCacheimageModelClass> withoutDublicationbluetoothObjectList=[];


class AvailableSpeakers extends StatefulWidget {

  /// If true, discovery starts on page start, otherwise user must press action button.
  final bool start;

  const AvailableSpeakers({this.start = true});


  @override
  _AvailableSpeakersState createState() => _AvailableSpeakersState();
}


class _AvailableSpeakersState extends State<AvailableSpeakers> with SingleTickerProviderStateMixin {

  StreamSubscription<BluetoothDiscoveryResult> _streamSubscription;
  bool isDiscovering;
  AnimationController shimmerController;
  Animation shimmerAnimationOne;
  Animation shimmerAnimationTwo;


  _AvailableSpeakersState();

  @override
  void initState() {
    super.initState();


    isDiscovering = widget.start;
    /*SpeakersApiData().getSpeakerData().then((value) {
      for(int i =0 ;i <value[0]["data"].length; i++){
        setState(() {
          String speaker = value[0]["data"][i]["name"];
          if(fileData.contains(speaker.toUpperCase().split("-").first)){

          }
          else{
            fileData.add(speaker.toUpperCase().split("-").first);
          }

        });}});
*/

    if (isDiscovering) {
      _startDiscovery();
    }
    shimmerController =AnimationController(vsync: this,duration: Duration(milliseconds: 1500));
    shimmerAnimationOne = ColorTween(begin: Colors.grey[700],end: Colors.white).animate(shimmerController);
    shimmerAnimationTwo = ColorTween(begin: Colors.grey[100],end: Colors.white).animate(shimmerController);

    shimmerController.forward();
    shimmerController.addListener(() {
      if(shimmerController.status ==AnimationStatus.completed){
        shimmerController.reverse();
      }
      else if(shimmerController.status ==AnimationStatus.dismissed){
        shimmerController.forward();
      }
      ///is some errors comes unexpectdly, must uncommnet it
      // this.setState(() {
      //
      // });
    });
  }

  void _restartDiscovery() {
    setState(() {
      results.clear();
      isDiscovering = true;
    });

    _startDiscovery();
  }

  void _startDiscovery() {
    setState(() {
      results.clear();
      filteredList.clear();
    });
    _streamSubscription =
        FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
          setState(() {
             if(speakersNameWithoutDublication.contains(r.device.name)){
              /* if(results.contains(r.device.name)){
               }*/
               /*else{*/
                 results.add(r);
                 Map<String,BluetoothDiscoveryResult > mp = {};
                 for (var item in results) {
                   mp[item.device.address] = item;
                 }
                  filteredList = mp.values.toList();
                 //results.where((element) => (element.device.address.compareTo(other)));
              //   resultsWithoutDuplication = results.toSet().toList();
                 print("speakername resultswithout seeratseerat${filteredList}");
                /* if (myspeakerImageBase64MapListExactname.any((item) => filteredList.contains(item.spkrName))) {
                   detectedSpeakersImagesList.add(.imgBase64Bytes);
                 }*/

               /*  try{
                   for(int i=0 ; i< filteredList.length ; i++){
                     var index=  myspeakerImageBase64MapListExactname.indexWhere((element) => (element.spkrName.contains(filteredList[i].device.name)));
                          print("index$index");
                          detectedSpeakersImagesList.add(myspeakerImageBase64MapList[index].imgBase64Bytes);
                   }

                 }
                 catch(e){
                   print(e);
            }
*/



                /* for(int i = 0 ; i< myspeakerImageBase64MapListExactname.length ; i++){
                   for(int j = 0; j< results.length ; j++){
                     if(results[j].device.name== myspeakerImageBase64MapListExactname[i].spkrName){
                       for(int k = 0 ; k<= withoutDublicationbluetoothObjectList.length ; k++){      // todo check if there is any error as list is empty
                         if(!withoutDublicationbluetoothObjectList[k].address.contains(results[j].device.address)){
                           setState(() {
                             withoutDublicationbluetoothObjectList.add(SpeakersNameImgBase64Bytesmap(myspeakerImageBase64MapListExactname[i].spkrName,myspeakerImageBase64MapListExactname[i].imgBase64Bytes,address: results[j].device.address));
                           });

                         }
                       }

                     }
                   }

                   //if(myspeakerImageBase64MapListExactname.indexWhere((element) { element.spkrName == results[i].device.name } ,[i])){

                  // }
                 }*////gul logics


                //print("speakername seerar${results}");
                /* for(int i ; i< results.length ; i++){
                   for(int j ; j <  myspeakerImageBase64MapList.length ; j++)
                   if(myspeakerImageBase64MapList.contains(results[j].device.name))
                     setState(() {
                       detectedSpeakersImagesList.add(myspeakerImageBase64MapList[j].imgBase64Bytes);
                     });
                   print("seerat detectedlist $detectedSpeakersImagesList");

                 }*/
              /* }*/
           // TODO Remove Repetition of devices names from the "results" list
            }
            /* try{
               for(int i=0 ; i< filteredList.length ; i++){
                 var index=  myspeakerImageBase64MapListExactname.indexWhere((element) => (element.spkrName.contains(filteredList[i].device.name)));
                 print("index$index");
                 detectedSpeakersImagesList.add(myspeakerImageBase64MapList[index].imgBase64Bytes);
               }

             }
             catch(e){
               print(e);
             }*/




          }
          /*}*/);

        });



    _streamSubscription.onDone(() {
      setState(() {
        isDiscovering = false;
        try{
          for(int i=0 ; i< filteredList.length ; i++){
            var index=  speakerCacheImageMapListExactName.indexWhere((element) => (element.spkrName.contains(filteredList[i].device.name)));
            print("index$index");
            detectedSpeakersImagesList.add(speakerCacheImageMapList[index].imgBase64Bytes);
          }

        }
        catch(e){
          print(e);
        }
        print("speakername filedatalist$detectedSpeakersImagesList");
      });
    });
  }

  // @TODO . One day there should be `_pairDevice` on long tap on something... ;)

  @override
  void dispose() {
    // Avoid memory leak (`setState` after dispose) and cancel discovery
    _streamSubscription?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return constantWidgets.availableScreenLayout(context,
        isDiscovering ? "Searching" : "Available Devices",
        isDiscovering ? Expanded(
          child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  tileMode: TileMode.mirror,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    shimmerAnimationOne.value,
                    shimmerAnimationTwo.value
                  ],
                ).createShader(rect);
              },
              child: Icon(Icons.more_horiz_rounded, color: Colors.white,
                size: SizeConfig.screenHeight * 0.15,)

          ),
        )
            : /*ListView.builder(
              shrinkWrap: true,
                itemCount: results.length,
                itemExtent: 20,
                itemBuilder: (context,index){
                  BluetoothDiscoveryResult result = results[index];
                  return BluetoothDeviceListEntry(
                    device: result.device,
                    rssi: result.rssi,
                    onTap: () async {
                      try {
                        bool bonded = false;

                        /// Disconnect Device
                        if (result.device.isBonded) {
                          print('Unbonding from ${result.device.address}...');
                          await FlutterBluetoothSerial.instance
                              .removeDeviceBondWithAddress(result.device.address);
                          print('Unbonding from ${result.device.address} has succed');
                        }   //TODO  remove "Disconnect" functionality from here

                        /// Connect
                        else {
                          print('Bonding with ${result.device.address}...');
                          bonded = await FlutterBluetoothSerial.instance
                              .bondDeviceAtAddress(result.device.address);
                          print(
                              'Bonding with ${result.device.address} has ${bonded ? 'succed' : 'failed'}.');
                          if(bonded!=false){
                            return Navigator.push(context, MaterialPageRoute(builder: (context)=>FinalPlay()));
                          }

                        }
                        setState(() {
                          results[results.indexOf(result)] = BluetoothDiscoveryResult(
                              device: BluetoothDevice(
                                name: result.device.name ?? '',
                                address: result.device.address,
                                type: result.device.type,
                                bondState: bonded
                                    ? BluetoothBondState.bonded
                                    : BluetoothBondState.none,
                              ),
                              rssi: result.rssi);
                        });
                      } catch (ex) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Error occured while bonding'),
                              content: Text("${ex.toString()}"),
                              actions: <Widget>[
                                new FlatButton(
                                  child: new Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  );
                }
            ),*/
         ImageSlider(),
      Icon(
        Icons.search_outlined ,color: greenColor,size: 35,
      ),

    );
  }
/*
 {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return constantWidgets.backgroundScreen(context,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Image.asset('assets/avialBlue.png',scale: 6,),
                Expanded(child: isDiscovering
                    ? Text('Discovering',style: TextStyle(fontSize: 24))
                    : Text('Available Devices',style: TextStyle(fontSize: 24))),
              ],
            ),
            SizedBox(height: height/25,),
            Divider(color: Colors.green,thickness: 3,),
            SizedBox(height: height/10,),
            Expanded(
              child: ListView.builder(
                  itemCount: results.length,
                  itemExtent: height/18,
                  itemBuilder: (context,index){
                    BluetoothDiscoveryResult result = results[index];
                    return BluetoothDeviceListEntry(
                      device: result.device,
                      rssi: result.rssi,
                      onTap: () async {
                        try {
                          bool bonded = false;

                          /// Disconnect Device
                          if (result.device.isBonded) {
                            print('Unbonding from ${result.device.address}...');
                            await FlutterBluetoothSerial.instance
                                .removeDeviceBondWithAddress(result.device.address);
                            print('Unbonding from ${result.device.address} has succed');
                          }   //TODO  remove "Disconnect" functionality from here

                          /// Connect
                          else {
                            print('Bonding with ${result.device.address}...');
                              bonded = await FlutterBluetoothSerial.instance
                                  .bondDeviceAtAddress(result.device.address);
                              print(
                                  'Bonding with ${result.device.address} has ${bonded ? 'succed' : 'failed'}.');
                              if(bonded!=false){
                                return Navigator.push(context, MaterialPageRoute(builder: (context)=>FinalPlay()));
                              }

                          }
                          setState(() {
                            results[results.indexOf(result)] = BluetoothDiscoveryResult(
                                device: BluetoothDevice(
                                  name: result.device.name ?? '',
                                  address: result.device.address,
                                  type: result.device.type,
                                  bondState: bonded
                                      ? BluetoothBondState.bonded
                                      : BluetoothBondState.none,
                                ),
                                rssi: result.rssi);
                          });
                        } catch (ex) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Error occured while bonding'),
                                content: Text("${ex.toString()}"),
                                actions: <Widget>[
                                  new FlatButton(
                                    child: new Text("Close"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    );
                  }
              ),
            )
          ],
        ),
        margin: EdgeInsets.fromLTRB(width/8, height/8, width/8, height/16,),
        floatingActionButton: isDiscovering
            ? FittedBox(
          child: Container(
            margin: new EdgeInsets.all(16.0),
            child: CircularProgressIndicator(    //TODO sometimes can't complete the discovery and keeps loading for infinite time
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          ),
        )
            : IconButton(
          icon: Icon(Icons.replay),
          onPressed: _restartDiscovery,
        ),
    );
  } /// do not remove this ,have to implement this code when backend work will start
}*/}
