import 'package:flutter/cupertino.dart';
import 'package:parkwhere/ui/view/map_page.dart';
import 'package:parkwhere/ui/view/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool alarmOn = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;

    return Scaffold(
      backgroundColor: CupertinoColors.systemGrey4,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: newheight * 0.2,
              padding: EdgeInsets.only(top: 20.0, left: 5.0, bottom: 20.0),
              child: Row(
                children: [
                  SizedBox(width: 15.0),
                  Image.asset('assets/images/logo.jpg', width: MediaQuery.of(context).size.height * 0.14,),
                  SizedBox(width: 18.0),
                  Text('주정차 알리미', style: GoogleFonts.lato(
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
                ],
              ),
            ),

            Container(
              height: newheight * 0.76,
              margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: newheight * 0.04),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: CupertinoColors.systemGrey6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  SizedBox(
                    height: newheight * 0.25,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.61,
                    height: newheight * 0.13,
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
                          backgroundColor: CupertinoColors.systemTeal,
                          primary: CupertinoColors.systemGrey6,
                          shadowColor: Colors.white,
                          //side: BorderSide(color: Colors.white, width: 3.0),
                          textStyle: GoogleFonts.lato(
                              fontSize: 27.0,
                              fontWeight: FontWeight.w600
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          elevation: 8.0),),
                  ),
                  // SizedBox(
                  //   height: 20.0,
                  // ),
                  // Container(
                  //   width: 245.0,
                  //   height: 70.0,
                  //   child: OutlinedButton(
                  //     onPressed: (){
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (BuildContext context) {
                  //             return (DetailPage());
                  //           }));
                  //     },
                  //     child: Text(
                  //       '상세페이지(임시)',
                  //     ),
                  //     style: OutlinedButton.styleFrom(
                  //         backgroundColor: CupertinoColors.systemBlue,
                  //         primary: CupertinoColors.systemGrey6,
                  //         shadowColor: Colors.white,
                  //         //side: BorderSide(color: Colors.blue, width: 3.0),
                  //         textStyle: GoogleFonts.lato(
                  //             fontSize: 25.0,
                  //             fontWeight: FontWeight.w600
                  //         ),
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(20.0),
                  //         ),
                  //         elevation: 5.0),),
                  // ),
                  SizedBox(
                    height: newheight * 0.215,
                  ),
                  Container(
                    height: newheight * 0.165,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Icon(
                              alarmOn ? Icons.alarm_on : Icons.alarm_off,
                              color: alarmOn
                                  ? CupertinoColors.systemBlue
                                  : CupertinoColors.systemRed,
                              size: 35,
                            ),
                            Text(
                                alarmOn? '  주정차 금지구역 알림 켜짐' : '  주정차 금지구역 알림 꺼짐',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700])),
                          ],
                        ),
                        SizedBox(height: 4.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                alarmOn? '알림 끄기  ' : '알람 켜기  ',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    fontSize: 21.0,
                                    color: alarmOn? CupertinoColors.systemRed : CupertinoColors.systemBlue)),
                            CupertinoSwitch(
                                value: alarmOn,
                                activeColor: CupertinoColors.systemRed,
                                trackColor: CupertinoColors.systemBlue.withOpacity(0.2),
                                onChanged: (bool value) {
                                  setState(() {
                                    alarmOn = value;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
              ]
            ),
        ),])
      ),
    );
}}