import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxiapp/colors/colors.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:taxiapp/screens/confirmation_screen.dart';
import 'package:taxiapp/screens/destination_screen.dart';
import 'package:taxiapp/screens/on_trip_screen.dart';
import 'package:taxiapp/screens/payment_screen.dart';
import 'package:taxiapp/screens/profile_screen.dart';
import 'package:taxiapp/screens/select_cab_screen.dart';
import 'package:taxiapp/screens/settings_screen.dart';
import 'package:taxiapp/screens/your_trip.dart';

import 'help_screen.dart';
import 'invite_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _mapStyle;
  BitmapDescriptor pinLocationIcon;
  GoogleMapController mapController;
  static String circleIdMain = 'circleID1';
  static String circleIdMain2 = 'circleID2';
  static String circleIdMain3 = 'circleID3';
  Set<Marker> markers = Set();
  Set<Circle> circles = Set.from([
    Circle(
        circleId: CircleId(circleIdMain3),
        center: LatLng(45.521563, -122.677433),
        radius: 1000,
        fillColor: MyColor.themeColor.withOpacity(0.3),
        strokeColor: MyColor.themeColor,
        strokeWidth: 1),
    Circle(
        circleId: CircleId(circleIdMain),
        center: LatLng(45.521563, -122.677433),
        radius: 4000,
        fillColor: MyColor.themeColor.withOpacity(0.2),
        strokeColor: MyColor.themeColor,
        strokeWidth: 1),
    Circle(
        circleId: CircleId(circleIdMain2),
        center: LatLng(45.521563, -122.677433),
        radius: 200,
        fillColor: MyColor.themeColor,
        strokeColor: MyColor.themeColor,
        strokeWidth: 1),
  ]);
  final LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  Widget build(BuildContext context) {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5), 'images/car_icon.png')
        .then((onValue) {
      pinLocationIcon = onValue;
    });

    return Scaffold(
      drawer: Container(
        width: 210.3,
        child: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => ProfileScreen()));
                },
                child: Container(
                  height: 260.3,
                  child: DrawerHeader(
                    padding: EdgeInsets.zero,
                    child: Container(
                        child: Stack(
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            'images/navigation_curve.png',
                            fit: BoxFit.fill,
                            height: 215,
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 20),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 60,
                                    width: 46.3,
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                            height: 46.3,
                                            width: 46.3,
                                            margin: EdgeInsets.only(top: 10),
                                            decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: new AssetImage(
                                                        "images/girl_dp.jpg")))),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 5, bottom: 3),
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              width: 10,
                                              height: 10,
                                              decoration: new BoxDecoration(
                                                color: MyColor.green,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(
                                    left: 15, top: 20, right: 4),
                                child: Text(
                                  'Max Angelica',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'GilroySemibold',
                                      color: Colors.white),
                                )),
                            Container(
                                width: double.infinity,
                                padding:
                                    EdgeInsets.only(left: 15, top: 7, right: 5),
                                child: Text(
                                  'D123,Honda city ',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'GilroySemibold',
                                      color: Colors.white),
                                )),
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 5),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'images/rating.png',
                                    width: 12,
                                    height: 12,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 5, top: 5),
                                      child: Text(
                                        '4.5',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'GilroySemibold',
                                            color: Colors.white),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Book Your Trip',
                  style: TextStyle(
                      fontSize: 16,
                      color: MyColor.textBlueColor,
                      decoration: TextDecoration.none,
                      fontFamily: 'GilroySemibold'),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => SelectCabScreen()));
                },
              ),
              ListTile(
                title: Text(
                  'Your Trips',
                  style: TextStyle(
                      fontSize: 16,
                      color: MyColor.textBlueColor,
                      decoration: TextDecoration.none,
                      fontFamily: 'GilroySemibold'),
                ),
                onTap: () {
                  Navigator.of(context).push(_createRoute());

                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text(
                  'Payment',
                  style: TextStyle(
                      fontSize: 16,
                      color: MyColor.textBlueColor,
                      decoration: TextDecoration.none,
                      fontFamily: 'GilroySemibold'),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => PaymentScreen()));
                },
              ),
              ListTile(
                title: Text(
                  'Help',
                  style: TextStyle(
                      fontSize: 16,
                      color: MyColor.textBlueColor,
                      decoration: TextDecoration.none,
                      fontFamily: 'GilroySemibold'),
                ),
                onTap: () {
                  Navigator.of(context).push(_createRouteHelp());
                },
              ),
              ListTile(
                title: Text(
                  'Invite Friends',
                  style: TextStyle(
                      fontSize: 16,
                      color: MyColor.textBlueColor,
                      decoration: TextDecoration.none,
                      fontFamily: 'GilroySemibold'),
                ),
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => InviteScreen()));

                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(
                      fontSize: 16,
                      color: MyColor.textBlueColor,
                      decoration: TextDecoration.none,
                      fontFamily: 'GilroySemibold'),
                ),
                onTap: () {
                  Navigator.of(context).push(_createRouteSettings());

                  // Update the state of the app.
                  // ...
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Legal',
                      style: TextStyle(
                          fontSize: 12,
                          color: MyColor.textSoft,
                          decoration: TextDecoration.none,
                          fontFamily: 'GilroySemibold'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      'V4.564.0001',
                      style: TextStyle(
                          fontSize: 12,
                          color: MyColor.textSoft,
                          decoration: TextDecoration.none,
                          fontFamily: 'GilroySemibold'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: (Builder(
        builder: (ctx) => MaterialApp(
          home: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                      height: 60,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Scaffold.of(ctx).openDrawer();
                              },
                              child: Container(
                                  padding: EdgeInsets.only(left: 0),
                                  child: Image.asset('images/hamber2.png',
                                      width: 20, height: 15)),
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Center(
                                child: Container(
                              child: Text(
                                'Hello Alax',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: MyColor.textBlueColor,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'GilroySemibold'),
                              ),
                            )),
                            flex: 5,
                          ),
                          Expanded(
                            child: Container(
                                height: 40.3,
                                width: 25.3,
                                margin: EdgeInsets.only(right: 10),
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new AssetImage(
                                            "images/girl_dp.jpg")))),
                            flex: 1,
                          )
                        ],
                      )),
                  Expanded(
                      child: Stack(
                    children: <Widget>[
                      Container(
                        height: double.infinity,
                        child: GoogleMap(
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: _center,
                            zoom: 11.0,
                          ),
                          markers: markers,
                          circles: circles,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Book Ride',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'GilroySemibold'),
                              ),
                            ),
                            Container(
                                height: 170,
                                width: double.infinity,
                                child: ListView(
                                  padding: EdgeInsets.only(
                                      left: 15, bottom: 20, top: 5),
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        DestinationScreen()));
                                          },
                                          child: Container(
                                            width: 130.3,
                                            height: 124.3,
                                            child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 20),
                                                ),
                                                Container(
                                                    width: 47,
                                                    height: 47,
                                                    decoration:
                                                        new BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            MyColor
                                                                .gradientStart,
                                                            MyColor.gradientEnd
                                                          ],
                                                          begin: Alignment
                                                              .centerLeft,
                                                          end: Alignment
                                                              .centerRight),
                                                      shape: BoxShape.circle,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color:
                                                                Colors.black26,
                                                            blurRadius: 8.0,
                                                            offset: Offset(
                                                                1.0, 1.0),
                                                            spreadRadius: 0.0)
                                                      ],
                                                    ),
                                                    child: Center(
                                                        child: Image.asset(
                                                      'images/loc_white.png',
                                                      height: 21.3,
                                                      width: 21.3,
                                                    ))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 15),
                                                    child: Text(
                                                      'Destination',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: MyColor
                                                              .greyTextColor,
                                                          fontFamily:
                                                              'GilroySemibold'),
                                                    )),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.only(top: 5),
                                                    child: Text(
                                                      'ADD NEW',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              MyColor.textSoft,
                                                          fontFamily:
                                                              'GilroySemibold'),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          ConfirmationScreen()));
                                            },
                                            child: Container(
                                              width: 130.3,
                                              height: 124.3,
                                              child: Column(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 20),
                                                  ),
                                                  Container(
                                                      width: 47,
                                                      height: 47,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: Colors.white,
                                                        shape: BoxShape.circle,
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors
                                                                  .black26,
                                                              blurRadius: 8.0,
                                                              offset: Offset(
                                                                  1.0, 1.0),
                                                              spreadRadius: 0.0)
                                                        ],
                                                      ),
                                                      child: Center(
                                                          child: Image.asset(
                                                        'images/home_pink.png',
                                                        height: 19.3,
                                                        color:
                                                            MyColor.themeColor,
                                                        width: 18.3,
                                                      ))),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 15),
                                                      child: Text(
                                                        ' My Home',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: MyColor
                                                                .greyTextColor,
                                                            fontFamily:
                                                                'GilroySemibold'),
                                                      )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 5),
                                                      child: Text(
                                                        '55 minutes',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: MyColor
                                                                .textSoft,
                                                            fontFamily:
                                                                'GilroySemibold'),
                                                      ))
                                                ],
                                              ),
                                            )),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Container(
                                          width: 130.3,
                                          height: 124.3,
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 20),
                                              ),
                                              Container(
                                                  width: 47,
                                                  height: 47,
                                                  decoration: new BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.black26,
                                                          blurRadius: 8.0,
                                                          offset:
                                                              Offset(1.0, 1.0),
                                                          spreadRadius: 0.0)
                                                    ],
                                                  ),
                                                  child: Center(
                                                      child: Image.asset(
                                                    'images/office_pink.png',
                                                    height: 16.0,
                                                    color: MyColor.themeColor,
                                                    width: 18.3,
                                                  ))),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 15),
                                                  child: Text(
                                                    'My Office',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: MyColor
                                                            .greyTextColor,
                                                        fontFamily:
                                                            'GilroySemibold'),
                                                  )),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5),
                                                  child: Text(
                                                    '50 minutes',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: MyColor.textSoft,
                                                        fontFamily:
                                                            'GilroySemibold'),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ))
                ],
              )),
        ),
      )),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => YourTrip(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end);
          var curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        });
  }

  Route _createRouteHelp() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => HelpScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end);
          var curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        });
  }

  Route _createRouteSettings() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SettingsScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(_mapStyle);

    setState(() {
      markers.addAll([
        Marker(
            markerId: MarkerId('value'),
            position: LatLng(45.521563, -122.677433),
            icon: pinLocationIcon),
        Marker(
            markerId: MarkerId('value2'),
            position: LatLng(45.5101, -122.7158),
            icon: pinLocationIcon),
        Marker(
            markerId: MarkerId('value2'),
            position: LatLng(45.5191, -122.5791),
            icon: pinLocationIcon),
      ]);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }
}
