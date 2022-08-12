// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:clima/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
     Location location = Location();
     await location.getCurrentLocation();
     print(location.latitude);
     print(location.longitude);
  }
  @override
  void initState() {
    super.initState();
    getLocation();
   
    //getLocation();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
