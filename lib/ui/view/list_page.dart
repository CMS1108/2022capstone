import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:parkwhere/ui/view/datail_page.dart';
import 'package:google_fonts/google_fonts.dart';

//Position position = await _locationRepository.getCurrentLocation();

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  static List<String> parkinglotList = [
    '효죽공영주차장',
    '광주학생교육문화회관주차장',
    '용강공영주차장',
    '풍암호수공원 주차장',
    '상무시민공원주차장',
    '월드컵경기장 주차장',
    '광주향교공영주차장',
  ];

  static List<String> parkinglotDistance = [
    '10m',
    '52m',
    '200m',
    '270m',
    '502m',
    '1020m',
    '1054m'
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.blue[300],
        middle: Text('가까운 주차장 목록',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                fontSize: 21.0,
                color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: parkinglotList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return (DetailPage());
                  }));
              debugPrint(parkinglotList[index]);
            },
            child: Card(
               child: ListTile(
                contentPadding: EdgeInsets.all(10),
                title: Text(parkinglotList[index],
                    style: GoogleFonts.lato(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                // leading: SizedBox(
                //   height: 50,
                //   width: 50,
                //   child: const Icon(
                //     Icons.local_parking_rounded,
                //     color: Colors.lightBlue,
                //     size: 40,
                //   ),
                // ),
                trailing: Text(
                  parkinglotDistance[index],
                    style: GoogleFonts.lato(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.cyan),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
