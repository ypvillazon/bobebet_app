import 'package:bobebet_app/services/activate_account_service.dart';
import 'package:bobebet_app/services/restore_password_end_service.dart';
import 'package:bobebet_app/services/restore_password_init_service.dart';
import 'package:bobebet_app/ui/pages/home.dart';
import 'package:bobebet_app/ui/pages/login/change_password_page.dart';
import 'package:bobebet_app/ui/pages/login/login_page.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/Texts.dart';
import 'package:bobebet_app/ui/widgets/common/bezierContainer.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/ui/widgets/fields/fields.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:bobebet_app/utils/validator.dart';
import 'package:flutter/material.dart';

class ResetPasswordEndPage extends StatefulWidget {
  ResetPasswordEndPage({Key? key}) : super(key: key);

  @override
  _ResetPasswordEndPageState createState() => _ResetPasswordEndPageState();
}

class _ResetPasswordEndPageState extends State<ResetPasswordEndPage> {

  Validator validator = Validator() ;
  RestorePasswordEndService restorePasswordEndService = new RestorePasswordEndService();
  String restoreCode = "" ;
  bool loading = false ;

  hide() {
    setState(() {
      loading = false ;
    });
  }

  _onChanceRestoreCode(String v) {
    setState(() {
      restoreCode = v ;
    });
  }

  _onPressed() {
    if(validator.isEmpty(restoreCode)) {
      MessageWidget.error(context, "El código de restauración es obligatorio.", 3) ;
    } else {
        setState(() {
          loading = true ;
        });
        restorePasswordEndService.change(restoreCode).then((value) => {
          if(value.statusCode == 0) {
            Navigator.pushReplacement(
              context,
             MaterialPageRoute(builder: (context) => ChangePasswordPage(from:1, activationCode: restoreCode)),
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

  Widget _fields() {
    return Column(
      children: <Widget>[
        Fields.entryField("Código de restauración", _onChanceRestoreCode),
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
                  Buttons.submitButton(_onPressed, context, "Verificar"),
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
