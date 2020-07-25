import 'package:geolocator/geolocator.dart';

class Location {
  double _latitude;
  double _longitude;

  double getLatitude() {
    return this._latitude;
  }

  double getLongitude() {
    return this._longitude;
  }

  Future<void> getCurrentLocation() async {
    try {
      Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      this._longitude = position.longitude;
      this._latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
