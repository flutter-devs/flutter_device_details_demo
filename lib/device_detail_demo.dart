
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceDetailDemo extends StatefulWidget {


  @override
  _DeviceDetailDemoState createState() => _DeviceDetailDemoState();
}

class _DeviceDetailDemoState extends State<DeviceDetailDemo> {

  String deviceName ='';
  String deviceVersion ='';
  String identifier= '';

  Future<void>_deviceDetails() async{
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        setState(() {
          deviceName = build.model;
          deviceVersion = build.version.toString();
          identifier = build.androidId;
        });
        //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        setState(() {
          deviceName = data.name;
          deviceVersion = data.systemVersion;
          identifier = data.identifierForVendor;
        });//UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text("Flutter Device Details Demo"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              padding: EdgeInsets.all(14),
              color: Colors.cyan[50],
              onPressed: (){
                _deviceDetails();
              },
              child: Text("Device Details",
                style: TextStyle(color: Colors.black),),
            ),
            deviceVersion.isNotEmpty && deviceName.isNotEmpty
                && identifier.isNotEmpty?
            Column(
              children: [
                SizedBox(height: 30,),
                Text("Device Name:- "+deviceName,style: TextStyle
                  (color: Colors.red,
                    fontWeight: FontWeight.bold)),
                SizedBox(height: 30,),
                Text("Device Version:- "+deviceVersion,style: TextStyle
                  (color: Colors.red,
                    fontWeight: FontWeight.bold)),
                SizedBox(height: 30,),
                Text("Device Identifier:- "+identifier,style: TextStyle
                  (color: Colors.red,
                    fontWeight: FontWeight.bold)),
                SizedBox(height: 30,),
              ],
            ): Container(),
          ],
        ),
      ),
    );
  }
}