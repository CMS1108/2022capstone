import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child:Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2777,
                    child: Image.network(
                        'https://mblogthumb-phinf.pstatic.net/MjAxNzEwMzFfMjA5/MDAxNTA5NDUwNjc3OTU5.IS82AyfkZj8BaOxcqK9ItRKC2rZeqLwydbdvMfEkwsog.-ODOufbo7-a4mcYeQAdP4ieRNqQTOjZCfFsQTJV_u7Ag.JPEG.gwangya777/IMG_7758.jpg?type=w800', fit: BoxFit.cover),
                    ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // 팝업창
                    },
                    style: TextButton.styleFrom(
                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
                        primary: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        minimumSize: Size(MediaQuery.of(context).size.width, 50)),
                    icon: Icon(Icons.directions_car_outlined, size: 30.0),
                    label: Text('길 안내받기', style: TextStyle(fontSize: 22),),),
                  SizedBox(height: 8.0,),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.046),
                          child: Container(child:Text('효죽공영주차장',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.lato(
                                  fontSize: 29.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),)),
                      SizedBox(width: 10.0,),
                      Chip(
                        label: Text(
                          '여성', style: TextStyle(color: Colors.deepOrange),
                        ),
                        backgroundColor: Colors.white,
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Colors.deepOrange,
                            width: 1.0,
                          ),
                        ),
                      ),
                      SizedBox(width: 6.0,),
                      Chip(
                        label: Text(
                          '장애인', style: TextStyle(color: Colors.green),
                        ),
                        backgroundColor: Colors.white,
                        shape: StadiumBorder(
                          side: BorderSide(color: Colors.green,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.046),
                      child: Container(child:Text('광주광역시 북구 용봉로138번길 11(중흥동)',
                        style: GoogleFonts.lato(
                            fontSize: 16.0,
                            color: Colors.black),),),),
                  SizedBox(height: 13.0),
                  ExpansionTile(title: Text('운영 요금',
                      style: GoogleFonts.lato(
                          fontSize: MediaQuery.of(context).size.width * (17.8 /360),
                          fontWeight: FontWeight.bold,
                          color: Colors.black)
                  ),
                  initiallyExpanded: true,
                  children: [
                    Divider(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.07),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Text('기본 요금',
                                style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            ),
                            Text('700원/30분',
                              style: GoogleFonts.lato(
                                  fontSize: 16.0,),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.045,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.07),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Text('추가 요금',
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black))
                            ),
                            Text('350원/15분',
                                style: GoogleFonts.lato(
                                    fontSize: 16.0)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],),
                  ExpansionTile(title: new Text('운영 시간',
                      style: GoogleFonts.lato(
                          fontSize: MediaQuery.of(context).size.width * (17.8 /360),
                          fontWeight: FontWeight.bold,
                          color: Colors.black)
                  ),
                    initiallyExpanded: true,
                    children: [
                      Divider(height: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.07),
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Text('평일',
                                    style: GoogleFonts.lato(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                              Text('00:00 ~ 24:00',
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.045,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.07),
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Text('토요일',
                                    style: GoogleFonts.lato(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                              Text('00:00 ~ 24:00',
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.045,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.07),
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Text('공휴일',
                                    style: GoogleFonts.lato(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                              Text('00:00 ~ 24:00',
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],),
                ],
              ),
            ),

      ),
      ),);
  }
}