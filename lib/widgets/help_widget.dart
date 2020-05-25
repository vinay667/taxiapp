import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxiapp/colors/colors.dart';

class HelpWidget extends StatelessWidget {
  HelpWidget(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          height: 44.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 15,
                      color: MyColor.textBlueColor,
                      decoration: TextDecoration.none,
                      fontFamily: 'GilroySemibold'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Container(
                    width: 27.3,
                    height: 27.3,
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
                      child: Image.asset('images/right_ab.png',
                          width: 5, height: 9),
                    )),
              ),
            ],
          ),
        ));
  }
}
