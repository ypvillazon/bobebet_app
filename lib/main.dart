import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bobebet_app/ui/pages/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bobe Bet",
      theme: ThemeData(primaryColor: Colors.deepPurple),
      home: SplashScreen() ,
    );
  }
}