import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/ui/pages/event/events.dart';
import 'package:bobebet_app/ui/pages/login/login_page.dart';
import 'package:bobebet_app/ui/pages/settings/settings_security_change_pin.dart';
import 'package:bobebet_app/ui/pages/users/users.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/Texts.dart';
import 'package:bobebet_app/ui/widgets/common/bezierContainer.dart';
import 'package:bobebet_app/ui/widgets/option.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:flutter/material.dart';


class SecuritySettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SecuritySettingsPageScreen(),
    );
  }
}

class SecuritySettingsPageScreen extends StatefulWidget {
  @override
  _SecuritySettingsPageScreenState createState() => _SecuritySettingsPageScreenState();
}

class _SecuritySettingsPageScreenState extends State<SecuritySettingsPageScreen> {

  bool pinSave = false ;

  @override
  void initState() {
    _load();
    super.initState();
  }

  _load() {
    Prefs.pinSave.then((value) => {
      print(value),
      setState(() {
        pinSave=value;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height/20),
                      Buttons.backButton(context, color: Colors.black),
                      SizedBox(height: height * .2),
                      Texts.title1(),
                      Texts.title2(),
                      SizedBox(height: height/20),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                                leading: Icon(Icons.save, size: 50, color: Colors.deepPurple ),
                                title: Text("Recordar", style: TextStyle(fontSize:16, color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                                subtitle: Text("Recordar el pin.", style: TextStyle(color: Colors.grey.shade600, fontSize: 13) ),
                                trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Switch(
                                          activeColor: Colors.deepPurple,
                                          activeTrackColor: Colors.deepPurple.shade300,
                                          value: pinSave,
                                          onChanged: (v) => {
                                            setState(() {
                                              pinSave = v;
                                            }),
                                            Prefs.setPinSave(v)
                                          }
                                      )
                                    ]
                                )
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                          onTap: () => {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingSecurityChangePinPage()))
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.fiber_pin, size: 50, color: Colors.deepPurple ),
                                  title: Text("Cambiar", style: TextStyle(fontSize:16, color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                                  subtitle: Text("Cambiar el pin.", style: TextStyle(color: Colors.grey.shade600, fontSize: 13) ),

                                ),
                              ],
                            ),
                          )
                      )
                    ],
                  ),
                ),
              ),
              //Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        ));

  }
}
