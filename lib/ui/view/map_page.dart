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
  double lat = 35.176;
  double lng = 126.9075;

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
            markerImageURL: 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
            customScript: '''
          var polyline = new kakao.maps.Polygon({
            map: map,
          path: [
        new kakao.maps.LatLng(35.178809, 126.914272),
        new kakao.maps.LatLng(35.178750, 126.914263),
        new kakao.maps.LatLng(35.178617, 126.912170),
        new kakao.maps.LatLng(35.178683, 126.912179) 
    ],
strokeWeight: 2,
    strokeColor: '#FF00FF',
    strokeOpacity: 0.8,
    strokeStyle: 'dashed',
    fillColor: '#00EEEE',
    fillOpacity: 0.5
});

var polyline2 = new kakao.maps.Polygon({
            map: map,
          path: [
        new kakao.maps.LatLng(35.178809, 126.914272),
        new kakao.maps.LatLng(35.178750, 126.914263),
        new kakao.maps.LatLng(35.178617, 126.912170),
        new kakao.maps.LatLng(35.1786, 126.9121) 
    ],
strokeWeight: 2,
    strokeColor: '#FF00FF',
    strokeOpacity: 0.8,
    strokeStyle: 'dashed',
    fillColor: '#00EEEE',
    fillOpacity: 0.5
});

polyline.setMap(map);
polyline2.setMap(map);
''',
            onTapMarker: (message) async{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("clicked")));
            }),
        ],
      ),),
    );
  }
}
