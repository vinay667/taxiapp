import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taxiapp/colors/colors.dart';

class SettingsWidget extends StatelessWidget {
  SettingsWidget(this.text, this.imagePath);

  final String text, imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 30),
          child: Row(
            children: <Widget>[
              Container(
                  width: 24,
                  height: 24,
                  decoration: new BoxDecoration(
                    color: Colors.white,
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
                    imagePath,
                    height: 11.7,
                    color: MyColor.themeColor,
                    width: 12.3,
                  ))),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 3),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'GilroySemiBold',
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 30),
          child: Container(
              width: 26,
              height: 26,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: MyColor.themeColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      offset: Offset(1.0, 1.0),
                      spreadRadius: 0.0)
                ],
              ),
              child: Center(
                child: Image.asset('images/right_ab.png', width: 4, height: 8),
              )),
        ),
      ],
    );
  }
}
