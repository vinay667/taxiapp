
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors/colors.dart';
import 'screens/home.dart';
import 'screens/invite_screen.dart';
void main(){
  runApp( MyApp()
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: MyColor.themeColor
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);



    return MaterialApp(
      home: MyHomePage(),
      routes: {
        '/home': (BuildContext context) => MyHomePage(),

      },
    );
  }

}



