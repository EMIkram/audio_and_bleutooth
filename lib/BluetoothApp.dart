// /*
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
//
// class BluetoothApp extends StatefulWidget {
//   @override
//   _BluetoothAppState createState() => _BluetoothAppState();
// }
//
// class _BluetoothAppState extends State<BluetoothApp> {
//
//   // Initializing the Bluetooth connection state to be unknown
//   BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
//
//   // Get the instance of the Bluetooth
//   FlutterBluetoothSerial _bluetoothSerial = FlutterBluetoothSerial.instance;
//
//   // Track the Bluetooth connection with the remote device
//   BluetoothConnection connection;
//
//   // To track whether the device is still connected to Bluetooth
//   bool get isStillConnected => connection != null && connection.isConnected;
//
//   List<BluetoothDevice> _pairedDevicesList = [];
//
//   // TO track the Bluetooth device connection state
//   int _deviceState;    /// Device On/Of State
//
//   /// Enable Bluetooth
//   Future<void> enableBluetooth() async{
//     // current Bluetooth state
//     _bluetoothState = await _bluetoothSerial.state;
//
//     if(_bluetoothState==BluetoothState.STATE_OFF){
//       await _bluetoothSerial.requestEnable();
//       await getPairedDevices();
//       return true;
//     }
//     else
//       await getPairedDevices();
//     return false;
//   }
//
//   /// get Paired Devices
//   Future<void> getPairedDevices() async{
//     List<BluetoothDevice> list = [];
//     try{list = await _bluetoothSerial.getBondedDevices();}
//     on PlatformException{print('Error');}
//
//     // It is an error to call [setState] unless [mounted] is true.
//     if (!mounted) {return;}
//
//     setState(() {_pairedDevicesList = list;});
//   }
//
//   /// Connect to any paired device
//   void _connectToBlueDevice()async{
//     if(_selectedDevice==null)
//       print('No device selected');
//     else{
//       // Making sure the device is not connected
//       if(!isStillConnected){
//         // Trying to connect to the device using its address
//         await BluetoothConnection.toAddress(_selectedDevice.address)
//             .then((value) {
//               connection = value;
//               print('Successfully connected to ${_selectedDevice.name}');
//               // Updating the current device connectivity status
//               setState(() {
//                 _connected = true;
//               });
//           // This is for tracking when the disconnecting process
//           // is in progress which uses the [isDisconnecting] variable
//           // defined before.
//           // Whenever we make a disconnection call, this [onDone]
//           // method is fired.
//               connection.input.listen(null).onData((value) {
//                 if(isDisconnecting)
//                   print('Disconnecting Locally');
//                 else
//                   print('Disconnecting Remotely');
//                 if(this.mounted)
//                   setState(() {});
//               });
//         }).catchError((error){
//           print('Cannot connect, exception occurred');
//           print(error.toString());
//         });
//         print("Device Connected");
//       }
//     }
//
//   }
//
//   /// Disconnecting from the connected bluetooth device
//   void _disconnectFromBlueDevice()async{
//     // Closing the Bluetooth connection
//     await connection.close();
//     print('Device Disconnected');
//     // Update the [_connected] variable
//     if(!connection.isConnected)
//       _connected = false;
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     /// Get current state
//     _bluetoothSerial.state.then((value)
//     {
//       setState(() {_bluetoothState = value;});
//     });
//
//     _deviceState = 0;   /// neutral
//
//     /// If the Bluetooth of the device is not enabled,then request permission to turn on Bluetooth as the app starts up
//     enableBluetooth();
//
//     /// Listen for further state changes
//     _bluetoothSerial.onStateChanged().listen((BluetoothState value)
//     {
//       setState(() {_bluetoothState = value;});
//     });
//
//     /// For retrieving the paired devices list
//     getPairedDevices();
//   }
//
//   // To e used when the disconnection is in progress
//   bool isDisconnecting = false;
//
//   @override
//   void dispose() {
//     if(isStillConnected){
//       isDisconnecting = true;
//       connection.dispose();
//       connection = null;
//     }
//     super.dispose();
//   }
//
//   /// Get DropDownMenuItems of paired devices  (used in DropDownButton)
//   _getPairedDeviceItems(){
//     List<DropdownMenuItem<BluetoothDevice>> items = [];
//
//     if(_pairedDevicesList.isEmpty)
//       items.add(DropdownMenuItem(child: Text('No Device Available')));
//     else
//       _pairedDevicesList.forEach((blueDevice) {
//         items.add(DropdownMenuItem(child: Text(blueDevice.name),value: blueDevice,));
//       });
//     return items;
//   }
//
//   // for storing the current device connectivity status
//   bool _connected = false;
//
//   bool _isButtonUnAvailable = false;
//
//   BluetoothDevice _selectedDevice;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.redAccent,
//         child: ListView(
//           children: [
//             Switch(
//                 value: _bluetoothState.isEnabled,
//                 onChanged: (bool value){
//                   func() async{
//                     if(value)
//                       await _bluetoothSerial.requestEnable();
//                     else
//                       await _bluetoothSerial.requestDisable();
//
//                     await getPairedDevices();       // In order to update the devices list
//
//
//                     _isButtonUnAvailable  = false;
//
//                     // Disconnect from any device before
//                     // turning off Bluetooth
//                     if (_connected) {
//                       _disconnectFromBlueDevice();
//                     }
//                   }
//                   func().then((_){
//                     setState(() {});
//                   });
//                 }
//             ),
//             Row(
//               children: [
//                 DropdownButton(
//                     items: _getPairedDeviceItems(),
//                     onChanged: (value)=> setState(()=> _selectedDevice = value),
//                     value: _pairedDevicesList.isEmpty ? null : _selectedDevice,
//                 ),
//                 RaisedButton(
//                   onPressed: _isButtonUnAvailable
//                       ? null
//                       : _connected ? _disconnectFromBlueDevice : _connectToBlueDevice,
//                   child:
//                   Text(_connected ? 'Disconnect' : 'Connect'),
//                 )
//               ],
//             ),
//             // ON button
//             FlatButton(
//               onPressed: _connected
//                   ? _sendOnMessage
//                   : null,
//               child: Text("ON"),
//             ),
// // OFF button
//             FlatButton(
//               onPressed: _connected
//                   ? _sendOffMessage
//                   : null,
//               child: Text("OFF"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
// // Method to send message, for turning the Bluetooth device on
//  void _sendOnMessage()async{
//     connection.output.add(utf8.encode('1'+'\r\n'));
//     await connection.output.allSent;
//     print("device turned on");
//     setState(() {
//       _deviceState = 1;
//     });
//  }
//
//   // Method to send message, for turning the Bluetooth device off
//   void _sendOffMessage() async {
//     connection.output.add(utf8.encode("-1" + "\r\n"));
//     await connection.output.allSent;
//     print('Device Turned Off');
//     setState(() {
//       _deviceState = -1; // device off
//     });
//   }
//
// }
// */
