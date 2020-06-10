import 'dart:convert';
import 'dart:convert';
import 'dart:typed_data';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:maps_curved_line/maps_curved_line.dart';
import 'package:taxiapp/model/services_model.dart';
import 'package:taxiapp/widgets/custom_marker_widget.dart';
import 'package:toast/toast.dart';
import '../colors/colors.dart';
import 'on_trip_screen.dart';
class SelectCabScreen extends StatefulWidget {
  String token;
  SelectCabScreen(this.token);
  @override
  SelectCabScreenState createState() => SelectCabScreenState(token);
}

class SelectCabScreenState extends State<SelectCabScreen> {
  String _mapStyle;
  bool isLoading;
  List<dynamic> fetchResponse;
  String token;
  final Set<Polyline> _polylines = Set();
  final LatLng _point1 = LatLng(45.5586, -122.7609);
  final LatLng _point2 = LatLng(45.681910, -122.580340);
  List<Marker> markersWidget = [];
  BitmapDescriptor pinLocationIcon;
  GoogleMapController mapController;
  static String circleIdMain = 'circleID1';
  static String circleIdMain2 = 'circleID2';
  static String circleIdMain3 = 'circleI3';
  List<ServicesResponseModel> serviceList;
  Set<Marker> markers = Set();
  SelectCabScreenState(this.token);

  Set<Circle> circles = Set.from([
    Circle(
        circleId: CircleId(circleIdMain3),
        center: LatLng(45.681910, -122.580340),
        radius: 400,
        fillColor: MyColor.textBlueColor,
        strokeColor: MyColor.textBlueColor,
        strokeWidth: 1),
    Circle(
        circleId: CircleId(circleIdMain3),
        center: LatLng(45.5586, -122.7609),
        radius: 1000,
        fillColor: MyColor.themeColor.withOpacity(0.3),
        strokeColor: MyColor.themeColor,
        strokeWidth: 1),
    Circle(
        circleId: CircleId(circleIdMain),
        center: LatLng(45.5586, -122.7609),
        radius: 4000,
        fillColor: MyColor.themeColor.withOpacity(0.2),
        strokeColor: MyColor.themeColor,
        strokeWidth: 1),
    Circle(
        circleId: CircleId(circleIdMain2),
        center: LatLng(45.5586, -122.7609),
        radius: 200,
        fillColor: MyColor.themeColor,
        strokeColor: MyColor.themeColor,
        strokeWidth: 1),
  ]);

  List<String> carNames = <String>['Car Pool', 'Car Go', 'Sadan', 'Sadan X'];
  List<String> imagesList = <String>[
    'images/car_1.png',
    'images/car_2.png',
    'images/car_1.png',
    'images/car_1.png'
  ];

  final LatLng _center = const LatLng(45.521563, -122.677433);
  @override
  Widget build(BuildContext context) {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5), 'images/car_icon.png')
        .then((onValue) {
      pinLocationIcon = onValue;
    });

    MarkerGenerator(_getMarkerWidget(), (bitmaps) {
      setState(() {
        markersWidget = mapBitmapsToMarkers(bitmaps);
      });
    }).generate(context);

    MarkerGenerator(_getDestinationWidget(), (bitmaps) {
      setState(() {
        markersWidget = mapBitmapsToMarker(bitmaps);
      });
    }).generate(context);

    _polylines.add(Polyline(
      polylineId: PolylineId("line 1"),
      visible: true,
      width: 2,
      patterns: [PatternItem.dash(20), PatternItem.gap(10)],
      points: MapsCurvedLines.getPointsOnCurve(_point1, _point2),
      color: MyColor.themeColor,
    ));



   // _settingModalBottomSheet(context);

    return MaterialApp(
      home: Column(
        children: <Widget>[
          Expanded(
              child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,

                 child:GoogleMap(
                  zoomControlsEnabled: false,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 10.0,
                  ),
                  markers: markers,
                  circles: circles,
                  polylines: _polylines,
                ),
              ),
              Container(
                height: 60,
                margin: EdgeInsets.only(top: 25),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context, true);
                 //   _settingModalBottomSheet(context);
                   // fetchServices();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Image.asset('images/back_icon.png',
                        width: 19.3, height: 9.3),
                  ),
                ),
              ),
              Container(
                transform: Matrix4.translationValues(
                    0.0, 20.0, 0.0),
                padding: EdgeInsets.zero,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Card(
                            elevation:20,
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30))),
                            child: Container(
                                height: 344,
                                width: double.infinity,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      padding:
                                      EdgeInsets.only(left: 10, top: 20),
                                      child: Text(
                                        'Choose a ride',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: MyColor.textBlueColor,
                                            fontFamily: 'GilroyBold'),
                                      ),
                                    ),

/*
                                isLoading==true?
                                 Container(
                                   padding: EdgeInsets.only(top: 15),
                                   width: double.infinity,
                                   child: Center(
                                     child: Column(
                                       children: <Widget>[
                                         CircularProgressIndicator(backgroundColor:MyColor.gradientEnd,),
                                         SizedBox(height: 5,),
                                         Text('Loading Vehicles...')
                                       ],



                                     ),


                                   ),



                                 ):*/

                                    Container(
                                        padding: EdgeInsets.only(top: 15),
                                        height: 144,
                                        child: ListView.builder(
                                            itemCount: 4,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context,
                                                int position) {
                                              return Padding(
                                                padding:
                                                EdgeInsets.only(left: 12),
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      height: 72.7,
                                                      width: 72.7,
                                                      decoration: BoxDecoration(
                                                        color: MyColor
                                                            .greyTextColorCard,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.3),
                                                      ),
                                                      child: Image.asset(
                                                        imagesList[position],
                                                        height: 45,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 72.7,
                                                      padding: EdgeInsets.only(
                                                          top: 10, left: 5),
                                                      child: Text(
                                                        carNames[position],
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                            fontFamily:
                                                            'GilroySemiBold'),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 72.7,
                                                      padding: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        '\$152',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: MyColor
                                                                .greyTextColorForm,
                                                            fontFamily:
                                                            'GilroySemiBold'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            })),

                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 15, left: 10, right: 10),
                                      child: DottedBorder(
                                        color: MyColor.greyDivider22,
                                        strokeWidth: 1,
                                        borderType: BorderType.RRect,
                                        radius: Radius.circular(8.3),
                                        child: Container(
                                          height: 44,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                EdgeInsets.only(left: 5),
                                                child: Image.asset(
                                                  'images/master_card.png',
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                  EdgeInsets.only(left: 5),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        'Change',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: MyColor
                                                                .greyTextColorForm,
                                                            fontFamily:
                                                            'GilroySemiBold'),
                                                      ),
                                                      Padding(
                                                        padding:
                                                        EdgeInsets.only(
                                                            right: 10,
                                                            left: 5),
                                                        child: Container(
                                                            width: 27.3,
                                                            height: 27.3,
                                                            decoration:
                                                            new BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: MyColor
                                                                  .themeColor,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                    color: Colors
                                                                        .black26,
                                                                    blurRadius:
                                                                    8.0,
                                                                    offset:
                                                                    Offset(
                                                                        1.0,
                                                                        1.0),
                                                                    spreadRadius:
                                                                    0.0)
                                                              ],
                                                            ),
                                                            child: Center(
                                                              child: Image.asset(
                                                                  'images/right_ab.png',
                                                                  width: 5,
                                                                  height: 9),
                                                            )),
                                                      )
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        /* showDialog(
                                          context: context,
                                          builder: (_) => DriverRatingDialog(),
                                        );*/
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    OnTripScreen()));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                            top: 20,
                                            bottom: 15),
                                        child: Card(
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(30)),
                                          child: Container(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0, left: 0),
                                              child: Center(
                                                child: Text(
                                                  'Continue',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      decoration:
                                                      TextDecoration.none,
                                                      fontFamily:
                                                      'GilroySemibold'),
                                                ),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10),
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
                                    ),
                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 35),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: (){




                                  },

                                  child: Container(
                                      width: 51.7,
                                      transform: Matrix4.translationValues(
                                          0.0, -20.0, 0.0),
                                      height: 51.7,
                                      decoration: new BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              MyColor.gradientStart,
                                              MyColor.gradientEnd
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight),
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
                                            'images/loc_white.png',
                                            height: 21.3,
                                            width: 21.3,
                                          ))),

                                )
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,)

                    //Code for container
                  ],
                ),
              ),


            ],
          ))
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(_mapStyle);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
    
    
    
    
    
  }
  List<Marker> mapBitmapsToMarkers(List<Uint8List> bitmaps) {
    List<Marker> markersList = [];
    bitmaps.asMap().forEach((i, bmp) {
      markers.add(Marker(
          markerId: MarkerId('source'),
          position: _point1,
          icon: BitmapDescriptor.fromBytes(bmp)));
    });

    markers.addAll([
      Marker(
          markerId: MarkerId('value'),
          position: LatLng(45.521563, -122.677433),
          icon: pinLocationIcon),
    ]);
    return markersList;
  }


  List<Marker> mapBitmapsToMarker(List<Uint8List> bitmaps) {
    List<Marker> markersList = [];
    bitmaps.asMap().forEach((i, bmp) {
      markers.add(Marker(
          markerId: MarkerId('destination'),
          position: _point2,
          icon: BitmapDescriptor.fromBytes(bmp)));
    });

    markers.addAll([
      Marker(
          markerId: MarkerId('value'),
          position: LatLng(45.521563, -122.677433),
          icon: pinLocationIcon),
    ]);
    return markersList;
  }

  Widget _getMarkerWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 3, vertical:1.5),
          width: 144.3,
          height: 51.7,
          child: Stack(
            children: <Widget>[
              Image.asset('images/map_shape.png'
              ),
              Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 7),
                    child: Text('Logix City Center',style: TextStyle(fontSize: 10,color: Colors.white,fontFamily: 'GilroySemibold'),),
                  )
              )
            ],
          )
      ),
    );
  }

  Widget _getDestinationWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.5),
          width: 94,
          height: 51,
          child: Stack(
            children: <Widget>[
              Image.asset('images/home_shape_map.png',),
              Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 7),
                    child: Text('Home',style: TextStyle(fontSize: 11,color: Colors.white,fontFamily: 'GilroySemibold'),),
                  )
              )
            ],
          )
      ),
    );
  }


/*  void _settingModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        elevation: 0,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc){
          return  Container(
            transform: Matrix4.translationValues(
                0.0, 20.0, 0.0),
            padding: EdgeInsets.zero,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Card(
                        elevation:20,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30))),
                        child: Container(
                            height: 344,
                            width: double.infinity,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  padding:
                                  EdgeInsets.only(left: 10, top: 20),
                                  child: Text(
                                    'Choose a ride',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: MyColor.textBlueColor,
                                        fontFamily: 'GilroyBold'),
                                  ),
                                ),

*//*
                                isLoading==true?
                                 Container(
                                   padding: EdgeInsets.only(top: 15),
                                   width: double.infinity,
                                   child: Center(
                                     child: Column(
                                       children: <Widget>[
                                         CircularProgressIndicator(backgroundColor:MyColor.gradientEnd,),
                                         SizedBox(height: 5,),
                                         Text('Loading Vehicles...')
                                       ],



                                     ),


                                   ),



                                 ):*//*

                                Container(
                                    padding: EdgeInsets.only(top: 15),
                                    height: 144,
                                    child: ListView.builder(
                                        itemCount: 4,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (BuildContext context,
                                            int position) {
                                          return Padding(
                                            padding:
                                            EdgeInsets.only(left: 12),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  height: 72.7,
                                                  width: 72.7,
                                                  decoration: BoxDecoration(
                                                    color: MyColor
                                                        .greyTextColorCard,
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(8.3),
                                                  ),
                                                  child: Image.asset(
                                                    imagesList[position],
                                                    height: 45,
                                                  ),
                                                ),
                                                Container(
                                                  width: 72.7,
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 5),
                                                  child: Text(
                                                    carNames[position],
                                                    maxLines: 2,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontFamily:
                                                        'GilroySemiBold'),
                                                  ),
                                                ),
                                                Container(
                                                  width: 72.7,
                                                  padding: EdgeInsets.only(
                                                      left: 5),
                                                  child: Text(
                                                    '\$152',
                                                    maxLines: 1,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: MyColor
                                                            .greyTextColorForm,
                                                        fontFamily:
                                                        'GilroySemiBold'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        })),

                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 15, left: 10, right: 10),
                                  child: DottedBorder(
                                    color: MyColor.greyDivider22,
                                    strokeWidth: 1,
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(8.3),
                                    child: Container(
                                      height: 44,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                            EdgeInsets.only(left: 5),
                                            child: Image.asset(
                                              'images/master_card.png',
                                              height: 40,
                                              width: 40,
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                              EdgeInsets.only(left: 5),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    'Change',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: MyColor
                                                            .greyTextColorForm,
                                                        fontFamily:
                                                        'GilroySemiBold'),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(
                                                        right: 10,
                                                        left: 5),
                                                    child: Container(
                                                        width: 27.3,
                                                        height: 27.3,
                                                        decoration:
                                                        new BoxDecoration(
                                                          shape: BoxShape
                                                              .circle,
                                                          color: MyColor
                                                              .themeColor,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .black26,
                                                                blurRadius:
                                                                8.0,
                                                                offset:
                                                                Offset(
                                                                    1.0,
                                                                    1.0),
                                                                spreadRadius:
                                                                0.0)
                                                          ],
                                                        ),
                                                        child: Center(
                                                          child: Image.asset(
                                                              'images/right_ab.png',
                                                              width: 5,
                                                              height: 9),
                                                        )),
                                                  )
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    *//* showDialog(
                                          context: context,
                                          builder: (_) => DriverRatingDialog(),
                                        );*//*
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                OnTripScreen()));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 5,
                                        right: 5,
                                        top: 20,
                                        bottom: 15),
                                    child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(30)),
                                      child: Container(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 0, left: 0),
                                          child: Center(
                                            child: Text(
                                              'Continue',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  decoration:
                                                  TextDecoration.none,
                                                  fontFamily:
                                                  'GilroySemibold'),
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
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
                                ),
                              ],
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 35),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: (){




                              },

                              child: Container(
                                  width: 51.7,
                                  transform: Matrix4.translationValues(
                                      0.0, -20.0, 0.0),
                                  height: 51.7,
                                  decoration: new BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          MyColor.gradientStart,
                                          MyColor.gradientEnd
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight),
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
                                        'images/loc_white.png',
                                        height: 21.3,
                                        width: 21.3,
                                      ))),

                            )
                        ),
                      )
                    ],
                  ),
                )

                //Code for container
              ],
            ),
          );
        }
    );
  }*/


  Future<Map<String, dynamic>> fetchServices() async {


    showAlertDialog(context, 'Loading veehicles...');

    String message = '';
    print('Api Started');
    print(token);
    try {
      isLoading=true;
      http.Response response;
      response = await http.get(
          'http://projects.thesparxitsolutions.com/SIS835/api/user/services',
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'X-Requested-With': 'XMLHttpRequest',
            'Authorization': 'Bearer ' + token
          });

    fetchResponse = json.decode(response.body);
      print(fetchResponse[0]['provider_name']);
      Toast.show(fetchResponse.toString(), context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM,backgroundColor: MyColor.gradientStart,);
      Navigator.pop(context);
      print(fetchResponse);
      setState(() {
        isLoading=false;
      });

    } catch (errorMessage) {
      print('triggered');
      Navigator.pop(context);
      message = errorMessage.toString();
      print(message);
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

}
