

import 'package:flutter/material.dart';
import 'package:taxiapp/colors/colors.dart';

class SettingsLargeWidget extends StatelessWidget
{
  SettingsLargeWidget(this.title,this.subtitle);
  final String title,subtitle;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 13, left: 10),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    decoration: TextDecoration.none,
                    fontFamily: 'GilroySemibold'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, left: 10),
              child: Text(
                subtitle,
                style: TextStyle(
                    color: MyColor.textSoft,
                    fontSize: 9,
                    decoration: TextDecoration.none,
                    fontFamily: 'GilroySemibold'),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Container(
              width: 27,
              height: 27,
              decoration: new BoxDecoration(
                color: MyColor.themeColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      offset: Offset(1.0, 1.0),
                      spreadRadius: 0.0)
                ],
              ),
              child: Center(
                  child: Image.asset(
                    'images/right_ab.png',
                    height: 9,
                    width: 5,
                  ))),
        ),
      ],
    );



  }
}