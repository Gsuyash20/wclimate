import 'networking.dart';
import 'package:wclimate/services/location.dart';

const String apikey = '';
const String weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Location location = Location();

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelp =
        NetworkHelper('$weatherApiUrl?q=$cityName&appid=$apikey&units=metric');
    var weatherData = await networkHelp.getData();
    return weatherData;
  }
  Future<dynamic> getWeathers() async {
    await location.getCurrentLocation();
    NetworkHelper networkHelp = NetworkHelper(
        '$weatherApiUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var weatherData = await networkHelp.getData();
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
