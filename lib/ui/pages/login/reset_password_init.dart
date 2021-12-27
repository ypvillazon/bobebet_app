import 'package:bobebet_app/services/activate_account_service.dart';
import 'package:bobebet_app/services/restore_password_init_service.dart';
import 'package:bobebet_app/ui/pages/home.dart';
import 'package:bobebet_app/ui/pages/login/reset_password_end.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/Texts.dart';
import 'package:bobebet_app/ui/widgets/common/bezierContainer.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/ui/widgets/fields/fields.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:bobebet_app/utils/validator.dart';
import 'package:flutter/material.dart';

class ResetPasswordInitPage extends StatefulWidget {
  ResetPasswordInitPage({Key? key}) : super(key: key);

  @override
  _ResetPasswordInitPageState createState() => _ResetPasswordInitPageState();
}

class _ResetPasswordInitPageState extends State<ResetPasswordInitPage> {

  Validator validator = Validator() ;
  RestorePasswordInitService restorePasswordInitService = new RestorePasswordInitService();
  String email = "" ;
  bool loading = false ;

  hide() {
    setState(() {
      loading = false ;
    });
  }

  _onChanceEmail(String v) {
    setState(() {
      email = v ;
    });
  }

  _onPressed() {
    if(validator.isEmpty(email)) {
      MessageWidget.error(context, "El correo electrónico es obligatorio.", 3) ;
    } else {
      if (validator.validateEmail(email) != "") {
        MessageWidget.error(context, "Dirección de correo no válido.", 3) ;
      } else {
        setState(() {
          loading = true;
        });
        restorePasswordInitService.change(email).then((value) =>
        {
          if(value.statusCode == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ResetPasswordEndPage()),
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

  Widget _fields() {
    return Column(
      children: <Widget>[
        Fields.entryField("Correo electrónico", _onChanceEmail, textInputType: TextInputType.text),
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
                  Buttons.submitButton(_onPressed, context, "Restaurar"),
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
