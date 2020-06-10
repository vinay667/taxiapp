
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'colors/colors.dart';
import 'screens/home.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  String token=await getAccessToken();

  runApp( MyApp(token)
  );
}


Future<String> getAccessToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('access_token') ?? 'token';
}

class MyApp extends StatelessWidget {
  String token;
  MyApp(this.token);
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
      home: MyHomePage(token),
      routes: {
        '/home': (BuildContext context) => MyHomePage(token),

      },
    );
  }
}



