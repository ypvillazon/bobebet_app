import 'package:bobebet_app/models/users.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/activate_account_service.dart';
import 'package:bobebet_app/services/change_first_password_service.dart';
import 'package:bobebet_app/services/restore_password_service.dart';
import 'package:bobebet_app/services/user_create_service.dart';
import 'package:bobebet_app/services/user_update_service.dart';
import 'package:bobebet_app/ui/pages/home.dart';
import 'package:bobebet_app/ui/pages/login/login_page.dart';
import 'package:bobebet_app/ui/pages/users/users.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/Texts.dart';
import 'package:bobebet_app/ui/widgets/common/bezierContainer.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/ui/widgets/fields/fields.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:bobebet_app/utils/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserUpdatePage extends StatefulWidget {
  UserUpdatePage({Key? key, this.userIdSelected, this.user}) : super(key: key);

  final String? userIdSelected;
  final User? user;

  @override
  _UserUpdatePageState createState() => _UserUpdatePageState();
}

class _UserUpdatePageState extends State<UserUpdatePage> {

  Validator validator = Validator() ;
  UserUpdateService userUpdateService = new UserUpdateService();
  bool loading = false ;

  String id = "" ;
  String bankWonPercent = "0.1" ;
  String minBetCredit = "1" ;
  String minCredit = "0" ;
  String role = "" ;
  String userWonPercent = "0" ;
  String minCreditForBetByEvent = "5000" ;

  TextEditingController bankWonPercentController = new TextEditingController() ;
  TextEditingController minBetCreditController = new TextEditingController() ;
  TextEditingController minCreditController = new TextEditingController() ;
  TextEditingController userWonPercentController = new TextEditingController() ;
  TextEditingController minCreditForBetByEventController = new TextEditingController() ;

  @override
  void initState() {
    id = widget.userIdSelected!;
    minBetCredit = double.parse((widget.user!.minBetCredit).toStringAsFixed(2)).toString() ;
    bankWonPercent = double.parse((widget.user!.bankWonPercent).toStringAsFixed(2)).toString() ;
    userWonPercent = double.parse((widget.user!.userWonPercent).toStringAsFixed(2)).toString() ;
    minCredit = double.parse((widget.user!.minCredit).toStringAsFixed(2)).toString() ;
    minCreditForBetByEvent = double.parse(((widget.user!.minCreditForBetByEvent == null) ? 5000 : widget.user!.minCreditForBetByEvent).toStringAsFixed(2)).toString() ;

    bankWonPercentController.text = bankWonPercent ;
    minBetCreditController.text = minBetCredit;
    minCreditController.text = minCredit;
    userWonPercentController.text = userWonPercent ;
    minCreditForBetByEventController.text = minCreditForBetByEvent ;
  }

  hide() {
    setState(() {
      loading = false ;
    });
  }

  _onChanceMinBetCredit(String v) {
    setState(() {
      minBetCredit = v ;
    });
  }

  _onChanceMinCredit(String v) {
    setState(() {
      minCredit = v ;
    });
  }

  _onChanceBankWonPercent(String v) {
    setState(() {
      bankWonPercent = v ;
    });
  }

  _onChanceUserWonPercent(String v) {
    setState(() {
      userWonPercent = v ;
    });
  }

  _onChanceMinCreditForBetByEvent(String v) {
    setState(() {
      this.minCreditForBetByEvent = v ;
    });
  }


  _onPressed() {
    if (minBetCredit == null) {
      MessageWidget.error(context, "El crédito mínimo de apuesta es obligatorio.", 3);
      return;
    }
    if (double.tryParse(minBetCredit) == null) {
      MessageWidget.error(context, "El crédito mínimo de apuesta debe tener solo dígitos.", 3);
      return;
    }
    if (double.parse(minBetCredit) <= 0) {
      MessageWidget.error(context, "El crédito mínimo de apuesta debe ser mayor a 0.", 3);
      return;
    }
    if (bankWonPercent == null) {
      MessageWidget.error(context, "El porciento de descuento es obligatorio.", 3);
      return;
    }
    if (double.tryParse(bankWonPercent) == null) {
      MessageWidget.error(context, "El porciento de descuento debe ser solo dígitos.",3);
      return;
    }
    if (double.parse(bankWonPercent) < 0) {
      MessageWidget.error(context,"El porciento de descuento debe ser mayor a 0.",3);
      return;
    }
    if (double.parse(bankWonPercent) < 0 || double.parse(bankWonPercent) > 100) {
      MessageWidget.error(context,"El porciento de descuento debe estar entre 0 y 100.",3);
      return;
    }
    if (userWonPercent == null) {
      MessageWidget.error(context,"El porciento del listero es obligatorio.", 3);
      return;
    }
    if (double.tryParse(userWonPercent) == null) {
      MessageWidget.error(context,"El porciento del listero debe ser solo dígitos.", 3);
      return;
    }
    if (double.parse(userWonPercent) < 0) {
      MessageWidget.error(context, "El porciento del listero debe ser mayor o igual a 0.", 3);
      return;
    }
    if (double.parse(userWonPercent) < 0 || double.parse(userWonPercent) > 100) {
      MessageWidget.error(context, "El porciento del listero debe estar entre 0 y 100.", 3);
      return;
    }
    if (this.minCreditForBetByEvent == null) {
      MessageWidget.error(context,"El crédito maximo por evento es obligatorio.", 3);
      return;
    }
    if (double.tryParse(minCreditForBetByEvent) == null) {
      MessageWidget.error(context,"El crédito maximo por evento debe ser solo dígitos.", 3);
      return;
    }
    if (double.parse(minCreditForBetByEvent) < 1) {
      MessageWidget.error(context, "El crédito maximo por evento debe ser mayor 0.", 3);
      return;
    }

    setState(() {
      loading = true;
    });

    UserUpdate userUpdate = new UserUpdate();
    userUpdate.id = id;
    userUpdate.minBetCredit = minBetCredit;
    userUpdate.bankWonPercent = bankWonPercent;
    userUpdate.userWonPercent = userWonPercent;
    userUpdate.minCredit = minCredit;
    userUpdate.credit = "0";
    userUpdate.minCreditForBetByEvent = this.minCreditForBetByEvent;

    userUpdateService.update(userUpdate).then((value) =>
    {
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

  Widget _fields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Fields.doubleField("Crédito mínimo para poder apostar", _onChanceMinCredit, minCreditController, help: "* Crédito mínimo que el usuario debe tener para poder apostar en el sistema, es menor o igual a 0."),
        (widget.user!.role == "ROLE_BANK")
            ?
               Fields.doubleField("Porciento de ganancia del banco", _onChanceBankWonPercent, bankWonPercentController, help: "* Esta es la ganancia del banco y esta en dependencia de lo que los usuarios hijos apuesten.")
            :
               Container(),
               //Fields.doubleField("Porciento del listero", _onChanceUserWonPercent, userWonPercentController, help: "* Esta es la ganancia del usuario listero y esta en dependencia de lo que los usuarios hijos apuesten."),
        (widget.user!.role == "ROLE_COMMON")
            ?
                Fields.doubleField("Crédito mínimo de una apuesta", _onChanceMinBetCredit, minBetCreditController, help: "* Crédito mínimo que el usuario debe utilizar para realizar una apuesta.")
            :
                Container(),

        Fields.doubleField("Crédito maximo por evento", _onChanceMinCreditForBetByEvent, minCreditForBetByEventController, help: "* La suma de los montos de todas las apuestas al evento deben ser menores que este valor.")
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
                  Text("Actualizar usuario", style: TextStyle(color: Colors.deepPurple, fontSize: 22, fontWeight: FontWeight.bold),),
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
