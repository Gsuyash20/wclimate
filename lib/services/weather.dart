import 'networking.dart';
import 'package:wclimate/services/location.dart';
import 'package:flutter/material.dart';

const String apikey = 'f441732799898e50615865285aa7ce22';
const String weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Location location = Location();

  Future<dynamic> getCityWeather(String cityName, BuildContext context) async {
    NetworkHelper networkHelp =
    NetworkHelper('$weatherApiUrl?q=$cityName&appid=$apikey&units=metric');
    var weatherData = await networkHelp.getData();
    if (weatherData == null) {
      // Show AlertDialog if weatherData is null
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Unable to get weather data. Please enter the correct city name."),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    return weatherData;
  }

  Future<dynamic> getWeathers(BuildContext context) async {
    await location.getCurrentLocation();
    NetworkHelper networkHelp = NetworkHelper(
        '$weatherApiUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var weatherData = await networkHelp.getData();
    if (weatherData == null) {
      // Show AlertDialog if weatherData is null
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Unable to get weather data. Please check your internet connection."),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }
}
// class WeatherDisplayData {
//   AssetImage weatherImage;
//   WeatherDisplayData({required this.weatherImage});
//   WeatherDisplayData getWeatherDisplayData(int condition) {
//     if (condition < 600) {
//       return WeatherDisplayData(
//         weatherImage: const AssetImage('images/cloud.png'),
//       );
//     } else {
//       var now = DateTime.now();
//       print (now);
//       if (now.hour >= 15) {
//         return WeatherDisplayData(
//           weatherImage: const AssetImage('images/night.png'),
//         );
//       } else {
//         return WeatherDisplayData(
//           weatherImage: const AssetImage('images/sunny.png'),
//         );
//       }
//     }
//   }
//}
