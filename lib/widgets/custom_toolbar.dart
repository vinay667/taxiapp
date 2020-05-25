import 'package:flutter/cupertino.dart';
import 'package:taxiapp/colors/colors.dart';

class CustomToolbar extends StatelessWidget {
  CustomToolbar(this.header, this.contextF);

  final String header;
  final BuildContext contextF;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: double.infinity,
        margin: EdgeInsets.only(top: 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(contextF, true);
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
                  header,
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
                            "images/girl_dp.jpg",
                          )))),
              flex: 1,
            )
          ],
        ));
  }
}
