import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:maps_curved_line/maps_curved_line.dart';
import 'package:taxiapp/widgets/custom_marker.dart';
import '../colors/colors.dart';
import '../dialog/driver_rating_dialog.dart';
import '../dialog/on_its_way_dialog.dart';

class ConfirmationScreen extends StatefulWidget {
  @override
  ConfirmationScreenState createState() => ConfirmationScreenState();
}

class ConfirmationScreenState extends State<ConfirmationScreen> {
  final Set<Polyline> _polylines = Set();
  final LatLng _point1 = LatLng(45.5586, -122.7609);
  final LatLng _point2 = LatLng(45.681910, -122.580340);
  int valueHolder = 10;
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
        center: LatLng(45.681910, -122.580340),
        radius: 400,
        fillColor: MyColor.themeColor,
        strokeColor: MyColor.themeColor,
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
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              height: 54,
              margin: EdgeInsets.only(top: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context, true);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Image.asset('images/back_icon.png',
                            width: 19.3, height: 9.3),
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Center(
                        child: Container(
                      child: Text(
                        'Confirmation',
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
                      height: 34.3,
                      width: 34.3,
                    ),
                    flex: 1,
                  )
                ],
              )),
          Expanded(
              child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              GoogleMap(
                onMapCreated: _onMapCreated,
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 10.0,
                ),
                markers: markers,
                circles: circles,
                polylines: _polylines,
              ),
              Container(
                  width: double.infinity,
                  height: 60,
                  margin: EdgeInsets.only(left: 12, right: 12, bottom: 8),
                  child: Card(
                      elevation: 100,
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'We have found you a driver',
                                  style: TextStyle(
                                      fontSize: 12.3,
                                      color: Colors.black,
                                      fontFamily: 'GilroySemiBold'),
                                ),
                                Text(
                                  'Time of delivery will take 30 to 40 minutes',
                                  style: TextStyle(
                                      fontSize: 10.7,
                                      color: MyColor.greyTextColorForm,
                                      fontFamily: 'GilroySemiBold'),
                                ),
                              ])))),
            ],
          )),

          Card(
            elevation: 100,
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30))),
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                            backgroundColor: MyColor.themeColor,
                            radius: 24,
                            child: CircleAvatar(
                              radius: 22,
                              backgroundImage: AssetImage(
                                'images/girl_dp.jpg',
                              ),
                            )),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Jeric Tomboc',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: MyColor.appbarTitleColor,
                                  fontFamily: 'GilroySemiBold'),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              '09165378890',
                              style: TextStyle(
                                  fontSize: 11.7,
                                  color: Colors.black,
                                  fontFamily: 'GilroySemiBold'),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Plat Number: BAB 7639',
                              style: TextStyle(
                                  fontSize: 10.7,
                                  color: MyColor.greyTextColorForm,
                                  fontFamily: 'GilroySemiBold'),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Image.asset(
                          'images/mail.png',
                          height: 64,
                        ),
                        InkWell(
                            onTap: () => showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    OnItsWayDialog()),
                            child: Image.asset(
                              'images/your_trip_call.png',
                              height: 64,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Text('Shakey’s Robinson',
                              style: TextStyle(
                                  fontSize: 11.7,
                                  color: Colors.black,
                                  fontFamily: 'GilroySemiBold')),
                          flex: 6,
                        ),
                        Expanded(
                          child: Text('Subtotal',
                              style: TextStyle(
                                  fontSize: 9.3,
                                  color: MyColor.confirmation_price,
                                  fontFamily: 'GilroySemiBold')),
                          flex: 3,
                        ),
                        Expanded(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Text('\$1271.00',
                                  style: TextStyle(
                                      fontSize: 9.3,
                                      color: MyColor.confirmation_price,
                                      fontFamily: 'GilroySemiBold'))),
                          flex: 2,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Text(
                              'CG3-1606, Supertech Capetown, Sector 74, Noida',
                              style: TextStyle(
                                  fontSize: 10.7,
                                  color: MyColor.greyTextColorForm,
                                  fontFamily: 'GilroySemiBold')),
                          flex: 6,
                        ),
                        Expanded(
                          child: Text('Delivery Fee',
                              style: TextStyle(
                                  fontSize: 9.3,
                                  color: MyColor.confirmation_price,
                                  fontFamily: 'GilroySemiBold')),
                          flex: 3,
                        ),
                        Expanded(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Text('\$69.02',
                                  style: TextStyle(
                                      fontSize: 9.3,
                                      color: MyColor.confirmation_price,
                                      fontFamily: 'GilroySemiBold'))),
                          flex: 2,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Text('1.0 x Chicken “N” MOJOS - 1',
                              style: TextStyle(
                                  fontSize: 9.3,
                                  color: Colors.black,
                                  fontFamily: 'GilroySemiBold')),
                          flex: 6,
                        ),
                        Expanded(
                          child: Text('Total',
                              style: TextStyle(
                                  fontSize: 9.3,
                                  color: MyColor.confirmation_price,
                                  fontFamily: 'GilroySemiBold')),
                          flex: 3,
                        ),
                        Expanded(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Text('\$1340.02',
                                  style: TextStyle(
                                      fontSize: 9.3,
                                      color: MyColor.confirmation_price,
                                      fontFamily: 'GilroySemiBold'))),
                          flex: 2,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    )
                  ],
                )),
          ),

          //Code for container
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    var icon = await getClusterMarker(80);
    mapController = controller;
    mapController.setMapStyle(_mapStyle);
    setState(() {
      markers.addAll([
        Marker(
            markerId: MarkerId('value'),
            position: LatLng(45.521563, -122.677433),
            icon: pinLocationIcon),
        Marker(
            markerId: MarkerId('value'),
            position: LatLng(45.681910, -122.580340),
            icon: icon),
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
