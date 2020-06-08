import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:http/http.dart' as http;

import '../colors/colors.dart';

class DestinationScreen extends StatefulWidget {
  String token;
  DestinationScreen(this.token);
  @override
  _DestinationScreenState createState() => _DestinationScreenState(token);
}

class _DestinationScreenState extends State<DestinationScreen> {
  String token;
  _DestinationScreenState(this.token);
  var textController = new TextEditingController();
  String addressHome='Add Home';
  String addressWork='Add Work';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textController.text = "Current Location";
    checkLocation();
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
                          addressHome,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                          addressWork,
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

  Future<Map<String, dynamic>> checkLocation() async {
    showAlertDialog(context,'Fetching Addresses...');
    String message = '';
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
        if(homeList.length==0)
        {
          print('Home array is null');
        }
        else
        {
          print('Home array has data');
          print(homeList.toString());

          setState(() {

            addressHome=homeList[0]['address'];

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
            addressWork=workList[0]['address'];
          });


        }
        print(message);

      }
    } catch (errorMessage) {
      message = errorMessage.toString();
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
