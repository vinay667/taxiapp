import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxiapp/colors/colors.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:taxiapp/screens/custom_picker.dart';
import 'package:taxiapp/screens/payment_screen.dart';
import 'package:taxiapp/screens/profile_screen.dart';
import 'package:taxiapp/screens/select_cab_screen.dart';
import 'package:taxiapp/screens/settings_screen.dart';
import 'package:taxiapp/screens/your_trip.dart';
import 'package:toast/toast.dart';
import 'destination_screen.dart';
import 'help_screen.dart';
import 'invite_screen.dart';
const kGoogleApiKey = "AIzaSyB_TCC5pNO5HdmwqdCY5Gfeu27549LP0mc";
GoogleMapsPlaces _places = new GoogleMapsPlaces(apiKey: kGoogleApiKey);

class MyHomePage extends StatefulWidget {
  String token;
  MyHomePage(this.token);

  @override
  _MyHomePageState createState() => _MyHomePageState(token);
}

class _MyHomePageState extends State<MyHomePage> {
  String token;
  List<dynamic> savedAddresses=[];
  String locType='';
  Completer<GoogleMapController> controller1;


  _MyHomePageState(this.token);
String homeLocatioName='My Home';
String workLocatioName='My Work';
  String _mapStyle;
  ProgressDialog progressDialog;
  Mode _mode = Mode.fullscreen;
  final homeScaffoldKey = new GlobalKey<ScaffoldState>();
  static LatLng currentLocation;
  BitmapDescriptor pinLocationIcon,currentLocationIcon;
  GoogleMapController mapController;
  static String circleIdMain = 'circleID1';
  static String circleIdMain2 = 'circleID2';
  static String circleIdMain3 = 'circleID3';
  Set<Marker> markers = Set();
  Set<Circle> circles = Set();
  @override
  Widget build(BuildContext context) {
    getCurrentLocation();
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5), 'images/car_icon.png')
        .then((onValue) {
      pinLocationIcon = onValue;
    });
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'images/marker.png')
        .then((onValue) {
      currentLocationIcon = onValue;
    });
    return Scaffold(
      drawer: Container(
        width: 210.3,
        child: Drawer(
          child: ListView(
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
                          builder: (context) => SelectCabScreen(token)));
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
                        currentLocation==null?Container(
                          width:double.infinity,
                          child: Center(child: Text('Loading map...',style: TextStyle(fontSize:15,decoration: TextDecoration.none,color: MyColor.gradientEnd),),),):
                      Container(
                        height: double.infinity,
                        child: GoogleMap(
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: currentLocation,
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
                                          onTap: () async {
                                            //fetchAccessToken();
                                           // checkLocation();

                                            final result=await Navigator.push(context, CupertinoPageRoute(builder: (context)=>DestinationScreen(token)));
                                            if(result!=null)
                                            {
                                              checkLocation();
                                            }
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
                                            onTap: () async {
                                              if(homeLocatioName!='My Home')
                                                {
                                                  Navigator.push(context,CupertinoPageRoute(builder:(context)=>SelectCabScreen(token)));
                                                }
                                              else
                                                {
                                                  final result=await Navigator.push(context, CupertinoPageRoute(builder: (context)=>CustomPicker(token,'home')));
                                                  if(result!=null)
                                                  {
                                                    checkLocation();
                                                  }
                                                }

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
                                                          top: 15,left: 5,right: 5),
                                                      child: Text(
                                                        homeLocatioName,
                                                        textAlign: TextAlign.center,
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: MyColor
                                                                .greyTextColor,
                                                            fontFamily:
                                                                'GilroySemibold'),
                                                      )),

                                                ],
                                              ),
                                            )),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: InkWell(
                                        onTap: () async {
                                          if(workLocatioName!='My Work')
                                            {
                                              Navigator.push(context, CupertinoPageRoute(builder: (context)=>SelectCabScreen(token)));
                                            }
                                          else
                                            {
                                             final result=await Navigator.push(context, CupertinoPageRoute(builder: (context)=>CustomPicker(token,'work')));
                                             if(result!=null)
                                               {
                                                 checkLocation();
                                               }
                                             // openPlacePicker('work');
                                            }
                                        },
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
                                                    EdgeInsets.only(top: 15,left: 5,right: 5),
                                                    child: Text(
                                                      workLocatioName,
                                                      textAlign: TextAlign.center,
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: MyColor
                                                              .greyTextColor,
                                                          fontFamily:
                                                          'GilroySemibold'),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),


                                      )
                                    ),

                                    ListView.builder(
                                      itemCount: savedAddresses.length,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder:(BuildContext context,int position)
                                            {
                                              return Padding(
                                                padding: EdgeInsets.only(left: 5),
                                                child: Card(
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(20)),
                                                  child: InkWell(
                                                      onTap: (){

                                                        Navigator.push(
                                                            context,
                                                            CupertinoPageRoute(
                                                                builder: (context) => SelectCabScreen(token)));



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
                                                                      'images/loc_blue.png',
                                                                      height: 19.3,
                                                                      width: 18.3,
                                                                    ))),
                                                            Padding(
                                                                padding: EdgeInsets.only(
                                                                    top: 15,left: 5,right: 5),
                                                                child: Text(
                                                                  savedAddresses[position]['address'],
                                                                  textAlign: TextAlign.center,
                                                                  maxLines: 2,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  style: TextStyle(
                                                                      fontSize: 15,
                                                                      color: MyColor
                                                                          .greyTextColor,
                                                                      fontFamily:
                                                                      'GilroySemibold'),
                                                                )),

                                                          ],
                                                        ),
                                                      )),
                                                ),
                                              );

                                            }




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
      controller1.complete(controller);


    });
  }

  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();

    if (token == 'token') {
      fetchAccessToken();
    }
    else
      {
        checkLocation();
      }
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
    if (p != null) {
      print('trigr');
      final query = p.description;
      var addresses = await Geocoder.local.findAddressesFromQuery(query);
      var first = addresses.first;
      print("${first.featureName} :");
      print("hjo" + first.coordinates.toString());
      List<String> latLongList = first.coordinates.toString().split(",");
      String latt = latLongList[0].substring(1, latLongList[0].length);
      String long = latLongList[1].substring(0, latLongList[1].length - 1);
      print(latt);
      print(long);
      saveLocation(locType, latt, long, first.featureName);
    }
  }

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
      markers.clear();
      circles.clear();

      circles.addAll([
        Circle(
            circleId: CircleId(circleIdMain3),
            center: currentLocation,
            radius: 1000,
            fillColor: MyColor.themeColor.withOpacity(0.3),
            strokeColor: MyColor.themeColor,
            strokeWidth: 1),
        Circle(
            circleId: CircleId(circleIdMain),
            center: currentLocation,
            radius: 4000,
            fillColor: MyColor.themeColor.withOpacity(0.2),
            strokeColor: MyColor.themeColor,
            strokeWidth: 1),
        Circle(
            circleId: CircleId(circleIdMain2),
            center: currentLocation,
            radius: 200,
            fillColor: MyColor.themeColor,
            strokeColor: MyColor.themeColor,
            strokeWidth: 1),
      ]);

      markers.addAll([
        Marker(
            markerId: MarkerId('value'),
            position: currentLocation,
            icon: currentLocationIcon),
      ]);

    });
  }

  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(response.errorMessage)),
    );
  }

  Future<Map<String, dynamic>> fetchAccessToken() async {
    print('Api Called');
    final Map<String, dynamic> collectedAuthData = {
      'api_token':
          'rJ3m7AiOWSJe9RqfwEmwf4HF26sbNVQz0Tdp5FY9WmfjsRgDWjnYEsVZCLgn',
    };
    showAlertDialog(context,'Verifying User...');
    bool hasError = true;
    bool status = false;
    String message = '';

    try {
      http.Response response;
      response = await http.post(
          'http://projects.thesparxitsolutions.com/SIS835/api/user/get-access-token',
          body: json.encode(collectedAuthData),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });
      Map<String, dynamic> fetchTokenResponse = json.decode(response.body);
      print(fetchTokenResponse);
      Navigator.pop(context);
      // Check for routes errors
      if (fetchTokenResponse['status'] == 'error') {
        message = fetchTokenResponse['message'];
        hasError = true;
      } else {
        status = fetchTokenResponse['status'];
        token = fetchTokenResponse['access_token'];
        setAccessToken(token);
        checkLocation();
      }
    } catch (errorMessage) {
      Navigator.pop(context);
      hasError = true;
      message = errorMessage.toString();
      print(message);
    }
  }

  Future<Map<String, dynamic>> checkLocation() async {
   showAlertDialog(context,'Fetching Addresses...');
    String message = '';
    print(token + 'rgh');
    try {
      http.Response response;
      response = await http.get(
          'http://projects.thesparxitsolutions.com/SIS835/api/user/location',
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'X-Requested-With': 'XMLHttpRequest',
            'Authorization': 'Bearer ' + token
          });
      Map<String, dynamic> fetchTokenResponse = json.decode(response.body);
      print(fetchTokenResponse);
      Navigator.pop(context);
      // Check for routes errors
      if (fetchTokenResponse['status'] == 'error') {
        message = fetchTokenResponse['message'];
      } else {
        message = fetchTokenResponse['message'];
        List<dynamic> homeList=fetchTokenResponse['home'];
        List<dynamic> workList=fetchTokenResponse['work'];

        setState(() {
          savedAddresses=fetchTokenResponse['others'];
        });


        if(homeList.length==0)
          {
            print('Home array is null');
          }
        else
          {
            print('Home array has data');
            print(homeList.toString());

            setState(() {

              homeLocatioName=homeList[0]['address'];

            });


          }

  if(workList.length==0)
    {
      print('Work array is null');
    }
  else
    {
      print('Work arra is nit null');
      setState(() {
        workLocatioName=workList[0]['address'];
      });


    }
        print(message);

      }
    } catch (errorMessage) {
      Navigator.pop(context);
      message = errorMessage.toString();
    }
  }
  Future<Map<String, dynamic>> saveLocation(
      String type, String latt, String longg, String address) async {
    final Map<String, dynamic> collectedAuthData = {
      'type': type,
      'latitude': latt,
      'longitude': longg,
      'address': address
    };
    print(collectedAuthData.toString() + 'maphasg');
    /* progressDialog = ProgressDialog(context);
    await progressDialog.show();*/
    showAlertDialog(context,'Saving Address...');
    bool status = false;
    String apiToken = '';
    String message = '';
    print(token + 'rgh');
    try {
      http.Response response;
      response = await http.post(
          'http://projects.thesparxitsolutions.com/SIS835/api/user/location',
          body: json.encode(collectedAuthData),
          headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
            'X-Requested-With': 'XMLHttpRequest',
            'Authorization': 'Bearer ' + token
          });
      Map<String, dynamic> fetchTokenResponse = json.decode(response.body);
      print(fetchTokenResponse);
      Navigator.pop(context);
      checkLocation();
      // Check for routes errors
      if (fetchTokenResponse['status'] == 'error') {
        message = fetchTokenResponse['message'];
      } else {
        status = fetchTokenResponse['status'];
        message = fetchTokenResponse['message'];
        print(message);
        Toast.show(message, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM,backgroundColor: MyColor.gradientStart,);
      }
    } catch (errorMessage) {
      message = errorMessage.toString();
      Navigator.pop(context);
    }
  }

  showAlertDialog(BuildContext context,String dialogText) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(backgroundColor: MyColor.gradientStart,),
          Container(margin: EdgeInsets.only(left: 15), child: Text(dialogText)),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<bool> setAccessToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('access_token', value);
  }


  Future<void> openPlacePicker(String type)
  async {
    locType=type;
    Prediction p =
        await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      onError: onError,
      mode: _mode,
    );
    displayPrediction(p,
        homeScaffoldKey.currentState);
  }
}
