import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_navi.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:parkwhere/ui/widget/remain_stat_widget.dart';

const String kakaoMapKey = 'e6ae5b347961bbe5188a6798c896a3fb';


class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

Future _NaviConnect() async{
  bool result = await NaviApi.instance.isKakaoNaviInstalled();
  if (result) {
    print('카카오내비 앱으로 길안내 가능');
    await NaviApi.instance.shareDestination(
      destination: Location(name: '카카오', x: '127.0324286', y: '37.5074276'),
      option: NaviOption(coordType: CoordType.wgs84),
    );
  } else {
    print('카카오내비 미설치');
    // 카카오내비 설치 페이지로 이동
    launchBrowserTab(Uri.parse(NaviApi.webNaviInstall));
  }
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {

    var name = '효죽공영주차장';
    var address = '광주광역시 북구 용봉로138번길 11(중흥동)';
    var tel = 01071769856;
    var totalAbleCnt = 260;
    var ableCnt = 32;


    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.blue[300],
        middle: Text('주차장 정보',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                fontSize: 21.0,
                color: Colors.white)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child:Container(
              child: Column(
                children: [
                  SizedBox(height: 7.0),
                  Text('${name}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(height: 4.0,),
                  Text('${address}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        fontSize: 17.0,
                        color: Colors.black)),
                  SizedBox(height: 13.0),
                  KakaoMapView(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.35,
                    kakaoMapKey: kakaoMapKey,
                    lat: 35.172909,
                    lng: 126.911671,
                    showMapTypeControl: false,
                    showZoomControl: false,
                    markerImageURL: 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
                  ),

                  // ElevatedButton.icon(
                  //   onPressed: () {
                  //     _NaviConnect();
                  //   },
                  //   style: TextButton.styleFrom(
                  //       shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
                  //       primary: Colors.white,
                  //       backgroundColor: Colors.blueAccent,
                  //       minimumSize: Size(MediaQuery.of(context).size.width, 50)),
                  //   icon: Icon(Icons.directions_car_outlined, size: 30.0),
                  //   label: Text('길 안내받기', style: TextStyle(fontSize: 22),),),
                  // SizedBox(height: 8.0,),
                  // Row(
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.046),
                  //         child: Container(child:Text('효죽공영주차장',
                  //             textAlign: TextAlign.center,
                  //             style: GoogleFonts.lato(
                  //                 fontSize: 30.0,
                  //                 fontWeight: FontWeight.bold,
                  //                 color: Colors.black)),)),
                  //     SizedBox(width: 10.0,),
                  //     Chip(
                  //       label: Text(
                  //         '여성', style: TextStyle(color: Colors.deepOrange),
                  //       ),
                  //       backgroundColor: Colors.white,
                  //       shape: StadiumBorder(
                  //         side: BorderSide(
                  //           color: Colors.deepOrange,
                  //           width: 1.0,
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(width: 6.0,),
                  //     Chip(
                  //       label: Text(
                  //         '장애인', style: TextStyle(color: Colors.green),
                  //       ),
                  //       backgroundColor: Colors.white,
                  //       shape: StadiumBorder(
                  //         side: BorderSide(color: Colors.green,
                  //           width: 1.0,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.046),
                  //     child: Container(child:Text('광주광역시 북구 용봉로138번길 11(중흥동)',
                  //       textAlign: TextAlign.center,
                  //       style: GoogleFonts.lato(
                  //           fontSize: 16.0,
                  //           color: Colors.black),),),),

                  SizedBox(height: 8.0),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(flex: 1, child: SizedBox()),
                        // 전화하기
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: new TextButton(
                                  onPressed: () => launchUrl(Uri.parse('tel://${tel}')),
                                  child: new Icon(Icons.call,
                                      color: Colors.blue[600], size: 53),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                    "전화하기",
                                    style: GoogleFonts.lato(
                                        fontSize: 18.0,
                                        color: Colors.black)
                                ),
                              ),
                            ],
                          ),
                        ),

                        // 길찾기
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: new TextButton(
                                  onPressed: () {
                                    _NaviConnect();
                                  },
                                  child: new Icon(Icons.directions,
                                      color: Colors.blue[600], size: 53),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                    "길찾기",
                                    style: GoogleFonts.lato(
                                        fontSize: 18.0,
                                        color: Colors.black)
                                ),
                              ),
                            ],
                          ),
                        ),
                        // 네이버플레이스
                        // Expanded(
                        //   flex: 4,
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: <Widget>[
                        //       Container(
                        //         child: new TextButton(
                        //           onPressed: () => launchUrl(Uri.parse("http://naver.me/FpXDUoP8")),
                        //           child: new Icon(Icons.place,
                        //               color: Colors.blue[600], size: 53),
                        //         ),
                        //       ),
                        //       Container(
                        //         margin: const EdgeInsets.only(top: 5.0),
                        //         child: Text(
                        //             "네이버플레이스",
                        //             style: GoogleFonts.lato(
                        //                 fontSize: 18.0,
                        //                 color: Colors.black)
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Expanded(flex: 1, child: SizedBox()),],
                  ),),
                  SizedBox(height: 18.0),
                  RemainStat(),

                  // ExpansionTile(title: Text('운영 요금',
                  //     style: GoogleFonts.lato(
                  //         fontSize: MediaQuery.of(context).size.width * (17.8 /360),
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.black)
                  // ),
                  // initiallyExpanded: true,
                  // children: [
                  //   Divider(height: 10,),
                  //   Container(
                  //     width: MediaQuery.of(context).size.width,
                  //     height: MediaQuery.of(context).size.height * 0.04,
                  //     child: Padding(
                  //       padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.07),
                  //       child: Row(
                  //         children: [
                  //           SizedBox(
                  //             width: MediaQuery.of(context).size.width * 0.25,
                  //             child: Text('기본 요금',
                  //               style: GoogleFonts.lato(
                  //                   fontSize: 16.0,
                  //                   fontWeight: FontWeight.bold,
                  //                   color: Colors.black)),
                  //           ),
                  //           Text('700원/30분',
                  //             style: GoogleFonts.lato(
                  //                 fontSize: 16.0,),),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  //   SizedBox(
                  //     height: 8,
                  //   ),
                  //   Container(
                  //     width: MediaQuery.of(context).size.width,
                  //     height: MediaQuery.of(context).size.height * 0.045,
                  //     child: Padding(
                  //       padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.07),
                  //       child: Row(
                  //         children: [
                  //           SizedBox(
                  //             width: MediaQuery.of(context).size.width * 0.25,
                  //             child: Text('추가 요금',
                  //                 style: GoogleFonts.lato(
                  //                     fontSize: 16.0,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.black))
                  //           ),
                  //           Text('350원/15분',
                  //               style: GoogleFonts.lato(
                  //                   fontSize: 16.0)),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  //   SizedBox(
                  //     height: 8,
                  //   ),
                  // ],),
                  // ExpansionTile(title: new Text('운영 시간',
                  //     style: GoogleFonts.lato(
                  //         fontSize: MediaQuery.of(context).size.width * (17.8 /360),
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.black)
                  // ),
                  //   initiallyExpanded: true,
                  //   children: [
                  //     Divider(height: 10,),
                  //     Container(
                  //       width: MediaQuery.of(context).size.width,
                  //       height: MediaQuery.of(context).size.height * 0.04,
                  //       child: Padding(
                  //         padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.07),
                  //         child: Row(
                  //           children: [
                  //             SizedBox(
                  //               width: MediaQuery.of(context).size.width * 0.25,
                  //               child: Text('평일',
                  //                   style: GoogleFonts.lato(
                  //                       fontSize: 16.0,
                  //                       fontWeight: FontWeight.bold,
                  //                       color: Colors.black)),
                  //             ),
                  //             Text('00:00 ~ 24:00',
                  //                 style: GoogleFonts.lato(
                  //                     fontSize: 16.0)),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: 8,
                  //     ),
                  //     Container(
                  //       width: MediaQuery.of(context).size.width,
                  //       height: MediaQuery.of(context).size.height * 0.045,
                  //       child: Padding(
                  //         padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.07),
                  //         child: Row(
                  //           children: [
                  //             SizedBox(
                  //               width: MediaQuery.of(context).size.width * 0.25,
                  //               child: Text('토요일',
                  //                   style: GoogleFonts.lato(
                  //                       fontSize: 16.0,
                  //                       fontWeight: FontWeight.bold,
                  //                       color: Colors.black)),
                  //             ),
                  //             Text('00:00 ~ 24:00',
                  //                 style: GoogleFonts.lato(
                  //                     fontSize: 16.0)),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: 8,
                  //     ),
                  //     Container(
                  //       width: MediaQuery.of(context).size.width,
                  //       height: MediaQuery.of(context).size.height * 0.045,
                  //       child: Padding(
                  //         padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.07),
                  //         child: Row(
                  //           children: [
                  //             SizedBox(
                  //               width: MediaQuery.of(context).size.width * 0.25,
                  //               child: Text('공휴일',
                  //                   style: GoogleFonts.lato(
                  //                       fontSize: 16.0,
                  //                       fontWeight: FontWeight.bold,
                  //                       color: Colors.black)),
                  //             ),
                  //             Text('00:00 ~ 24:00',
                  //                 style: GoogleFonts.lato(
                  //                     fontSize: 16.0)),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: 8,
                  //     ),
                    ],),

              ),
            ),

        ),
      );
  }
}