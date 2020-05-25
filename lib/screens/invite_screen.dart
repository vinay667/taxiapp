import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxiapp/widgets/custom_toolbar.dart';

import '../colors/colors.dart';

class InviteScreen extends StatefulWidget {
  InviteScreenState createState() => InviteScreenState();
}

class InviteScreenState extends State<InviteScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              CustomToolbar('Invite Friends', context),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        'Share your Friends & Get \$10',
                        style: TextStyle(
                            fontSize: 18,
                            color: MyColor.textBlueColor,
                            decoration: TextDecoration.none,
                            fontFamily: 'GilroySemibold'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 6),
                      child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummytext ever since the 1500s.',
                        style: TextStyle(
                            fontSize: 12,
                            color: MyColor.textSoft,
                            decoration: TextDecoration.none,
                            fontFamily: 'GilroyLight'),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 15),
                      child: Image.asset(
                        'images/invite.png',
                        height: 276.7,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30, left: 15),
                      child: Text(
                        'Share Your Invite Code',
                        style: TextStyle(
                            fontSize: 14,
                            color: MyColor.textBlueColor,
                            decoration: TextDecoration.none,
                            fontFamily: 'GilroySemibold'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Container(
                        child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Max3569',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 11,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'GilroySemibold'),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Image.asset(
                                    'images/invite_arrow.png',
                                    height: 27,
                                    width: 27,
                                  ),
                                ),
                              ],
                            )),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black54, width: 0.2),
                          color: Colors.white,
                        ),
                        height: 44,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(top: 0, left: 0),
                            child: Center(
                              child: Text(
                                'Invite Friends',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'GilroySemibold'),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: <Color>[
                                MyColor.gradientStart,
                                MyColor.gradientEnd
                              ],
                            ),
                            color: Colors.white,
                          ),
                          height: 45,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
