import 'package:bobebet_app/services/activate_account_service.dart';
import 'package:bobebet_app/ui/pages/home.dart';
import 'package:bobebet_app/ui/pages/login/change_password_page.dart';
import 'package:bobebet_app/ui/pages/login/login_page.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/bezierContainer.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/ui/widgets/fields/fields.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:bobebet_app/utils/validator.dart';
import 'package:flutter/material.dart';

class AccountCheckPage extends StatefulWidget {
  AccountCheckPage({Key? key}) : super(key: key);

  @override
  _AccountCheckPageState createState() => _AccountCheckPageState();
}

class _AccountCheckPageState extends State<AccountCheckPage> {

  Validator validator = Validator() ;
  ActivateAccountService activateAccountService = new ActivateAccountService();
  String activationCode = "" ;
  bool loading = false ;

  hide() {
    setState(() {
      loading = false ;
    });
  }

  _onChanceActivationCode(String v) {
    setState(() {
      activationCode = v ;
    });
  }

  _onPressed() {
    if(validator.isEmpty(activationCode)) {
      MessageWidget.error(context, "El código de verificación es obligatorio.", 3) ;
    } else {
        setState(() {
          loading = true ;
        });
        activateAccountService.activationAccount(activationCode).then((value) => {
          if(value.statusCode == 0) {
            Navigator.pushReplacement(
              context,
             MaterialPageRoute(builder: (context) => ChangePasswordPage(from: 0,activationCode: activationCode)),
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

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black, size: 22,),
            ),
            Text('Atrás',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'B',
          style: TextStyle(
            //textStyle: Theme.of(context).textTheme.display1,
            fontSize: 60,
            fontWeight: FontWeight.w700,
            color: Colors.deepPurple,
          ),
          children: [
            TextSpan(
              text: 'obe',
              style: TextStyle(color: Colors.grey, fontSize: 40),
            ),
            TextSpan(
              text: 'B',
              style: TextStyle(
                //textStyle: Theme.of(context).textTheme.display1,
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Colors.deepPurple,
              ),
            ),
            TextSpan(
              text: 'et',
              style: TextStyle(color: Colors.grey, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _title1() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: '          apuestas deportivas',
          style: TextStyle(
            height: -1,
            //textStyle: Theme.of(context).textTheme.display1,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.deepPurple,
          ),
          ),
    );
  }

  Widget _fields() {
    return Column(
      children: <Widget>[
        Fields.entryField("Código de verificación", _onChanceActivationCode),
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
                  _backButton(),
                  SizedBox(height: height * .1),
                  _title(),
                  _title1(),
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
