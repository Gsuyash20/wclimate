import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wclimate/screens/location_screen.dart';
import 'package:wclimate/services/location.dart';
import 'package:flutter/material.dart';
import 'package:wclimate/services/networking.dart';

const String apikey = '';
const String weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {

  Future<void> getLocation() async {
    // bool isLocationServiceEnabled  = await Geolocator.isLocationServiceEnabled();
    // if(!isLocationServiceEnabled){
    //   await Geolocator.openLocationSettings();
    // }
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$weatherApiUrl?lat=${location.latitude}&'
        'lon=${location.longitude}&appid=$apikey&units=metric');
    var weatherData = await networkHelper.getData();
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(locationWeather: weatherData,);
        },
      ),
    );
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
