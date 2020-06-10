import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxiapp/colors/colors.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class CustomPicker extends StatefulWidget {
  String token;
  String addressType;
  CustomPicker(this.token,this.addressType);
  CustomPickerState createState() => CustomPickerState(token,addressType);
}

class CustomPickerState extends State<CustomPicker> {
  bool isLoading = false;
  String addressType;
  String token;
  String selectedPlaceID = '';
  List<dynamic> placesList = [];
  CustomPickerState(this.token,this.addressType);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.zero,
              elevation: 5,
              child: Container(
                height: 60,
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context, true);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Image.asset('images/back_icon.png',
                            width: 19.3, height: 9.3),
                      ),
                    ),
                    Expanded(
                        child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 15, top: 11),
                          child: Container(
                            color: MyColor.searchBoxColor,
                            child: TextFormField(
                              onChanged: (query) {
                                if (query.length > 1) {
                                  fetchGooglePlaces(query);
                                  //api call
                                } else {
                                  if (placesList.length != 0) {
                                    setState(() {
                                      placesList.clear();
                                    });
                                  }
                                }
                              },
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 14,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'GilroySemibold'),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 10.0, bottom: 10),
                                border: InputBorder.none,
                                hintText: 'Search Location',
                                hintStyle: TextStyle(
                                    color: Colors.black12,
                                    fontSize: 1,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'GilroySemibold'),
                              ),
                            ),
                            height: 38,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 25),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: isLoading == true
                                ? Container(
                                    height: 15,
                                    width: 15,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                    ),
                                  )
                                : Image.asset('images/cross_white.png',
                                    color: Colors.black, height: 10, width: 10),
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 10),
                  itemCount: placesList.length,
                  itemBuilder: (BuildContext context, int position) {
                    return GestureDetector(
                      onTap: () {
                        fetchlatLong(placesList[position]['place_id']);
                      },
                      child: Container(
                          child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image.asset('images/loc_trip.png',
                                  width: 40, height: 40),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 5, top: 4, right: 10),
                                      child: Text(
                                        placesList[position]['description'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: MyColor.textBlueColor,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'GilroySemibold'),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 5, top: 5, right: 10),
                                      child: Text(
                                        placesList[position][
                                                        'structured_formatting']
                                                    ['secondary_text'] !=
                                                null
                                            ? placesList[position]
                                                    ['structured_formatting']
                                                ['secondary_text']
                                            : '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 11,
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            decoration: TextDecoration.none,
                                            fontFamily: 'GilroySemibold'),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: MyColor.greyDivider22,
                          )
                        ],
                      )),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> fetchGooglePlaces(String loc) async {
    bool hasError = true;
    bool status = false;
    String message = '';
    try {
      setState(() {
        isLoading = true;
      });
      http.Response response;
      response = await http.get(
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?sensor=false&key=AIzaSyDkDzbGX9zn45qKO8t6MupReYHwzX6uiQU&input=' +
              loc,
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'X-Requested-With': 'XMLHttpRequest'
          });
      Map<String, dynamic> fetchTokenResponse = json.decode(response.body);
      print(fetchTokenResponse);
      setState(() {
        isLoading = false;
        placesList = fetchTokenResponse['predictions'];
      });
    } catch (errorMessage) {
      hasError = true;
      message = errorMessage.toString();
    }
  }

  Future<Map<String, dynamic>> fetchlatLong(String placeID) async {
    bool hasError = true;
    bool status = false;
    String message = '';
    showAlertDialog(context,'Getting location...');
    try {
      setState(() {});
      http.Response response;
      response = await http.get(
          'https://maps.googleapis.com/maps/api/place/details/json?placeid=' +
              placeID +
              '&key=AIzaSyDkDzbGX9zn45qKO8t6MupReYHwzX6uiQU',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'X-Requested-With': 'XMLHttpRequest'
          });
      Map<String, dynamic> fetchAPIResponse = json.decode(response.body);
      Navigator.pop(context);
      double latt = fetchAPIResponse['result']['geometry']['location']['lat'];
      double long = fetchAPIResponse['result']['geometry']['location']['lng'];
      String locationName = fetchAPIResponse['result']['name'];
      saveLocation(latt.toString(), long.toString(), locationName);
      setState(() {});
    } catch (errorMessage) {
      hasError = true;
      Navigator.pop(context);
      message = errorMessage.toString();
      print(message);
    }
  }


  Future<Map<String, dynamic>> saveLocation(
       String latt, String longg, String address) async {
    final Map<String, dynamic> collectedAuthData = {
      'type': addressType,
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
      // Check for routes errors
      if (fetchTokenResponse['status'] == 'error') {
        message = fetchTokenResponse['message'];
      } else {
        status = fetchTokenResponse['status'];
        message = fetchTokenResponse['message'];
        print(message);
        Toast.show(message, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM,backgroundColor: MyColor.gradientStart,);
        Navigator.pop(context,'Location Saved');
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





}
