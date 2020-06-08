import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class LocationScreen extends StatefulWidget {
  @override
  _MyHomePageState34 createState() => _MyHomePageState34();
}

class _MyHomePageState34 extends State<LocationScreen> {
  String currentLoc='Current Location';
  final LatLng currentLocation = LatLng(45.5586, -122.7609);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Fetcher'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(currentLoc),
              RaisedButton(
                color: Colors.green,
                onPressed: () async {
                  print('triggered');
                  Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                  setState(() {
                    currentLoc=position.toString();
                  });
                },
                child: Text('Get Current location'),
              )
            ],
          ),
        ),
      ),
    );
  }
}