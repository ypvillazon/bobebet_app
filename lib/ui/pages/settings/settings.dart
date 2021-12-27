import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/ui/pages/event/events.dart';
import 'package:bobebet_app/ui/pages/login/login_page.dart';
import 'package:bobebet_app/ui/pages/settings/settings_events_change_hours.dart';
import 'package:bobebet_app/ui/pages/settings/settings_security.dart';
import 'package:bobebet_app/ui/pages/users/users.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/Texts.dart';
import 'package:bobebet_app/ui/widgets/common/bezierContainer.dart';
import 'package:bobebet_app/ui/widgets/option.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:flutter/material.dart';


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsPageScreen(),
    );
  }
}

class SettingsPageScreen extends StatefulWidget {
  @override
  _SettingsPageScreenState createState() => _SettingsPageScreenState();
}

class _SettingsPageScreenState extends State<SettingsPageScreen> {
  bool checkBoxValue = false;
  late double _height;

  @override
  void initState() {
    super.initState();
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
                      OptionWidget(
                        icon: Icons.lock,
                        title: 'Seguridad',
                        subtitle: 'Ajustes de seguridad.',
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SecuritySettingsPage()))
                        },
                      ),
                      OptionWidget(
                        icon: Icons.access_time,
                        title: 'Tiempos',
                        subtitle: 'Tiempo para mostrar elementos (horas).',
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SettingEventsChangeTimePage()))
                        },
                      ),
                      OptionWidget(
                        icon: Icons.exit_to_app,
                        title: 'Cerrar sessión',
                        subtitle: 'Cierre la sessión en el sistema.',
                        onPressed: () => {
                          Prefs.setSessionUserId(""),
                          Prefs.setSessionId(""),
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(from: 4)))
                        },
                      ),
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
