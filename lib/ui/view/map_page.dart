import 'package:flutter/material.dart';
import 'package:parkwhere/repository/location_repository.dart';
import 'package:parkwhere/service/get_parking_lot.dart';
import 'package:parkwhere/service/customScript.dart';
import 'package:parkwhere/model/parking_lot.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

const String kakaoMapKey = 'e6ae5b347961bbe5188a6798c896a3fb';
class MapPage extends StatefulWidget {
  final LocationRepository data;
  // const MapPage({Key? key}) : super(key: key);
  const MapPage(this.data);
  
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Future<List<ParkingLot>> p = getParkingLot();
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    double lat = widget.data.lat;
    double lng = widget.data.lng;
    return Scaffold(
      body: FutureBuilder(
          future: p,
          builder: ((context, snapshot) {
            if(snapshot.hasData){
              List<Marker> _markers = customScript(snapshot.data);
               return GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(target: LatLng(lat, lng), zoom: 14.4746),
                markers: Set.from(_markers),
                onMapCreated: ((controller) {
                  _controller.complete(controller);
                }),
              );
            }else {
             List<Widget> children = const <Widget>[
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('지도를 불러오는 중...'),
                )
              ];
	          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: children
              )
            );
            }
          })
        )
      );
  }
}
