import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:parkwhere/repository/location_repository.dart';

const String kakaoMapKey = 'e6ae5b347961bbe5188a6798c896a3fb';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _locationRepository = LocationRepository();
  double lat = 35.172909;
  double lng = 126.911671;


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;

    return Scaffold(
      body: SafeArea(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          KakaoMapView(
            width: width,
            height: newheight,
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
