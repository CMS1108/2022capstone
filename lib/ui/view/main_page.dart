import 'package:flutter/cupertino.dart';
import 'package:parkwhere/ui/view/map_page.dart';
import 'package:parkwhere/ui/view/list_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            Container(
              width: 220.0,
              height: 60.0,
              child: OutlinedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return (MapPage());
                      }));
                },
                child: Text(
                    '지도 보기',
                ),
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue[50],
                    primary: Colors.blue,
                    shadowColor: Colors.white,
                    side: BorderSide(color: Colors.blue, width: 3.0),
                    textStyle: GoogleFonts.lato(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 5.0),),
            ),

            Container(
              height: 20.0,
            ),
            Container(
              width: 220.0,
              height: 60.0,
              child: OutlinedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return (ListPage());
                      }));
                },
                child: Text(
                  '가까운 주차장 목록',
                ),
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue[50],
                    primary: Colors.blue,
                    shadowColor: Colors.white,
                    side: BorderSide(color: Colors.blue, width: 3.0),
                    textStyle: GoogleFonts.lato(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 5.0),),
            ),
          ],
        )
      ),
    );
  }
}