import 'package:bobebet_app/models/users.dart';
import 'package:bobebet_app/services/user_update_service.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/bezierContainer.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/ui/widgets/fields/fields.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:bobebet_app/utils/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserMasterUpdatePage extends StatefulWidget {
  UserMasterUpdatePage({Key? key, required this.user}) : super(key: key);

  final User user ;

  @override
  _UserMasterUpdatePageState createState() => _UserMasterUpdatePageState();
}

class _UserMasterUpdatePageState extends State<UserMasterUpdatePage> {

  Validator validator = Validator() ;
  UserUpdateService userUpdateService = new UserUpdateService();
  bool loading = false ;
  String credit = "0" ;
  TextEditingController creditController = new TextEditingController() ;

  @override
  void initState() {
    credit = widget.user.credit.toString() ;
    creditController.text = credit  ;
  }

  hide() {
    setState(() {
      loading = false ;
    });
  }

  _onChanceCredit(String v) {
    setState(() {
      credit = v ;
    });
  }

  _onPressed() {
    if (credit == null) {
      MessageWidget.error(context, "El crédito es obligatorio.", 3);
    } else {
      if (double.tryParse(credit) == null) {
        MessageWidget.error(
            context, "El crédito debe tener solo dígitos.", 3);
      } else {
        if (double.parse(credit) < 0) {
          MessageWidget.error(context, "El crédito debe ser un valor positivo.", 3);
        } else {
          setState(() {
            loading = true;
          });

          UserUpdate userUpdate = new UserUpdate();
          userUpdate.id = widget.user.id;
          userUpdate.minBetCredit = "0";
          userUpdate.bankWonPercent = "0";
          userUpdate.userWonPercent = "0";
          userUpdate.minCredit = "0";
          userUpdate.credit = credit;

          userUpdateService.update(userUpdate)..then((value) => {
            if(value.statusCode == 0) {
              Navigator.pop(context, "updated")
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Fields.doubleField("Crédito", _onChanceCredit, creditController),
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
                  SizedBox(height: height * .04),
                  Buttons.backButton(context),
                  SizedBox(height: height/5),
                  Text("Actualizar usuario master", style: TextStyle(color: Colors.deepPurple, fontSize: 22, fontWeight: FontWeight.bold),),
                  _fields(),
                  SizedBox(height: 20),
                  Buttons.submitButton(_onPressed, context, "Actualizar"),
                  SizedBox(height: height * .055)
                ],
              ),
            ),
          ),//Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
