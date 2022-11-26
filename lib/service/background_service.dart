import 'package:latlong2/latlong.dart';
import 'dart:async';
import 'dart:ui';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_background_service_ios/flutter_background_service_ios.dart';
import 'package:parkwhere/repository/location_repository.dart';


void backgroundInitialize() async{
  final service = FlutterBackgroundService();
  await service.configure(iosConfiguration: IosConfiguration(), androidConfiguration: AndroidConfiguration(onStart: backgroundService, isForegroundMode: false));
  service.startService();
}

@pragma('vm:entry-point')
void backgroundService(ServiceInstance service){
  DartPluginRegistrant.ensureInitialized();
  var _locationRepository = LocationRepository();
  List<List<LatLng>> restricted = [
    [LatLng(35.17648, 126.91260), LatLng(35.17651, 126.91443)],
    [LatLng(35.17548, 126.91266), LatLng(35.17558, 126.91431)],
    [LatLng(35.17568, 126.91675), LatLng(35.17560, 126.91672)],
    [LatLng(35.17527, 126.91650), LatLng(35.17510, 126.91618)],
    [LatLng(35.17500, 126.91572), LatLng(35.17506, 126.91484)],
    [LatLng(35.17507, 126.91451), LatLng(35.17449, 126.91309)]
  ];
  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }
  service.on('stopService').listen((event) {
    service.stopSelf();
  });
  Timer.periodic(Duration(seconds: 1), (timer) async {
    await _locationRepository.getCurrentPosition();
  });
}
