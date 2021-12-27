
import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/models/event/football/equipo_en_hacer.dart';
import 'package:bobebet_app/models/event/football/football_option_goles_dto.dart';
import 'package:bobebet_app/models/event/football/football_option_margen_de_victoria_dto.dart';
import 'package:bobebet_app/models/event/football/option_total_goles.dart';
import 'package:bobebet_app/models/event/football/option_total_goles_tres_desenlaces.dart';
import 'package:bobebet_app/models/event/football/options_total_goles.dart';
import 'package:bobebet_app/models/event/football/paridad_goles_dto.dart';
import 'package:bobebet_app/models/event/tiempo_x_goles.dart';
import 'package:bobebet_app/ui/widgets/common/empty_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeguirApostandoSportFootballCardWidgetFunctions {

  static Widget teamTitle2Columns(teamName) {
    return Container(
      height: 30,
      width: 140,
      child: Text(((teamName.length>15) ? teamName.substring(0,15) + "..." : ((teamName=='draw') ? "Empate" : teamName)), style: TextStyle(fontSize: 14, color: Colors.deepPurple),textAlign: TextAlign.center,),
    );
  }


  static Widget teamTitle(teamName) {
    return Container(
      height: 30,
      width: 100,
      child: Text(((teamName.length>13) ? teamName.substring(0,9) + "..." : ((teamName=='draw') ? "Empate" : teamName)), style: TextStyle(fontSize: 14, color: Colors.deepPurple),textAlign: TextAlign.center,),
    );
  }

  static Widget content(onCreateForm, String marker, double coeff) {
    return GestureDetector(
      onTap: () => { onCreateForm(marker, coeff) },
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: new LinearGradient(colors: [Colors.deepPurple, Colors.deepPurple.shade400], begin: Alignment.topCenter, end: Alignment.bottomCenter)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(marker, style: TextStyle(color: Colors.white, fontSize: 14)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${double.parse((coeff).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
      ),
    ) ;
  }

  static Widget tiempoPorGolesContent(onCreateForm, targetName, coeff, betType, text) {
    return
      GestureDetector(
        onTap: () => { onCreateForm(targetName, targetName, coeff, betType, text) },
        child: Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: new LinearGradient(colors: [Colors.deepPurple, Colors.deepPurple.shade400], begin: Alignment.topCenter, end: Alignment.bottomCenter)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(targetName, style: TextStyle(color: Colors.white, fontSize: 14)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${double.parse((coeff).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
      ) ;
  }

  static Widget tiempoPorGolesElement(_createBetForm, TiempoPorGoles tiempoPorGoles, betType, text) {
    return Card(
        key: UniqueKey(),
        color: (tiempoPorGoles.available) ? Colors.white : Colors.deepPurple,
        child: Column(
            children: [
              new Container(
                  padding: const EdgeInsets.all(10.0),
                  child:
                  (tiempoPorGoles.available)
                  ?
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SeguirApostandoSportFootballCardWidgetFunctions.tiempoPorGolesContent(_createBetForm, tiempoPorGoles.optionALabel, tiempoPorGoles.optionACoeff, betType, text),
                            SeguirApostandoSportFootballCardWidgetFunctions.tiempoPorGolesContent(_createBetForm, tiempoPorGoles.optionBLabel, tiempoPorGoles.optionBCoeff, betType, text),
                            SeguirApostandoSportFootballCardWidgetFunctions.tiempoPorGolesContent(_createBetForm, tiempoPorGoles.optionCLabel, tiempoPorGoles.optionCCoeff, betType, text),
                          ],
                        ),
                        SizedBox(height: 10),
                      ]
                  )
                      :
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        EmptyLists.emptyListsMessage(
                            0,
                            "Los valores de apuestas asociadas a este elemento  no se han encontrado, inténtelo más tarde.",
                            Colors.white
                        )
                      ]
                  )
              )
            ])
    );
  }

  static Widget margenDeVictoria(_createBetForm, FootBallOptionMargenDeVictoriaDto option, Event event, String type, String text) {
    String text = " para margen de victoria" ;
    String type = "FT_MARGEN_DE_VICTORIA" ;
    return Card(
        key: UniqueKey(),
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 10),
              Text(option.option, textAlign: TextAlign.center, style: TextStyle(color: Colors.deepPurple, fontSize: 14,fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // 1_H_Si
                  margenDeVictoriaContent(_createBetForm, "Si", option.option + " (Si)", option.coeffSi, type, text, width: 150, customTargetName: (option.goles.toString() + "_" + option.typeTeam + "_Si")),
                  margenDeVictoriaContent(_createBetForm, "No", option.option + " (No)", option.coeffNo, type, text, width: 150, customTargetName:  (option.goles.toString() + "_" + option.typeTeam + "_No")),
                ],
              ),
              SizedBox(height: 20)
            ]
        )
    );
  }

  static Widget golesOptionContent(onCreateForm, targetName, targetDescription, coeff, betType, text, bool show , _onMsg, {double width=100, String customTargetName=""}) {
    return
      GestureDetector(
        onTap: () => {
          if (show) {
            onCreateForm(((customTargetName == "") ? targetName : customTargetName), targetDescription , coeff, betType, text)
          } else {
            _onMsg(targetName)
          }
        },
        child: Container(
          height: 50,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: new LinearGradient(colors: [Colors.deepPurple, Colors.deepPurple.shade400], begin: Alignment.topCenter, end: Alignment.bottomCenter)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(((targetName.length>15) ? targetName.substring(0,15) + "..." :targetName), style: TextStyle(color: Colors.white, fontSize: 14)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  (show) ?
                  Text("${double.parse((coeff).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                      :
                  Icon(Icons.remove, color: Colors.grey)
                ],
              )
            ],
          ),
        ),
      ) ;
  }

  static Widget margenDeVictoriaContent(onCreateForm, targetName, targetDescription, coeff, betType, text, {double width=100, String customTargetName=""}) {
    return
      GestureDetector(
        onTap: () => { onCreateForm(((customTargetName == "") ? targetName : customTargetName), targetDescription , coeff, betType, text)},
        child: Container(
          height: 50,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: new LinearGradient(colors: [Colors.deepPurple, Colors.deepPurple.shade400], begin: Alignment.topCenter, end: Alignment.bottomCenter)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(((targetName.length>15) ? targetName.substring(0,15) + "..." :targetName), style: TextStyle(color: Colors.white, fontSize: 14)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${double.parse((coeff).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
      ) ;
  }

  static Widget golesOption(_createBetForm, OptionGolesDto option, String type, String text, _onMsg) {
    return Card(
        key: UniqueKey(),
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 10),
              Text(option.option, textAlign: TextAlign.center, style: TextStyle(color: Colors.deepPurple, fontSize: 14,fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // 1_H_Si
                  golesOptionContent(_createBetForm, "Si", option.option + " (Si)", option.coeffSi, type, text, option.showSi, _onMsg , width: 150, customTargetName: (option.code + "_Si")),
                  golesOptionContent(_createBetForm, "No", option.option + " (No)", option.coeffNo, type, text, option.showNo, _onMsg, width: 150, customTargetName:  (option.code + "_No")),
                ],
              ),
              SizedBox(height: 20)
            ]
        )
    );
  }

  static Widget paridadContent(_createBetForm, ParidadGolesDto paridadGolesDto, String type) {
    return Card(
        key: UniqueKey(),
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 10),
              Text(paridadGolesDto.title, textAlign: TextAlign.center, style: TextStyle(color: Colors.deepPurple, fontSize: 14,fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // 1_H_Si
                  paridadElementContent(_createBetForm, "Par","PAR",  paridadGolesDto.title + " (Par)", paridadGolesDto.coeffPar, type),
                  paridadElementContent(_createBetForm, "Impar", "IMPAR", paridadGolesDto.title + " (Impar)", paridadGolesDto.coeffImpar, type),
                ],
              ),
              SizedBox(height: 20)
            ]
        )
    );
  }

  static Widget paridadElementContent(onCreateForm, op, targetName, targetDescription, coeff, betType) {
    return
      GestureDetector(
        onTap: () => { onCreateForm(targetName, targetDescription , coeff, betType, "")},
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: new LinearGradient(colors: [Colors.deepPurple, Colors.deepPurple.shade400], begin: Alignment.topCenter, end: Alignment.bottomCenter)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(op, style: TextStyle(color: Colors.white, fontSize: 14)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${double.parse((coeff).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
      ) ;
  }

  static Widget equipoEnHacer(_createBetForm, String title, String h, String a, String n, double ch, double ca, double cn, String betType, _onMsg) {
    return Card(
        key: UniqueKey(),
        child: Column(
            children: [
              new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 10),
                        Text(title, textAlign: TextAlign.center, style: TextStyle(color: Colors.deepPurple, fontSize: 14,fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            equipoEnHaceContent(_createBetForm, h, ch, betType, _onMsg),
                            equipoEnHaceContent(_createBetForm, a, ca, betType, _onMsg),
                            equipoEnHaceContent(_createBetForm, n, cn, betType, _onMsg),
                          ],
                        ),
                        SizedBox(height: 10),
                      ]
                  )
              )
            ])
    );
  }

  static Widget equipoEnHaceContent(onCreateForm, targetName, coeff, betType, _onMsg) {
    return
      GestureDetector(
        onTap: () => {
          if (coeff > 1) {
            onCreateForm(targetName, targetName, coeff, betType, "")
          } else {
            _onMsg(targetName)
          }
        },
        child: Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: new LinearGradient(colors: [Colors.deepPurple, Colors.deepPurple.shade400], begin: Alignment.topCenter, end: Alignment.bottomCenter)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(((targetName.length>8) ? targetName.substring(0,8) + "..." : ((targetName=='draw') ? "Empate" : targetName)), style: TextStyle(color: Colors.white, fontSize: 14)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  (coeff > 1) ?
                  Text("${double.parse((coeff).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                      :
                  Icon(Icons.remove, color: Colors.grey)
                ],
              )
            ],
          ),
        ),
      ) ;
  }



  static Widget desenlaceTresOpcionesContent(_createBetForm, OptionTotalGolesTresDesenlaces optionTotalGolesTresDesenlaces, String betType, _onMsg) {
    return  Container(color: Colors.white, child: Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        desenlaceTresOptionContent(_createBetForm, optionTotalGolesTresDesenlaces.golesMenos, optionTotalGolesTresDesenlaces.golesCoeffMenos, optionTotalGolesTresDesenlaces.showMenos, "Menos de", betType, _onMsg),
        desenlaceTresOptionContent(_createBetForm, optionTotalGolesTresDesenlaces.golesExactamente, optionTotalGolesTresDesenlaces.golesCoeffExactamente, optionTotalGolesTresDesenlaces.showMas, "Exactamente", betType, _onMsg),
        desenlaceTresOptionContent(_createBetForm, optionTotalGolesTresDesenlaces.golesMas, optionTotalGolesTresDesenlaces.golesCoeffMas, optionTotalGolesTresDesenlaces.showMas, "Más de", betType, _onMsg)
      ],
    )
    );
  }

  static Widget desenlaceTresOptionContent(_createBetForm, int goles, double coeff, bool show, String text, String betType, _onMsg) {
    return GestureDetector(
      onTap: () => {
        if (show) {
          _createBetForm(text + "_" + goles.toString(), text + " " + goles.toString() + " gol(s)", coeff, betType, "")
        } else {
          _onMsg(text + " " + goles.toString() + " gol(s)")
        }
      },
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: new LinearGradient( colors: [Colors.deepPurple, Colors.deepPurple], begin: Alignment.topCenter, end: Alignment.bottomCenter)
        ),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: <Widget>[
            Text(goles.toString() + (goles==1 ? " gol" : " goles"), style: TextStyle(color: Colors.white, fontSize: 14)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                (show) ?
                Text("${double.parse((coeff).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                    :
                Icon(Icons.remove, color: Colors.grey)
              ],
            )
          ],
        ),
      ),
    );
  }


  static Widget desenlaceDosOpcionesContent(_createBetForm, OptionTotalGoles optionTotalGoles, String betType, _onMsg, type) {
    return  Container(color: Colors.white, child: Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        desenlaceDosOptionContent(_createBetForm, optionTotalGoles.golesMenos, optionTotalGoles.coeffMenos, optionTotalGoles.showMenos, "Menos de", betType, _onMsg, type),
        desenlaceDosOptionContent(_createBetForm, optionTotalGoles.golesMas, optionTotalGoles.coeffMas, optionTotalGoles.showMas, "Más de", betType, _onMsg, type)
      ],
    )
    );
  }

  static Widget desenlaceDosOptionContent(_createBetForm, double puntos, double coeff, bool show, String text, String betType, _onMsg, type) {
    return GestureDetector(
      onTap: () => {
        if (show) {
          _createBetForm(text + "_" + puntos.toString(), text + " " + puntos.toString() + (puntos==1 ? (" "+ sing(type)) : (" "+ plur(type))), coeff, betType, "")
        } else {
          _onMsg(text + " " + puntos.toString() + (puntos==1 ? (" " + sing(type)) : (" "+ plur(type))))
        }
      },
      child: Container(
        height: 50,
        width: 140,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: new LinearGradient( colors: [Colors.deepPurple, Colors.deepPurple], begin: Alignment.topCenter, end: Alignment.bottomCenter)
        ),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: <Widget>[
            Text(puntos.toString() + (puntos==1 ? (" "+ sing(type)) : (" "+ plur(type))), style: TextStyle(color: Colors.white, fontSize: 14)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                (show) ?
                Text("${double.parse((coeff).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                    :
                Icon(Icons.remove, color: Colors.grey)
              ],
            )
          ],
        ),
      ),
    );
  }

  static String sing(type) {
    if (type == "1") {
      return "gol";
    }
    if (type == "2") {
      return "corner";
    }
    if (type == "3") {
      return "t amarilla";
    }
    return "";
  }

  static String plur(type) {
    if (type == "1") {
      return "goles";
    }
    if (type == "2") {
      return "corners";
    }
    if (type == "3") {
      return "t. amarillas";
    }
    if (type == "4") {
      return "t. porteria";
    }
    return "";
  }







}