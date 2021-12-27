import 'dart:async';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/device_info_service.dart';
import 'package:bobebet_app/ui/pages/home.dart';
import 'package:bobebet_app/ui/pages/login/login_page.dart';
import 'package:bobebet_app/ui/pages/pin/pin_auth.dart';
import 'package:bobebet_app/ui/widgets/common/Texts.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late double _width = 0;
  String storagePin = "" ;
  String sessionId = "" ;
  bool pinSave = false ;
  var _visible = true;
  String sessionUserId = "" ;
  String role = "" ;

  late AnimationController animationController ;
  late Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    if (storagePin == "" || sessionId == "") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage(from: 3)),
        );
      } else {
      if (pinSave) {
        Navigator.pushReplacement(
          context,
            MaterialPageRoute(builder: (context) => HomePage(key: GlobalKey(), role: role, userSessionId: sessionUserId))
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PinAuthPage()),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _access();
    Prefs.pinSave.then((value) => {
      pinSave = value,
      Prefs.pin.then((value) => {
        storagePin = value,
        Prefs.sessionId.then((value) => {
          sessionId = value,
          Prefs.sessionUserId.then((value) => {
            sessionUserId = value,
            Prefs.role.then((value) => {
              role=value
            })
          })
        })
      })
    });

    animationController = new AnimationController(vsync: this, duration: new Duration(seconds: 2));
    animation = new CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  _access() {
    var deviceInfoService = new DeviceInfoService();
    deviceInfoService.send() ;
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: new LinearGradient(colors: [Colors.white, Colors.white], begin: Alignment.topCenter, end: Alignment.bottomCenter)
            ),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  width: _width/2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const LinearProgressIndicator(
                      ),
                      new Text("Cargando...")
                    ],
                  ))
            ],),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Texts.title1(anmation: animation.value),
              Texts.title2(anmation: animation.value),
              Texts.version(anmation: animation.value),
            ],
          ),
        ],
      ),
    );
  }
}