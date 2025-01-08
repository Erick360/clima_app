import 'package:geolocator/geolocator.dart';

class Location{
  double? latitude;
  double? longitude;

   Future<void> getCurrentLocation() async{

    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    try {
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings());

      latitude = position.latitude;
      longitude = position.longitude;

    }catch(e){
      print(e);
    }
  }
}