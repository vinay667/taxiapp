import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:taxiapp/widgets/custom_toolbar.dart';

import '../colors/colors.dart';

class PaymentScreen extends StatefulWidget {
  PaymentState createState() => PaymentState();
}

class PaymentState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            CustomToolbar('Payment', context),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text('Book Ride',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'GilroySemiBold',
                            color: MyColor.textBlueColor,
                            decoration: TextDecoration.none)),
                  ),
                  Container(
                      height: 193,
                      child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: 10, top: 10, bottom: 20),
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(23.3)),
                                child: Container(
                                  height: 123,
                                  width: 154,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                          width: double.infinity,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, right: 10),
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Card(
                                                color: MyColor.themeColor,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Container(
                                                    width: 22,
                                                    height: 22,
                                                    child: Center(
                                                      child: Image.asset(
                                                        'images/check_icon.png',
                                                        width: 10,
                                                        height: 8,
                                                      ),
                                                    )),
                                              ),
                                            ),
                                          )),
                                      Container(
                                        width: double.infinity,
                                        padding:
                                            EdgeInsets.only(left: 10, right: 5),
                                        child: Text(
                                          'Alax Angelica',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              fontFamily: 'GilroySemiBold',
                                              fontSize: 15),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.only(
                                            left: 10, top: 8, right: 5),
                                        child: Text(
                                          '****  **** ****  7234',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontFamily: 'GilroySemiBold',
                                              fontSize: 13),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        padding:
                                            EdgeInsets.only(left: 10, top: 5),
                                        child: Text(
                                          '12/24',
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontFamily: 'GilroySemiBold',
                                              fontSize: 13),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 3, left: 2),
                                            child: Image.asset(
                                              'images/master_card.png',
                                              width: 45,
                                              height: 45,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 3, right: 10),
                                            child: Card(
                                              color: MyColor.textBlueColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Container(
                                                  width: 45,
                                                  height: 20,
                                                  child: Center(
                                                    child: Text(
                                                      'Edit',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'GilroySemiBold',
                                                          fontSize: 10,
                                                          color: Colors.white),
                                                    ),
                                                  )),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 25),
                    child: DottedBorder(
                      radius: Radius.circular(8.3),
                      borderType: BorderType.RRect,
                      color: MyColor.greyDivider22,
                      strokeWidth: 1,
                      child: Container(
                        height: 44,
                        child: Center(
                          child: Text(
                            'Add Payment Method',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'GilroySemiBold',
                                color: MyColor.textBlueColor,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 30),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry \'s standard dummytext ever since the 1500s.',
                      style: (TextStyle(
                          color: MyColor.greyTextColorForm,
                          fontFamily: 'GilroyLight',
                          decoration: TextDecoration.none,
                          fontSize: 13)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 35),
                    child: Text('Promo Code',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'GilroySemiBold',
                            color: MyColor.textBlueColor,
                            decoration: TextDecoration.none)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 25),
                    child: DottedBorder(
                      radius: Radius.circular(8.3),
                      borderType: BorderType.RRect,
                      color: MyColor.greyDivider22,
                      strokeWidth: 1,
                      child: Container(
                        height: 104,
                        child: Center(
                            child: Center(
                          child: Image.asset(
                            'images/promo.png',
                            width: 105,
                            height: 120,
                          ),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 15),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 0, left: 0),
                          child: Center(
                            child: Text(
                              'Use Payment Method',
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
                        height: 50,
                      ),
                    ),
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
