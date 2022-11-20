import 'package:geolocator/geolocator.dart';

class LocationRepository{
  //final _geolocator = Geolocator();

  Future<double> getCurrentLatitude() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position.latitude;
  }
  Future<double> getCurrentLongitude() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position.longitude;
  }
}