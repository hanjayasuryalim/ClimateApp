import 'package:cllima/views/location_screen.dart';
import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '3458a4b21e4ec56d2bd3bd41df9a3cbc';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String cityName;
  int weatherId;
  double temp;

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=${location.getLatitude()}&lon=${location.getLongitude()}&appid=$apiKey&units=metric";
    NetworkHelper networkHelper = NetworkHelper(url: url);

    var decodedData = await networkHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: decodedData,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}
