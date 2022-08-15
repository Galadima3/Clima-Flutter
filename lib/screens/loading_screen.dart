// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:clima/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '5e0838499a5a0ccfb86fc5166fed695f';
const urlApi = '';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        apiEndPoint:
            'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return LocationScreen(
          locationWeather: weatherData,
        );
      },
    ));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
