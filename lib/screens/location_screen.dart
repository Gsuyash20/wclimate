import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:wclimate/screens/city_screen.dart';
import 'package:wclimate/utils/constants.dart';
import 'package:wclimate/services/weather.dart';
import '../utils/slide_up_panel.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationWeather});
  final dynamic locationWeather;

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  late int temperature;
  dynamic cityName;
  dynamic condition;
  late String weatherIcon;
  dynamic sunriseTime;
  dynamic sunsetTime;
  bool isDay = true;
  dynamic currentTime;
  dynamic feelTemp;
  dynamic humidity;
  dynamic pressure;
  dynamic weatherDescription;
  dynamic visibility;
  dynamic speed;
  DateTime? lastPressed;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
    checkDayOrNight(widget.locationWeather);
    weatherDetails(widget.locationWeather);
  }

  void weatherDetails(dynamic weatherData) {
    setState(() {
      double doubleFeelTemp = weatherData['main']['feels_like'];
      feelTemp = doubleFeelTemp.toInt();
      humidity = weatherData['main']['humidity'];
      pressure = weatherData['main']['pressure'];
      weatherDescription = weatherData['weather'][0]['description'];
      double doublevisibility = weatherData['visibility'] / 1000.toInt();
      visibility = doublevisibility.toInt();
      double doubleSpeed = weatherData['wind']['speed'] * 3.6.toInt();
      speed = doubleSpeed.toInt();
    });
  }

  void checkDayOrNight(dynamic weatherData) {
    setState(() {
      sunriseTime = weatherData['sys']['sunrise'];
      sunsetTime = weatherData['sys']['sunset'];
      currentTime = weatherData['dt'];
    });
    var rise = DateTime.fromMillisecondsSinceEpoch(sunriseTime * 1000);
    var set = DateTime.fromMillisecondsSinceEpoch(sunsetTime * 1000);
    var cur = DateTime.fromMillisecondsSinceEpoch(currentTime * 1000);
    // print(currentTime);
    // print(cur.hour);
    if (cur.hour >= rise.hour && cur.hour < set.hour) {
      setState(() {
        isDay = true;
      });
    } else {
      setState(() {
        isDay = false;
      });
    }
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        cityName = 'unable to get data';
      }
    });
    setState(() {
      double temp = weatherData['main']['temp'];
      cityName = weatherData['name'];
      condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      temperature = temp.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.07;
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.8;
    return Scaffold(
        body: WillPopScope(
          onWillPop: () async{
            final now = DateTime.now();
            const maxDuration = Duration(seconds: 2);
            final isWarning = lastPressed == null || now.difference(lastPressed!) > maxDuration;
            if(isWarning){
              lastPressed = DateTime.now();
               const snackBar = SnackBar(
                content: Text('Tap back again to leave'),
                 duration: maxDuration,
              );
               ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(snackBar);
               return false;
            }
            else {
              if(Platform.isAndroid){
                SystemNavigator.pop();
              }
              return true;
            }
          },
          child: SlidingUpPanel(
      collapsed: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 8,
            width: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[300],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Weather Details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
      ]),
      borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
      ),
      color: Colors.transparent.withOpacity(0.4),
      minHeight: panelHeightClosed,
      maxHeight: panelHeightOpen,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: isDay
                  ? const AssetImage('images/sunny.png')
                  : const AssetImage('images/night_bet.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          constraints: const BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () async {
                        var weatherData = await weather.getWeathers();
                        updateUI(weatherData);
                        checkDayOrNight(weatherData);
                      },
                      child: const Icon(
                        Icons.near_me,
                        size: 40.0,
                        color: Colors.white70,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        var typedName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const CityScreen();
                            },
                          ),
                        );
                        if (typedName != null) {
                          var cityData = await weather.getCityWeather(typedName);
                          updateUI(cityData);
                          checkDayOrNight(cityData);
                        }
                      },
                      child: const Icon(
                        Icons.search,
                        size: 40.0,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    )),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Center(
                      child: Text(' $temperature°', style: kTempTextStyle),
                    ),
                    Center(
                      child: Text(
                        ' $cityName',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ),
      panelBuilder: (controller) => PanelWidget(
          controller: controller,
          humidity: humidity,
          feelTemp: feelTemp,
          speed: speed,
          weatherDescription: weatherDescription,
          visibility: visibility,
          pressure: pressure,
      ),
    ),
        ));
  }
}
