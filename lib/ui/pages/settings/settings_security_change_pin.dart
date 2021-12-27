import 'package:bobebet_app/models/login.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/login_service.dart';
import 'package:bobebet_app/ui/pages/event/events.dart';
import 'package:bobebet_app/ui/pages/event/filter_event.dart';
import 'package:bobebet_app/ui/pages/home.dart';
import 'package:bobebet_app/ui/pages/login/account_check.dart';
import 'package:bobebet_app/ui/pages/login/reset_password_init.dart';
import 'package:bobebet_app/ui/pages/settings/settings_security.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/Texts.dart';
import 'package:bobebet_app/ui/widgets/common/bezierContainer.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/ui/widgets/fields/fields.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:bobebet_app/utils/validator.dart';
import 'package:flutter/material.dart';

class SettingSecurityChangePinPage extends StatefulWidget {
  SettingSecurityChangePinPage({Key? key}) : super(key: key);

  @override
  _SettingSecurityChangePinPageState createState() => _SettingSecurityChangePinPageState();
}

class _SettingSecurityChangePinPageState extends State<SettingSecurityChangePinPage> {

  Validator validator = Validator() ;
  bool loading = false ;
  String oldPin = "";
  String opin = "" ;
  String npin = "" ;
  String rnpin = "" ;
  dynamic _width ;

  @override
  void initState() {
    Prefs.pin.then((value) => {
      oldPin = value
    });
    super.initState();
  }

  _onChanceOPin(String v) {
    setState(() {
      opin = v ;
    });
  }

  _onChanceNPin(String v) {
    setState(() {
      npin = v ;
    });
  }

  _onChanceRNPin(String v) {
    setState(() {
      rnpin = v ;
    });
  }


  _onPressed() {
      if (validator.isEmpty(npin) || validator.isEmpty(rnpin) || validator.isEmpty(opin)) {
        MessageWidget.error(context, "Todos los campos son obligatorios.", 3);
      } else {
        if (validator.validateNumber(opin) != "") {
          MessageWidget.error(context, "El pin debe estar compuesto solo por dígitos.", 3);
        } else {
          if (validator.validateNumber(npin) != "") {
            MessageWidget.error(context, "El pin debe estar compuesto solo por dígitos.", 3);
          } else {
            if (validator.validateNumber(opin) != "") {
              MessageWidget.error(context, "El pin debe estar compuesto solo por dígitos.", 3);
            } else {
              if (npin != rnpin) {
                MessageWidget.error(context, "Los nuevos pin no coinciden.", 3);
              } else {
                if (oldPin != opin) {
                  MessageWidget.error(context, "El antiguo pin no coincide con el que usted utiliza.", 3);
                } else {
                  Prefs.setPin(npin);
                  MessageWidget.info(context, "El pin ha sido cambiado con éxito", 3) ;
                }
              }
            }
          }
        }
      }
    }

  Widget _emailPasswordWidget() {
    return Column(
        children: <Widget>[
        Fields.entryField("Antiguo pin", _onChanceOPin, width: _width/2, isPassword: true),
        Fields.entryField("Nuevo pin", _onChanceNPin, width: _width/2, isPassword: true),
        Fields.entryField("Confirme el nuevo pin", _onChanceRNPin, width: _width/2, isPassword: true),
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
                  SizedBox(height: height/20),
                  Buttons.backButton(context, color: Colors.black),
                  SizedBox(height: height * .1),
                  Texts.title1(),
                  Texts.title2(),
                  SizedBox(height: height/20),
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
