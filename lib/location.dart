import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;
  Location({this.latitude, this.longitude});
  

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);

      latitude = position.latitude;
      longitude = position.longitude;
    } on Exception catch (e) {
      print(e);
    }
  }
}
