import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxiapp/widgets/custom_toolbar.dart';
import 'package:taxiapp/widgets/help_widget.dart';

import '../colors/colors.dart';

class HelpScreen extends StatefulWidget {
  HelpState createState() => HelpState();
}

class HelpState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            CustomToolbar('Help', context),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 15, top: 10),
              child: Text(
                'All Topic',
                style: (TextStyle(
                    fontSize: 18,
                    decoration: TextDecoration.none,
                    fontFamily: 'GilroySemiBold',
                    color: MyColor.textBlueColor)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 15),
              child: HelpWidget('Trip Issue & Refund'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: HelpWidget('Account & Payment Options'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: HelpWidget('A Guide'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: HelpWidget('Signing up'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: HelpWidget('Accessibility'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: HelpWidget('Using Public Transport'),
            ),
          ],
        ),
      ),
    );
  }
}
