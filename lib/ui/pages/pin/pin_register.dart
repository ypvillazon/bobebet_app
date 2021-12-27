
import 'package:bobebet_app/models/login.dart';
import 'package:bobebet_app/models/session.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/login_service.dart';
import 'package:bobebet_app/ui/pages/event/events.dart';
import 'package:bobebet_app/ui/pages/event/filter_event.dart';
import 'package:bobebet_app/ui/pages/home.dart';
import 'package:bobebet_app/ui/pages/login/account_check.dart';
import 'package:bobebet_app/ui/pages/login/reset_password_init.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/Texts.dart';
import 'package:bobebet_app/ui/widgets/common/bezierContainer.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/ui/widgets/fields/fields.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:bobebet_app/utils/validator.dart';
import 'package:flutter/material.dart';

class PinRegisterPage extends StatefulWidget {
  PinRegisterPage({Key? key, required this.session}) : super(key: key);

  final Session? session ;

  @override
  _PinRegisterPageState createState() => _PinRegisterPageState();
}

class _PinRegisterPageState extends State<PinRegisterPage> {

  Validator validator = Validator() ;
  bool loading = false ;
  String pin = "" ;
  String rpin = "" ;
  bool pinSave = false ;
  dynamic _width ;

  String sessionUserId = "" ;
  String role = "" ;

  @override
  void initState() {
    Prefs.setSessionId(widget.session?.sessionId) ;
    Prefs.setSessionUserId(widget.session?.userId) ;
    Prefs.setRole(widget.session?.role) ;
    Prefs.role.then((value) => {
      role = value,
      Prefs.sessionUserId.then((value) => {
        sessionUserId = value
      })
    });
    super.initState();
  }

  _onChancePin(String v) {
    setState(() {
      pin = v ;
    });
  }

  _onChanceRPin(String v) {
    setState(() {
      rpin = v ;
    });
  }

  _onChancePinSave(v) {
    setState(() {
      pinSave = v ;
    });
  }

  _onPressed() {
    if(validator.isEmpty(pin) && validator.isEmpty(rpin)) {
      Navigator.pushReplacement(
        context,
          MaterialPageRoute(builder: (context) => HomePage(role: role, userSessionId: sessionUserId))
      );
    } else {
      if (validator.isEmpty(pin) || validator.isEmpty(rpin)) {
        MessageWidget.error(
            context, "Si utiliza el pin, debe llenar los dos campos.", 3);
      } else {
        if (validator.validateNumber(pin) != "") {
          MessageWidget.error(
              context, "El pin debe estar compuesto solo por dígitos.", 3);
        } else {
          if (validator.validateNumber(rpin) != "") {
            MessageWidget.error(
                context, "El pin debe estar compuesto solo por dígitos.", 3);
          } else {
            if (pin != rpin) {
              MessageWidget.error(context, "Los pins no coinciden.", 3);
            } else {
              Prefs.setPin(pin);
              Prefs.setPinSave(pinSave);
              Navigator.pushReplacement(
                context,
                  MaterialPageRoute(builder: (context) => HomePage(role: role, userSessionId: sessionUserId))
              );
            }
          }
        }
      }
    }
  }

  Widget _emailPasswordWidget() {
    return Column(
        children: <Widget>[
        Fields.entryField("Pin", _onChancePin, width: _width/2, isPassword: true),
        Fields.entryField("Confirme el pin", _onChanceRPin, width: _width/2, isPassword: true),
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
    final height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body:
        loading ?
        HelperFunctions.loading()
        :
        Container(
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
                  Text("Si utiliza un pin de seguridad no tiene que introducir sus credenciales en el próximo inicio, si además, guarda este pin en el almacenamiento local, no debe introducirlo. Si no desea utilizar el pin presione el botón \"Aceptar\" con los campos en blanco.", style: TextStyle(fontSize: 14, color: Colors.grey, fontStyle: FontStyle.italic)),
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
