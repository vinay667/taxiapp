import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxiapp/widgets/custom_toolbar.dart';
import 'package:taxiapp/widgets/settings_widget.dart';
import 'package:taxiapp/widgets/settings_widget_large.dart';

import '../colors/colors.dart';

class SettingsScreen extends StatefulWidget {
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            CustomToolbar('Settings', context),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Container(
                            width: 29.7,
                            height: 29.7,
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
                              'images/star.png',
                              height: 12.7,
                              color: MyColor.themeColor,
                              width: 13.3,
                            ))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Favorites',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'GilroySemiBold',
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                  ),
                  SettingsWidget('Add Home', 'images/home_pink.png'),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Divider(
                      color: MyColor.textColorgreySoft,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  SettingsWidget('Add Office', 'images/office_pink.png'),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Divider(
                      color: MyColor.textColorgreySoft,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  SettingsWidget('Add More Places', 'images/office_pink.png'),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Divider(
                      color: MyColor.textColorgreySoft,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Container(
                            width: 29.7,
                            height: 29.7,
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
                              'images/family.png',
                              height: 14.3,
                              color: MyColor.themeColor,
                              width: 14.3,
                            ))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Family',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'GilroySemiBold',
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, right: 10, left: 10),
                    child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                          height: 54.7,
                          child: SettingsLargeWidget('Set up your family',
                              'Pay for your loved ones and get trip notifications'),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Container(
                            width: 29.7,
                            height: 29.7,
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
                              'images/profile.png',
                              height: 14.3,
                              color: MyColor.themeColor,
                              width: 14.3,
                            ))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Profile',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'GilroySemiBold',
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                    child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                            height: 54.7,
                            child: SettingsLargeWidget('Add Business Profile',
                                'Separate work and personal receipts'))),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Container(
                            width: 29.7,
                            height: 29.7,
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
                              'images/sign_out.png',
                              height: 14.3,
                              color: MyColor.themeColor,
                              width: 14.3,
                            ))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'GilroySemiBold',
                              color: MyColor.themeColor,
                              decoration: TextDecoration.none),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
