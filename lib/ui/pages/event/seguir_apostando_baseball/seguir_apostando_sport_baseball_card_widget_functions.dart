
import 'package:bobebet_app/models/event/baseball/carreras_por_entradas_dto.dart';
import 'package:bobebet_app/models/event/baseball/equipo_en_hacer_carreras.dart';
import 'package:bobebet_app/models/event/baseball/extra_inings_dto.dart';
import 'package:bobebet_app/models/event/baseball/option_total_carreras_desenlace.dart';
import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/models/event/football/football_option_goles_dto.dart';
import 'package:bobebet_app/models/event/football/football_option_margen_de_victoria_dto.dart';
import 'package:bobebet_app/models/event/football/paridad_goles_dto.dart';
import 'package:bobebet_app/models/event/tiempo_x_goles.dart';
import 'package:bobebet_app/ui/widgets/common/empty_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeguirApostandoSportBaseballCardWidgetFunctions {

  static Widget teamTitle1(teamName) {
    return Container(
      height: 30,
      width: 140,
      child: Text(((teamName.length>13) ? teamName.substring(0,9) + "..." : ((teamName=='draw') ? "Empate" : teamName)), style: TextStyle(fontSize: 14, color: Colors.deepPurple),textAlign: TextAlign.center,),
    );
  }

  static Widget teamTitle(teamName) {
    return Container(
      height: 30,
      width: 100,
      child: Text(((teamName.length>13) ? teamName.substring(0,9) + "..." : ((teamName=='draw') ? "Empate" : teamName)), style: TextStyle(fontSize: 14, color: Colors.deepPurple),textAlign: TextAlign.center,),
    );
  }

  static Widget content(onCreateForm, targetName, coeff, up, betType) {
    return
      GestureDetector(
        onTap: () => { onCreateForm((targetName == 'Empate' ? 'draw' : targetName), targetName, coeff, betType, "") },
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
                  Text("${double.parse((coeff).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                  Icon(
                    ((up==0) ? Icons.remove : (up==1) ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                    color: ((up==0) ? Colors.grey : (up==1) ? Colors.greenAccent : Colors.red),
                  )
                ],
              )
            ],
          ),
        ),
      ) ;
  }

  static Widget carrerasEntradasContent(_createBetForm, CarrerasPorEntradasDto carrerasPorEntradasDto, betType) {
    return Card(
        key: UniqueKey(),
        color: (carrerasPorEntradasDto.available) ? Colors.white : Colors.deepPurple,
        child: Column(
            children: [
              new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 10),
                        Text(carrerasPorEntradasDto.title, textAlign: TextAlign.center, style: TextStyle(color: Colors.deepPurple, fontSize: 14,fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SeguirApostandoSportBaseballCardWidgetFunctions.content(_createBetForm, carrerasPorEntradasDto.h, carrerasPorEntradasDto.hCoeff, carrerasPorEntradasDto.hcoeffUp, betType),
                            SeguirApostandoSportBaseballCardWidgetFunctions.content(_createBetForm, carrerasPorEntradasDto.d, carrerasPorEntradasDto.dCoeff, carrerasPorEntradasDto.dcoeffUp , betType),
                            SeguirApostandoSportBaseballCardWidgetFunctions.content(_createBetForm, carrerasPorEntradasDto.a, carrerasPorEntradasDto.aCoeff, carrerasPorEntradasDto.acoeffUp , betType),
                          ],
                        ),
                        SizedBox(height: 10),
                      ]
                  )
              )
            ])
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

  static Widget extraInnings(_createBetForm, ExtraIningsDto extraIningsDto) {
    String type = "BS_EXTRA_ININNGS" ;
    return Card(
        key: UniqueKey(),
        color: Colors.white,
        child: Column(
            children: [
              new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            extraInningsContent(_createBetForm, extraIningsDto.optionSi, extraIningsDto.title + " (Si)", extraIningsDto.optionCoeffSi, type, "", width: 150),
                            //extraInningsContent(_createBetForm, extraIningsDto.optionNo, extraIningsDto.title + " (No)", extraIningsDto.optionCoeffNo, type, "", width: 150),
                          ],
                        ),
                        SizedBox(height: 20),
                      ]
                  )
              )
            ])
    );
  }

  static Widget extraInningsContent(onCreateForm, targetName, targetDescription, coeff, betType, text, {double width=100, String customTargetName=""}) {
    return
      GestureDetector(
        onTap: () => { onCreateForm(((customTargetName == "") ? targetName : customTargetName), targetDescription, coeff, betType, text)},
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

  static Widget equipoHaceCarreras(_createBetForm, EquipoEnHacerCarreras equipoEnHacerCarreras, betType) {
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
                        Text(equipoEnHacerCarreras.title, textAlign: TextAlign.center, style: TextStyle(color: Colors.deepPurple, fontSize: 14,fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SeguirApostandoSportBaseballCardWidgetFunctions.equipoHaceCarrerasContent(_createBetForm, equipoEnHacerCarreras.teamHome, equipoEnHacerCarreras.coeffHome, betType),
                            SeguirApostandoSportBaseballCardWidgetFunctions.equipoHaceCarrerasContent(_createBetForm, equipoEnHacerCarreras.teamAway, equipoEnHacerCarreras.coeffAway, betType),
                          ],
                        ),
                        SizedBox(height: 10),
                      ]
                  )
              )
            ])
    );
  }

  static Widget equipoHaceCarrerasContent(onCreateForm, targetName, coeff, betType) {
    return
      GestureDetector(
        onTap: () => { onCreateForm(targetName, targetName, coeff, betType, "") },
        child: Container(
          height: 50,
          width: 140,
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
                  Text("${double.parse((coeff).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
        ),
      ) ;
  }



  static Widget desenlaceDosOpcionesContent(_createBetForm, OptionTotalCarrerasDesenlace optionTotalCarrerasDesenlace, String betType, _onMsg) {
    return  Container(color: Colors.white, child: Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        desenlaceDosOptionContent(_createBetForm, optionTotalCarrerasDesenlace.carrerasMenos, optionTotalCarrerasDesenlace.coeffMenos, optionTotalCarrerasDesenlace.showMenos, "Menos de", betType, _onMsg),
        desenlaceDosOptionContent(_createBetForm, optionTotalCarrerasDesenlace.carrerasMas, optionTotalCarrerasDesenlace.coeffMas, optionTotalCarrerasDesenlace.showMas, "Más de", betType, _onMsg)
      ],
    )
    );
  }

  static Widget desenlaceDosOptionContent(_createBetForm, double puntos, double coeff, bool show, String text, String betType, _onMsg) {
    return GestureDetector(
      onTap: () => {
        if (show) {
          _createBetForm(text + "_" + puntos.toString(), text + " " + puntos.toString() + " carrera(s)", coeff, betType, "")
        } else {
          _onMsg(text + " " + puntos.toString() + " carrera(s)")
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
            Text(puntos.toString() + (puntos==1 ? " carrera" : " carreras"), style: TextStyle(color: Colors.white, fontSize: 14)),
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

}