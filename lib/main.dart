import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:parkwhere/ui/view/main_page.dart';
import 'package:parkwhere/service/background_service.dart';
import 'package:provider/provider.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'dart:io';
import 'package:get/get.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(
    nativeAppKey: '129c8c04e6a29d7f57d7f1f1238c0143',
    javaScriptAppKey: 'e6ae5b347961bbe5188a6798c896a3fb',
  );
  HttpOverrides.global = MyHttpOverrides();
  runApp(GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // 세로 정방향
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '주정차 알리미',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}