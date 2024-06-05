import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } on PermissionDeniedException catch (e) {
      print('Location permissions are denied: $e');
      throw Exception('Location permissions are denied');
    } on LocationServiceDisabledException catch (e) {
      print('Location services are disabled: $e');
      throw Exception('Location services are disabled');
    } catch (e) {
      print('An unknown error occurred: $e');
      throw Exception('An unknown error occurred');
    }
  }
}
