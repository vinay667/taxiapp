import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:maps_curved_line/maps_curved_line.dart';
import 'package:taxiapp/widgets/custom_marker_widget.dart';

import '../colors/colors.dart';
import '../dialog/driver_rating_dialog.dart';

class OnTripScreen extends StatefulWidget {
  @override
  OnTripScreenState createState() => OnTripScreenState();
}

class OnTripScreenState extends State<OnTripScreen> {
  int valueHolder = 10;
  final Set<Polyline> _polylines = Set();
  final LatLng _point1 = LatLng(45.5586, -122.7609);
  final LatLng _point2 = LatLng(45.681910, -122.580340);
  List<Marker> markersWidget = [];
  String _mapStyle;
  BitmapDescriptor pinLocationIcon;
  GoogleMapController mapController;
  static String circleIdMain = 'circleID1';
  static String circleIdMain2 = 'circleID2';
  static String circleIdMain3 = 'circleID3';
  static String circleIdMain4 = 'circleID4';
  Set<Marker> markers = Set();
  Set<Circle> circles = Set.from([


    Circle(
        circleId: CircleId(circleIdMain4),
        center: LatLng(45.681910, -122.580340),
        radius: 400,
        fillColor: MyColor.textBlueColor,
        strokeColor: MyColor.textBlueColor,
        strokeWidth: 1),



    Circle(
        circleId: CircleId(circleIdMain),
        center: LatLng(45.5586, -122.7609),
        radius: 3500,
        fillColor: MyColor.greyCircle,
        strokeColor: MyColor.greyCircle,
        strokeWidth: 1),

    Circle(
        circleId: CircleId(circleIdMain2),
        center: LatLng(45.5586, -122.7609),
        radius: 800,
        fillColor: MyColor.greyDarkCircle,
        strokeColor: MyColor.greyDarkCircle,
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
            ImageConfiguration(devicePixelRatio: 2.5), 'images/car_icon_map.png')
        .then((onValue) {
      pinLocationIcon = onValue;
    });
    _polylines.add(Polyline(
      polylineId: PolylineId("line 1"),
      visible: true,
      width: 2,
      //latlng is List<LatLng>
      patterns: [PatternItem.dash(20), PatternItem.gap(10)],
      points: MapsCurvedLines.getPointsOnCurve(_point1, _point2),
      // Invoke lib to get curved line points
      color: MyColor.themeColor,
    ));
    return MaterialApp(
      home: Column(
        children: <Widget>[
          Expanded(
              child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                child: GoogleMap(
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
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Image.asset('images/back_icon.png',
                        width: 19.3, height: 9.3),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.zero,
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Card(
                            elevation: 100,
                            margin: EdgeInsets.zero,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30))),
                            child: Container(
                                height: 381,
                                width: double.infinity,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 12, top: 15),
                                          child: Text(
                                            'Your trip',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: MyColor.textBlueColor,
                                                fontFamily: 'GilroyBold'),
                                          ),
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(top: 15),
                                            width: 250,
                                            child: Slider(
                                              value: valueHolder.toDouble(),
                                              onChanged: (double newValue) {
                                                setState(() {
                                                  valueHolder =
                                                      newValue.round();
                                                });
                                              },
                                              min: 1,
                                              max: 100,
                                              divisions: 100,
                                              activeColor: MyColor.themeColor,
                                              inactiveColor: MyColor.themeColor,
                                            )),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 15, right: 15, top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                height: 48.7,
                                                width: 49,
                                                decoration: BoxDecoration(
                                                  color:
                                                      MyColor.greyTextColorCard,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.3),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Container(
                                                        width: 150,
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5,
                                                                right: 5),
                                                        child: Text(
                                                          'Honda city ',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'GilroySemiBold'),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5),
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
                                                padding:
                                                    EdgeInsets.only(right: 5),
                                                height: 40,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    Container(
                                                      width: 90,
                                                      child: Text(
                                                        'Christine',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        textAlign:
                                                            TextAlign.right,
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
                                                              EdgeInsets.only(
                                                                  left: 5),
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
                                                  transform:
                                                      Matrix4.translationValues(
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
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 15, right: 15, top: 10),
                                        height: 113,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.3),
                                          color: MyColor.greyContainer,
                                        ),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 6),
                                                      child: Image.asset(
                                                          'images/loc_trip.png',
                                                          width: 50,
                                                          height: 50),
                                                    ),
                                                    Container(
                                                      width: 180,
                                                      child: Text(
                                                        'Home',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'GilroySemiBold'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      right: 15),
                                                  child: Text(
                                                    'Add or change',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: MyColor.blueText,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontFamily:
                                                            'GilroySemiBold'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Divider(
                                                  height: 1,
                                                  color: MyColor.greyDivider22,
                                                )),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 6),
                                                        child: Image.asset(
                                                            'images/clock_trip.png',
                                                            width: 50,
                                                            height: 50)),
                                                    Container(
                                                      width: 180,
                                                      child: Text(
                                                        '03:45pm arrival',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'GilroySemiBold'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      right: 15),
                                                  child: Text(
                                                    'Share',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: MyColor.blueText,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontFamily:
                                                            'GilroySemiBold'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
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
                                              Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                    child: Image.asset(
                                                      'images/master_card.png',
                                                      height: 40,
                                                      width: 40,
                                                    ),
                                                  ),
                                                  Column(
                                                    children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 7)),
                                                      Container(
                                                        width: 100,
                                                        child: Text(
                                                          '\$324',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'GilroySemiBold'),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 100,
                                                        child: Text(
                                                          'Wallet balance \$200',
                                                          style: TextStyle(
                                                              fontSize: 9,
                                                              color: MyColor
                                                                  .greyTextColorForm,
                                                              fontFamily:
                                                                  'GilroySemiBold'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
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
                                        showDialog(
                                          context: context,
                                          builder: (_) => DriverRatingDialog(),
                                        );
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                            top: 15,
                                            bottom: 5),
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
                                                  'Cancel',
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
                                            height: 45,
                                          ),
                                        ),
                                      ),
                                    ),


                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                  transform: Matrix4.translationValues(
                                      0.0, -34.0, 0.0),
                                  child: Image.asset(
                                    'images/your_trip_call.png',
                                    height: 71,
                                    width: 71,
                                  )),
                            ),
                          )
                        ],
                      ),
                    )

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

    MarkerGenerator(_getDestinationWidget(), (bitmaps) {
      setState(() {
        markersWidget = mapBitmapsToMarkers(bitmaps);
      });
    }).generate(context);

  }
  List<Marker> mapBitmapsToMarkers(List<Uint8List> bitmaps) {
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
          position: _point1,
          icon: pinLocationIcon),
    ]);
    return markersList;
  }
  Widget _getDestinationWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child:  Container(
          padding: EdgeInsets.symmetric(
              horizontal: 3.0, vertical: 1.5),
          width: 94,
          height: 51,
          child: Stack(
            children: <Widget>[
              Image.asset(
                'images/home_shape_map.png',
              ),
              Center(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 14),
                      Container(
                          width: 25,
                          height: 25,
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                  padding:
                                  EdgeInsets.only(
                                      bottom: 5),
                                  child: Image.asset(
                                      'images/map_oval.png')),
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets
                                        .only(
                                        top: 3,
                                        left: 3),
                                    child: Text('15',
                                        style: TextStyle(
                                            fontSize:
                                            9,
                                            color: MyColor
                                                .blueMap,
                                            fontFamily:
                                            'GilroySemibold')),
                                  ),
                                  Container(
                                    transform: Matrix4
                                        .translationValues(
                                        0.0,
                                        -3.0,
                                        0.0),
                                    padding: EdgeInsets
                                        .only(
                                        left: 3),
                                    child: Text(
                                        'Mins',
                                        style: TextStyle(
                                            fontSize:
                                            6,
                                            color: MyColor
                                                .greyMap,
                                            fontFamily:
                                            'GilroySemibold')),
                                  )
                                ],
                              )
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 7),
                        child: Text(
                          'Home',
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.white,
                              fontFamily:
                              'GilroySemibold'),
                        ),
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}
