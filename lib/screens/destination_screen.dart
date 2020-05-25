import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dash/flutter_dash.dart';

import '../colors/colors.dart';

class DestinationScreen extends StatefulWidget {
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  var textController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textController.text = "Current Location";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              // Put here all widgets that are not slivers.
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, true);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Image.asset('images/back_icon.png',
                                    width: 19.3, height: 9.3),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Select Destination",
                                style: TextStyle(
                                    fontSize: 17.7,
                                    fontFamily: 'GilroySemibold',
                                    color: MyColor.appbarTitleColor),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 32,
                    ),
                    Row(children: <Widget>[
                      Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: MyColor.themeColor,
                            radius: 4,
                          ),
                          Dash(
                              direction: Axis.vertical,
                              length: 36,
                              dashLength: 4,
                              dashColor: MyColor.tripCircleBlack),
                          CircleAvatar(
                            backgroundColor: MyColor.tripCircleBlack,
                            radius: 5,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          /* Text(
                    'Current Location',

                  ),*/
                          TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.all(12),
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(20.0),
                                ),
                              ),
                            ),
                            controller: textController,
                            style: TextStyle(
                                color: MyColor.themeColor,
                                fontSize: 12,
                                fontFamily: 'GilroySemibold'),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Where to go?',
                                contentPadding: const EdgeInsets.all(12),
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(20.0),
                                  ),
                                ),
                                hintStyle: TextStyle(
                                    color: MyColor.destinationTextColorHint)),
                            style: TextStyle(
                                color: MyColor.tripTextColorPink,
                                fontSize: 12,
                                fontFamily: 'GilroySemibold'),
                          )
                        ],
                      ))
                    ]),
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: <Widget>[
                        Image.asset(
                          'images/destination_home.png',
                          height: 56,
                          width: 56,
                        ),
                        Text(
                          'Add Home',
                          style: TextStyle(
                              fontSize: 13.3,
                              fontFamily: 'GilroySemibold',
                              color: Colors.black),
                        )
                      ],
                    ),
                    Divider(
                      color: MyColor.btnBorderColor,
                    ),
                    Row(
                      children: <Widget>[
                        Image.asset(
                          'images/destination_work.png',
                          height: 56,
                          width: 56,
                        ),
                        Text(
                          'Add Work',
                          style: TextStyle(
                              fontSize: 13.3,
                              fontFamily: 'GilroySemibold',
                              color: Colors.black),
                        )
                      ],
                    ),
                    Divider(
                      color: MyColor.btnBorderColor,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'History',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'GilroySemibold'),
                    ),
                    SizedBox(
                      height: 16,
                    )
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Card(
                            elevation: 10,
                            color: MyColor.whiteColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                                height: 42,
                                width: 42,
                                padding: EdgeInsets.all(10),
                                child: Image.asset(
                                  index == 0
                                      ? 'images/home_icon.png'
                                      : "images/loc_ty.png",
                                ))),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Home',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.5,
                                    fontFamily: 'GilroySemibold'),
                              ),
                              Text(
                                'CG3-1606, Supertech Capetown, Sector 74, Noida',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: MyColor.tripDateColor,
                                    fontSize: 10.7,
                                    fontFamily: 'GilroySemibold'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: MyColor.btnBorderColor,
                    ),
                  ],
                );
              },
              childCount: 3,
            ))
          ],
        ),
      ),
    );
  }
}
