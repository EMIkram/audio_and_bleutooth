import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_bluetooth_serial_example/FinalScreen.dart';
import 'BluetoothDeviceListEntry.dart';
import 'BluetoothOn.dart';

List availableSpeakers = ['M7','Bzoom','Roundo','HyperShock','M7','Bzoom','M7','Bzoom'];

class AvailableSpeakers extends StatefulWidget {

  /// If true, discovery starts on page start, otherwise user must press action button.
  final bool start;

  const AvailableSpeakers({this.start = true});


  @override
  _AvailableSpeakersState createState() => _AvailableSpeakersState();
}


class _AvailableSpeakersState extends State<AvailableSpeakers> {

  StreamSubscription<BluetoothDiscoveryResult> _streamSubscription;
  List<BluetoothDiscoveryResult> results = List<BluetoothDiscoveryResult>();
  bool isDiscovering;

  _AvailableSpeakersState();

  @override
  void initState() {
    super.initState();

    isDiscovering = widget.start;
    if (isDiscovering) {
      _startDiscovery();
    }
  }

  void _restartDiscovery() {
    setState(() {
      results.clear();
      isDiscovering = true;
    });

    _startDiscovery();
  }

  void _startDiscovery() {
    _streamSubscription =
        FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
          setState(() {
            results.add(r);        // TODO Remove Repetition of devices names from the "results" list
          });
        });

    _streamSubscription.onDone(() {
      setState(() {
        isDiscovering = false;
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
                       /* try {*/
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>FinalScreen()));//TODO navigate only when connected successfully

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
                        /*} catch (ex) {
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
                        }*/
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
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          ),
        )
            : IconButton(
          icon: Icon(Icons.replay),
          onPressed: _restartDiscovery,
        ),
    );
  }
}