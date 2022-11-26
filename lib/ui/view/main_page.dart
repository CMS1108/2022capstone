import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:parkwhere/service/background_service.dart';
import 'package:parkwhere/ui/view/map_page.dart';
import 'package:flutter/material.dart';
import 'package:parkwhere/service/notification.dart';
import 'package:parkwhere/service/permission.dart';
import 'package:parkwhere/repository/location_repository.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var isSwitched = false;
  LocationRepository repo = LocationRepository();

  @override
  void initState(){
    super.initState();
    initNotification();
    getPermission();
    repo.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return (MapPage(repo));
                      }));
                },
                child: Text(
                  '지도'
                )),
                Switch(value: isSwitched, onChanged: ((value) async{
                  WidgetsFlutterBinding.ensureInitialized();
                  var status = await FlutterBackgroundService().isRunning();
                  setState(() {
                    isSwitched = value;
                    if(isSwitched){
                      backgroundInitialize();
                    }
                    else{
                      if(status) FlutterBackgroundService().invoke("stopService");
                    }
                  });
                }))
          ],
        )
      ),
    );
  }
}