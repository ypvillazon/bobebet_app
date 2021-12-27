import 'package:bobebet_app/models/users.dart';
import 'package:bobebet_app/services/user_create_service.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/bezierContainer.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/ui/widgets/fields/fields.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:bobebet_app/utils/validator.dart';
import 'package:flutter/material.dart';

class UserAddPage extends StatefulWidget {
  UserAddPage({Key? key, this.from, this.userIdParent, this.role, this.userIdSelected}) : super(key: key);

  final int? from;
  final String? role;
  final String? userIdParent;
  final String? userIdSelected ;

  @override
  _UserAddPagePageState createState() => _UserAddPagePageState();
}

class _UserAddPagePageState extends State<UserAddPage> {

  Validator validator = Validator() ;
  UserCreateService userCreateService = new UserCreateService();
  bool loading = false ;

  String bankWonPercent = "0.1" ;
  String credit = "0.0" ;
  String email = "" ;
  String minBetCredit = "1" ;
  String minCredit = "0" ;
  String name = "" ;
  String role = "" ;
  String userWonPercent = "0" ;


  bool isBankRole = false ;

  TextEditingController bankWonPercentController = new TextEditingController() ;
  TextEditingController creditController = new TextEditingController() ;
  TextEditingController emailController = new TextEditingController() ;
  TextEditingController minBetCreditController = new TextEditingController() ;
  TextEditingController minCreditController = new TextEditingController() ;
  TextEditingController nameController = new TextEditingController() ;
  TextEditingController userWonPercentController = new TextEditingController() ;

  @override
  void initState() {
    bankWonPercentController.text = bankWonPercent  ;
    creditController.text = credit  ;
    emailController.text = email  ;
    minBetCreditController.text = minBetCredit ;
    minCreditController.text = minCredit ;
    nameController.text = name ;
    userWonPercentController.text = userWonPercent ;
    // ignore: unnecessary_null_comparison
    role = ((widget != null) ? widget.role : "")! ;
    isBankRole = (role=="ROLE_MASTER") ? true : false ;
  }

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

  _onChanceName(String v) {
    setState(() {
      name = v ;
    });
  }

  _onChanceCredit(String v) {
    setState(() {
      credit = v ;
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

  _onPressed() {
    if (validator.isEmpty(email) || validator.isEmpty(name)) {
      MessageWidget.error(context, "Los datos son obligatorios.", 3);
    } else {
      if (credit == null) {
        MessageWidget.error(context, "El crédito es obligatorio.", 3);
      } else {
        if (double.tryParse(credit) == null) {
          MessageWidget.error(
              context, "El crédito debe tener solo dígitos.", 3);
        } else {
          if (minBetCredit == null) {
            MessageWidget.error(context, "El crédito mínimo de apuesta es obligatorio.", 3);
          } else {
            if (double.tryParse(minBetCredit) == null) {
              MessageWidget.error(
                  context, "El crédito mínimo de apuesta debe tener solo dígitos.", 3);
            } else {
              if (double.parse(minBetCredit) <= 0) {
                MessageWidget.error(
                    context, "El crédito mínimo de apuesta debe ser mayor a 0.", 3);
              } else {
                if (bankWonPercent == null) {
                  MessageWidget.error(context, "El porciento de descuento es obligatorio.", 3);
                } else {
                  if (double.tryParse(bankWonPercent) == null) {
                    MessageWidget.error(
                        context,
                        "El porciento de descuento debe ser solo dígitos.",
                        3);
                  } else {
                    if (double.parse(bankWonPercent) <= 0) {
                      MessageWidget.error(
                          context,
                          "El porciento de descuento debe ser mayor a 0.",
                          3);
                    } else {
                      if (double.parse(bankWonPercent) < 0 || double.parse(bankWonPercent) > 100) {
                        MessageWidget.error(
                            context,
                            "El porciento de descuento debe estar entre 0 y 100.",
                            3);
                      } else {
                        if (userWonPercent == null) {
                          MessageWidget.error(context,
                              "El porciento del listero es obligatorio.", 3);
                        } else {
                          if (double.tryParse(userWonPercent) == null) {
                            MessageWidget.error(
                                context,
                                "El porciento del listero debe ser solo dígitos.",
                                3);
                          } else {
                            if (double.parse(userWonPercent) < 0) {
                              MessageWidget.error(
                                  context,
                                  "El porciento del listero debe ser mayor o igual a 0.",
                                  3);
                            } else {
                              if (double.parse(userWonPercent) < 0 || double
                                  .parse(userWonPercent) > 100) {
                                MessageWidget.error(
                                    context,
                                    "El porciento del listero debe estar entre 0 y 100.",
                                    3);
                              } else {
                                var valid = validator.validateEmail(email);
                                if (valid != "") {
                                  MessageWidget.error(context, valid, 3);
                                } else {
                                  setState(() {
                                    loading = true;
                                  });

                                  UserAdd userAdd = new UserAdd();
                                  userAdd.name = name ;
                                  userAdd.minBetCredit = minBetCredit ;
                                  userAdd.bankWonPercent = bankWonPercent ;
                                  userAdd.email = email ;
                                  userAdd.credit = credit ;
                                  userAdd.minCredit = minCredit ;
                                  userAdd.userWonPercent = userWonPercent ;
                                  userAdd.role = ((isBankRole)
                                      ? "ROLE_BANK"
                                      : "ROLE_COMMON") ;

                                  userCreateService.create(
                                      widget.userIdSelected,
                                      userAdd)
                                      .then((value) =>
                                  {
                                    if(value.statusCode == 0) {
                                      Navigator.pop(context, "created")
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
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }


  Widget _fields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: MediaQuery.of(context).size.height / 50),
        Text(
          "Tipo de usuario",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Text(
          "* Si el usuario es de tipo Banco o de tipo común",
          style: TextStyle(fontSize: 10, color: Colors.grey, fontStyle: FontStyle.italic),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Común", style: TextStyle(fontSize: 18, fontWeight: (!isBankRole) ? FontWeight.bold : FontWeight.normal)),
            Switch(
                activeColor: Colors.deepPurple,
                inactiveTrackColor: Colors.deepPurple.shade300,
                activeTrackColor: Colors.deepPurple.shade300,
                inactiveThumbColor: Colors.deepPurple,
                value: isBankRole,
                onChanged: (v) => {
                  setState(() {
                    isBankRole = ((role=="ROLE_COMMON") ? false : ((role=="ROLE_MASTER") ? true : v)) ;
                  })
                }),
            Text("Banco", style: TextStyle(fontSize: 18, fontWeight: (isBankRole) ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
        Fields.entryField("Nombre", _onChanceName, textInputType: TextInputType.text, help: "* Nombre y apellidos del usuario.", controller: nameController),
        Fields.entryField("Correo electrónico", _onChanceEmail, textInputType: TextInputType.text, help: "* Dirección de correo electrónico, importante para que el usuario pueda activar su cuenta.", controller: emailController),
        // Fields.doubleField("Crédito (inicial)", _onChanceCredit, creditController, help: "* Crédito inicial, este valor es opcional, si usted tiene en sus manos dinero, se lo puede asignar en crédito al usuario, de lo contrario el usuario no podrá realizar apuestas a menos que tenga crédito de préstamo."),
        Fields.doubleField("Crédito mínimo para poder apostar", _onChanceMinCredit, minCreditController,help: "* Crédito mínimo que el usuario debe tener para poder apostar en el sistema, es menor o igual a 0."),
        (!isBankRole)
            ?
                 Fields.doubleField("Crédito mínimo de una apuesta", _onChanceMinBetCredit, minBetCreditController, help: "* Crédito mínimo que el usuario debe utilizar para realizar una apuesta.")
            :
                 Container(),
        (isBankRole)
            ?
               Fields.doubleField("Porciento de ganancia del banco", _onChanceBankWonPercent, bankWonPercentController, help: "* Esta es la ganancia del banco y esta en dependencia de lo que los usuarios hijos apuesten.")
            :
               Container(),
               //Fields.doubleField("Porciento del listero", _onChanceUserWonPercent, userWonPercentController, help: "* Esta es la ganancia del usuario listero y esta en dependencia de lo que los usuarios hijos apuesten.")
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
                  Text("Nuevo usuario", style: TextStyle(color: Colors.deepPurple, fontSize: 22, fontWeight: FontWeight.bold),),
                  _fields(),
                  SizedBox(height: 20),
                  Buttons.submitButton(_onPressed, context, "Crear"),
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
