import 'package:bobebet_app/models/credit_manager.dart';
import 'package:bobebet_app/services/credit_manager_service.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/bezierContainer.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/ui/widgets/fields/fields.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:bobebet_app/utils/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditManagerPage extends StatefulWidget {
  CreditManagerPage({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  _CreditManagerPageState createState() => _CreditManagerPageState();
}

class _CreditManagerPageState extends State<CreditManagerPage> {

  Validator validator = Validator() ;
  CreditManagerService creditManagerService = new CreditManagerService();
  String credit = "0" ;
  bool loading = false ;
  TextEditingController creditController = new TextEditingController() ;

  bool isAdd = false ;

  @override
  void initState() {
    creditController.text = credit.toString();
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
        MessageWidget.error(context, "Los datos son obligatorios.", 3);
      } else {
        if (double.tryParse(credit) == null) {
          MessageWidget.error(context, "El crédito debe tener solo dígitos.", 3);
        } else {
          if (double.parse(credit) < 0) {
            MessageWidget.error(context, "El crédito debe ser un valor positivo.", 3);
          } else {
            setState(() {
              loading = true;
            });
            creditManagerService.execute(new CreditManager(
                operation: ((isAdd) ? "ADD" : "REMOVE"),
                userId: widget.userId,
                amount: double.parse(credit))).then((value) =>
            {
              if(value.statusCode == 0) {
                Navigator.pop(context, "created")
              } else
                {
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
        Text(
          "Operación",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Retirar", style: TextStyle(fontSize: 18, fontWeight: (!isAdd) ? FontWeight.bold : FontWeight.normal)),
            Switch(
                activeColor: Colors.deepPurple,
                inactiveTrackColor: Colors.deepPurple.shade300,
                activeTrackColor: Colors.deepPurple.shade300,
                inactiveThumbColor: Colors.deepPurple,
                value: isAdd,
                onChanged: (v) => {
                  setState(() {
                    isAdd = v ;
                })
            }),
            Text("Adicionar", style: TextStyle(fontSize: 18, fontWeight: (isAdd) ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
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
                  SizedBox(height: height/8),
                  Text("Administrar crédito", style: TextStyle(color: Colors.deepPurple, fontSize: 22, fontWeight: FontWeight.bold),),
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
