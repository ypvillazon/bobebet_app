import 'package:bobebet_app/models/login.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/login_service.dart';
import 'package:bobebet_app/ui/pages/event/events.dart';
import 'package:bobebet_app/ui/pages/event/filter_event.dart';
import 'package:bobebet_app/ui/pages/home.dart';
import 'package:bobebet_app/ui/pages/login/account_check.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/Texts.dart';
import 'package:bobebet_app/ui/widgets/common/bezierContainer.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/ui/widgets/fields/fields.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:bobebet_app/utils/validator.dart';
import 'package:flutter/material.dart';

class PinAuthPage extends StatefulWidget {
  PinAuthPage({Key? key}) : super(key: key);

  @override
  _PinAuthPageState createState() => _PinAuthPageState();
}

class _PinAuthPageState extends State<PinAuthPage> {

  Validator validator = Validator() ;
  String pin = "" ;
  String storagePin = "" ;
  bool pinSave = false ;
  dynamic _width ;

  String role = "" ;
  String userSessionId = "" ;

  @override
  void initState() {
    Prefs.pin.then((value) => {
      storagePin = value,
      Prefs.pinSave.then((value) => {
        pinSave = value,
        Prefs.role.then((value) => {
          role = value,
          Prefs.sessionUserId.then((value) => {
            userSessionId = value
          })
        })
      })
    });
    super.initState();
  }

  _onChancePin(String v) {
    setState(() {
      pin = v ;
    });
  }

  _onChancePinSave(v) {
    setState(() {
      pinSave = v ;
    });
  }

  _onPressed() {
    if (validator.isEmpty(pin)) {
      MessageWidget.error(context, "El pin es obligatorio.", 3);
    } else {
      if (pin != storagePin) {
        MessageWidget.error(context, "El pin es incorrecto.", 3);
      } else {
        if (pinSave) {
          Prefs.setPinSave(pinSave);
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(role: role, userSessionId: userSessionId))
        );
      }
    }
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        Fields.entryField("Pin", _onChancePin, width: _width/2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
                activeColor: Colors.deepPurple,
                activeTrackColor: Colors.deepPurple.shade300,
                value: pinSave,
                onChanged: _onChancePinSave
            ),
            Text("Recordar")
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body:  Container(
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
                  SizedBox(height: height * .18),
                  Texts.title1(),
                  Texts.title2(),
                  SizedBox(height: height/20),
                  Text("Si almacena el pin en el almacenamiento local no tiene que introducirlo en el próximo inicio. Por seguridad \"Bobe Apuestas\" recomienda no salvar el pin, ya que la aplicación puede ser utilizada por terceros.", style: TextStyle(fontSize: 14, color: Colors.grey, fontStyle: FontStyle.italic)),
                  SizedBox(height: 20),
                  _emailPasswordWidget(),
                  SizedBox(height: 20),
                  Buttons.submitButton(_onPressed, context, "Aceptar"),
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
