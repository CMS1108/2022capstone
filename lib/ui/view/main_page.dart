import 'package:flutter/cupertino.dart';
import 'package:parkwhere/ui/view/map_page.dart';
import 'package:parkwhere/ui/view/list_page.dart';
import 'package:flutter/material.dart';
import 'package:parkwhere/service/notification.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var isSwitched = false;
  @override
  Widget build(BuildContext context) {
    initNotification();
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
                        return (MapPage());
                      }));
                },
                child: Text(
                  '지도'
                )),
                Switch(value: isSwitched, onChanged: ((value) {
                  setState(() {
                    isSwitched = value;
                    if(isSwitched) showNotification();
                  });
                }))
          ],
        )
      ),
    );
  }
}