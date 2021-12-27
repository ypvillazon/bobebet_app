import 'package:bobebet_app/services/change_first_password_service.dart';
import 'package:bobebet_app/services/restore_password_service.dart';
import 'package:bobebet_app/ui/pages/login/login_page.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/Texts.dart';
import 'package:bobebet_app/ui/widgets/common/bezierContainer.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/ui/widgets/fields/fields.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:bobebet_app/utils/validator.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  ChangePasswordPage({Key? key, required this.from, required this.activationCode}) : super(key: key);

  final int from;
  final String activationCode;

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {

  Validator validator = Validator() ;
  ChangeFirstPasswordService changeFirstPasswordService = new ChangeFirstPasswordService();
  RestorePasswordService restorePasswordService = new RestorePasswordService();
  String password1 = "" ;
  String password2 = "" ;
  bool loading = false ;

  hide() {
    setState(() {
      loading = false ;
    });
  }

  _onChancePassword1(String v) {
    setState(() {
      password1 = v ;
    });
  }

  _onChancePassword2(String v) {
    setState(() {
      password2 = v ;
    });
  }

  _onPressed() {
      if (validator.isEmpty(password1) || validator.isEmpty(password2)) {
        MessageWidget.error(context, "Las contraseñas son obligatorias.", 3);
      } else {
        if (password1 != password2) {
          MessageWidget.error(context, "Las contraseñas no coinciden.", 3);
        } else {
          setState(() {
            loading = true;
          });
          if(widget.from == 0) {
            changeFirstPasswordService.change(widget.activationCode, password1).then((value) => {
              if(value.statusCode == 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage(from: 0)),
                )
              } else
                {
                  hide(),
                  MessageWidget.error(context, value.message, 4)
                }
            });
          }
          if(widget.from == 1) {
            restorePasswordService.change(widget.activationCode, password1).then((value) => {
              if(value.statusCode == 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage(from: 1)),
                )
              } else {
                  hide(),
                  if (value.statusCode == 461) {
                      MessageWidget.expiredVersion(context)
                  } else {
                    if (value.statusCode == 99) {
                      MessageWidget.expired(context)
                    } else {
                      MessageWidget.error(context, value.message, 4)
                    }
                  }
                }
            });
          }
        }
      }
  }

  Widget _fields() {
    return Column(
      children: <Widget>[
        Fields.entryField("Contraseña", _onChancePassword1, textInputType: TextInputType.text),
        Fields.entryField("Confirmación", _onChancePassword2, textInputType: TextInputType.text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
                  SizedBox(height: height * .05),
                  Buttons.backButton(context),
                  SizedBox(height: height * .1),
                  Texts.title1(),
                  Texts.title2(),
                  SizedBox(height: 50),
                  _fields(),
                  SizedBox(height: 20),
                  Buttons.submitButton(_onPressed, context, "Proceder"),
                  SizedBox(height: height * .055)
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
