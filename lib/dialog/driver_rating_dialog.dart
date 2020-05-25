import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../colors/colors.dart';

class DriverRatingDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartTripDialogState();
}

class StartTripDialogState extends State<DriverRatingDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
            scale: scaleAnimation,
            child: Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(33.3)),
                  child: Container(
                    height: 190,
                    child: Stack(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(0.0),
                            height: 190.0,
                            // height:double.infinity,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          height: 61,
                                          width: 61,
                                          transform: Matrix4.translationValues(
                                              0.0, -30.0, 0.0),
                                          decoration: new BoxDecoration(
                                              color: Colors.yellow,
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: new AssetImage(
                                                      "images/girl_dp.jpg")))),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 50, right: 50),
                                  child: Text(
                                    'How was your trip with Christine Mark?',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'GilroySemibold'),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 50, right: 50, top: 10),
                                  child: Text(
                                    'Logix City Center to Home',
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.black.withOpacity(0.4),
                                        decoration: TextDecoration.none,
                                        fontFamily: 'GilroySemibold'),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      'images/rting_blank.png',
                                      width: 17,
                                      height: 17,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                    ),
                                    Image.asset(
                                      'images/rting_blank.png',
                                      width: 17,
                                      height: 17,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                    ),
                                    Image.asset(
                                      'images/rting_blank.png',
                                      width: 17,
                                      height: 17,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                    ),
                                    Image.asset(
                                      'images/rting_blank.png',
                                      width: 17,
                                      height: 17,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                    ),
                                    Image.asset(
                                      'images/rting_blank.png',
                                      width: 17,
                                      height: 17,
                                    ),
                                  ],
                                ),
                                Padding(
                                  //ctPadd
                                  padding: EdgeInsets.only(top: 10),
                                ),
                              ],
                            )),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              width: 24,
                              height: 24,
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
                                  child: Image.asset(
                                'images/cross_white.png',
                                width: 8,
                                height: 8,
                              ))),
                        )
                      ],
                    ),
                  )),
            )),
      ),
    );
  }
}
