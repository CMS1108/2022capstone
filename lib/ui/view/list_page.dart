import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parkwhere/ui/view/datail_page.dart';
import 'package:google_fonts/google_fonts.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  static List<String> parkinglotList = [
    '1st Parkinglot',
    '2nd Parkinglot',
    '3rd Parkinglot',
    '4th Parkinglot',
    '5th Parkinglot',
    '6th Parkinglot',
    '7th Parkinglot',
  ];

  static List<String> parkinglotDistance = [
    '100m',
    '200m',
    '10m',
    '250m',
    '500m',
    '750m',
    '50m'
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: const Text('가까운 주차장 목록',
          style: TextStyle(
              color: Colors.white
          ),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: parkinglotList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (BuildContext context) {
              //       return (DetailPage());
              //     }));
              // debugPrint(parkinglotList[index]);
            },
            child: Card(
               child: ListTile(
                contentPadding: EdgeInsets.all(10),
                title: Text(parkinglotList[index],
                    style: GoogleFonts.lato(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
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
                        fontSize: 16.0,
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
