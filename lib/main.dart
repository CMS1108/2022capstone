import 'package:flutter/material.dart';
import 'package:parkwhere/ui/view/main_page.dart';
import 'package:parkwhere/viewmodel/parking_lot_model.dart';
import 'package:provider/provider.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(
    nativeAppKey: '129c8c04e6a29d7f57d7f1f1238c0143',
    javaScriptAppKey: '129c8c04e6a29d7f57d7f1f1238c0143',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ParkingWhere',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}