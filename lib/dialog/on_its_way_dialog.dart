import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/colors.dart';

class OnItsWayDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Stack(alignment: Alignment.bottomCenter, children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 42, bottom: 22),
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: CircleAvatar(
                          backgroundColor: MyColor.themeColor,
                          child: Image.asset(
                            'images/cross_white.png',
                            height: 10,
                          ),
                          radius: 12,
                        ))),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "On Its Way!",
                  style: TextStyle(
                      fontSize: 14.7,
                      fontFamily: 'GilroySemibold',
                      fontWeight: FontWeight.w600,
                      color: MyColor.appbarTitleColor),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 46, right: 46, top: 12),
                    child: Text(
                      "Your driver is on its way to the restaurant.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 10.7,
                          fontFamily: 'GilroySemibold',
                          fontWeight: FontWeight.w600,
                          color: MyColor.dialog_subTitle),
                    )),
                SizedBox(height: 48.0),
              ],
            ),
          ),
          Container(
              height: 44,
              width: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  image: DecorationImage(
                      image: AssetImage('images/button_back.png'),
                      fit: BoxFit.fill)),
              child: Text(
                'OK',
                style: TextStyle(
                    fontSize: 10.7,
                    fontFamily: 'GilroySemibold',
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              )),
        ]),
        Positioned(
          left: 8,
          right: 8,
          child: Image.asset(
            'images/loc_trip.png',
            height: 92,
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    );
  }
}
