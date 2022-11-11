import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RemainStat extends StatelessWidget{
  var totalAbleCnt = 260;
  var ableCnt = 23;
  var color = Colors.white;
  @override
  Widget build(BuildContext context) {
    if(ableCnt == 0){
      return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          //border: Border.all(color: Colors.black12, width: 3),
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.red[300]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 1,
              child: Image.asset('assets/images/tears.png', width: 20.0),
            ),
            SizedBox(
              width: 22.0,
            ),
            Expanded(
                flex: 4,
                child: Text(
                    '현재 주차 가능 구역이 없어요',
                    style: GoogleFonts.lato(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)
                )
            )

          ],
        ),
      );
    } else{
      var stext, icon;
      if(ableCnt < 10){
        stext = '보통';
        icon = 'assets/images/neutral.png';
      } else{
        stext = '충분';
        icon = 'assets/images/smile.png';
      }

      return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blue[50]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 1,
              child: Image.asset('${icon}', width: 20.0,),
            ),
            SizedBox(
              width: 22.0,
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('현재 주차 가능 구역 : ',
                      style: GoogleFonts.lato(
                          fontSize: 19.0,
                          color: Colors.grey[700])),
                  Row(
                    children: [
                      Text('${stext}',
                          style: GoogleFonts.lato(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800])),
                      SizedBox(width: 23.0,),
                      Text(
                          '${ableCnt}',
                          style: GoogleFonts.lato(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800])
                      ),
                      Text(
                          '  /  ${totalAbleCnt}',
                          style: GoogleFonts.lato(
                              fontSize: 25.0,
                              color: Colors.grey[800])
                      ),
                    ],
                  )

                ],
              ),
            )

          ],
        ),
      );
    }
  }
}