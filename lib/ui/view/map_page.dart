import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:geolocator/geolocator.dart';
import 'package:parkwhere/repository/location_repository.dart';
import 'package:parkwhere/ui/view/datail_page.dart';
import 'package:parkwhere/viewmodel/parking_lot_model.dart';
import 'package:provider/provider.dart';

const String kakaoMapKey = 'e6ae5b347961bbe5188a6798c896a3fb';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _locationRepository = LocationRepository();
  double lat = 33.450701;
  double lng = 126.570667;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          KakaoMapView(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            kakaoMapKey: kakaoMapKey,
            lat: lat,
            lng: lng,
            showMapTypeControl: true,
            showZoomControl: true,
            markerImageURL: 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',

          ),
        ],
      ),),
    );
  }
}
