import 'package:flutter/cupertino.dart';
import 'package:parkwhere/ui/view/map_page.dart';
import 'package:parkwhere/ui/view/list_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
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
                        return (MapPage());
                      }));
                },
                child: Text(
                  '지도'
                )),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return (ListPage());
                      }));
                },
                child: Text(
                    '리스트'
                ))
          ],
        )
      ),
    );
  }
}