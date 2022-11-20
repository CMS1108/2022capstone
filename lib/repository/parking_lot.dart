import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ParkingLot{
    String key = "e6e03%2FEY6m0cOGi6BUs%2BFnF4wpBWjpt64e03%2BDRuqEF9wNQpzaVECQY76dpLlUfminxyM1Okra0KXsDj4uw03A%3D%3D";
    String url = "https://apis.data.go.kr/6290000/gjcitsdata/getFreeParkingSpace?serviceKey=";
    
    Future getParkingLot() async{
      var res = await http.get(Uri.parse(url + key));
    }
}