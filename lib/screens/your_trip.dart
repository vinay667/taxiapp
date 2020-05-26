import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:taxiapp/widgets/custom_toolbar.dart';

import '../colors/colors.dart';

class YourTrip extends StatefulWidget {
  @override
  _YourTripState createState() => _YourTripState();
}

class _YourTripState extends State<YourTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          CustomToolbar('Your Trips', context),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 5,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      color: MyColor.whiteColor,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.7)),
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 48.7,
                                        width: 49,
                                        decoration: BoxDecoration(
                                          color: MyColor.greyTextColorCard,
                                          borderRadius:
                                              BorderRadius.circular(8.3),
                                        ),
                                        child: Image.asset(
                                          'images/car_1.png',
                                          height: 45,
                                        ),
                                      ),
                                      Container(
                                          height: 40,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                width: 126,
                                                padding: EdgeInsets.only(
                                                    left: 5, right: 5),
                                                child: Text(
                                                  'Honda city',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontFamily:
                                                          'GilroySemiBold'),
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(
                                                  'DL45 L 3452',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: MyColor
                                                          .greyTextColorForm,
                                                      fontFamily:
                                                          'GilroySemiBold'),
                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(right: 5),
                                        height: 40,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                              width: 90,
                                              child: Text(
                                                'Christine',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontFamily:
                                                        'GilroySemiBold'),
                                              ),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Image.asset(
                                                  'images/rating.png',
                                                  width: 11,
                                                  height: 11,
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    '4.5',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: MyColor
                                                            .greyTextColorForm,
                                                        fontFamily:
                                                            'GilroySemiBold'),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                          height: 34.3,
                                          width: 34.3,
                                          transform: Matrix4.translationValues(
                                              0.0, -8.0, 0.0),
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: new AssetImage(
                                                      "images/girl_dp.jpg")))),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundColor: MyColor.themeColor,
                                        radius: 4,
                                      ),
                                      Dash(
                                          direction: Axis.vertical,
                                          length: 18,
                                          dashLength: 4,
                                          dashColor: MyColor.tripCircleBlack),
                                      CircleAvatar(
                                        backgroundColor:
                                            MyColor.tripCircleBlack,
                                        radius: 5,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: 220,
                                        child: Text(
                                          'Capetown, Sector 74, Noida',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: MyColor.themeColor,
                                              fontSize: 13.5,
                                              fontFamily: 'GilroySemibold'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                        width: 220,
                                        child: Text(
                                          'Logix City Center, Sector 38, Noida',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: MyColor.tripTextColorBlack,
                                              fontSize: 13.5,
                                              fontFamily: 'GilroyMedium'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  CircleAvatar(
                                    radius: 26,
                                    backgroundColor: MyColor.tripCarBack,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '\u0024324',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontFamily: 'GilroySemibold'),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'Paid',
                                          style: TextStyle(
                                              color: MyColor.tripPaidTextColor,
                                              fontSize: 8,
                                              fontFamily: 'GilroySemibold'),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
