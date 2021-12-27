
import 'package:bobebet_app/models/event/baseball/carreras_por_entradas_dto.dart';
import 'package:bobebet_app/models/event/baseball/equipo_en_hacer_carreras.dart';
import 'package:bobebet_app/models/event/baseball/extra_inings_dto.dart';
import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/models/event/football/football_option_goles_dto.dart';
import 'package:bobebet_app/models/event/football/football_option_margen_de_victoria_dto.dart';
import 'package:bobebet_app/models/event/football/paridad_goles_dto.dart';
import 'package:bobebet_app/models/event/tennis/apuesta_a_resultado_option_dto.dart';
import 'package:bobebet_app/models/event/tennis/cantidad_de_sets_dto.dart';
import 'package:bobebet_app/models/event/tennis/gana_primer_set_y_gana_partido.dart';
import 'package:bobebet_app/models/event/tennis/ganador_set_dto.dart';
import 'package:bobebet_app/models/event/tennis/option_cantidad_de_sets_dto.dart';
import 'package:bobebet_app/models/event/tennis/option_total_juegos_dto.dart';
import 'package:bobebet_app/models/event/tennis/total_de_sets_dto.dart';
import 'package:bobebet_app/models/event/tiempo_x_goles.dart';
import 'package:bobebet_app/ui/widgets/common/empty_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeguirApostandoSportTennisCardWidgetFunctions {

  static Widget resultadosSets(_createBetForm, ApuestaAResultadoOptionDto apuestaAResultadoOptionDto) {
    return Card(
        key: UniqueKey(),
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  resultadosSetsContent(_createBetForm, apuestaAResultadoOptionDto.resultado, apuestaAResultadoOptionDto.resultado , apuestaAResultadoOptionDto.coeff),
                ],
              ),
              SizedBox(height: 20)
            ]
        )
    );
  }

  static Widget resultadosSetsContent(onCreateForm, targetName, targetDescription, coeff) {
    return
      GestureDetector(
        onTap: () => { onCreateForm(targetName, targetDescription, coeff, "TN_APUESTA_A_PARTIDO", "")},
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

  static Widget primerSetYPartido(_createBetForm, GanaPrimerSetYGanaPartido ganaPrimerSetYGanaPartido, String type) {
    return Card(
        key: UniqueKey(),
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 10),
              Text(ganaPrimerSetYGanaPartido.title, textAlign: TextAlign.center, style: TextStyle(color: Colors.deepPurple, fontSize: 14,fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  primerSetYPartidoContent(_createBetForm, ganaPrimerSetYGanaPartido.home, ganaPrimerSetYGanaPartido.home, ganaPrimerSetYGanaPartido.hcoeff, type),
                  primerSetYPartidoContent(_createBetForm, ganaPrimerSetYGanaPartido.away, ganaPrimerSetYGanaPartido.away, ganaPrimerSetYGanaPartido.acoeff, type),
                ],
              ),
              SizedBox(height: 20)
            ]
        )
    );
  }

  static Widget primerSetYPartidoContent(onCreateForm, targetName, targetDescription, coeff, betType) {
    return
      GestureDetector(
        onTap: () => { onCreateForm(targetName, targetDescription, coeff, betType, "")},
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

  static Widget ganadorSets(_createBetForm, GanadorSetDto ganadorSetDto, String betType) {
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
                            ganadorSetsContent(_createBetForm, ganadorSetDto.home, ganadorSetDto.home, ganadorSetDto.coeffH, ganadorSetDto.homeCoeffUp, betType),
                            ganadorSetsContent(_createBetForm, ganadorSetDto.away, ganadorSetDto.away, ganadorSetDto.coeffA, ganadorSetDto.awayCoeffUp, betType),
                          ],
                        ),
                        SizedBox(height: 20),
                      ]
                  )
              )
            ])
    );
  }

  static Widget ganadorSetsContent(onCreateForm, targetName, targetDescription, coeff, coeffUp, betType) {
    return
      GestureDetector(
        onTap: () => { onCreateForm(targetName, targetDescription, coeff, betType, "")},
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
              Text(((targetName.length>15) ? targetName.substring(0,15) + "..." :targetName), style: TextStyle(color: Colors.white, fontSize: 14)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(coeff.toString(), style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                  Icon(
                    ((coeffUp==0) ? Icons.remove : (coeffUp==1) ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                    color: ((coeffUp==0) ? Colors.grey : (coeffUp==1) ? Colors.greenAccent : Colors.red),
                  )
                ],
              )
            ],
          ),
        ),
      ) ;
  }

  static Widget totalSets(_createBetForm, OptionTotalJuegosDto optionTotalJuegosDto) {
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
                            totalDeSetsContent(_createBetForm, optionTotalJuegosDto.puntosMenos, optionTotalJuegosDto.puntosMenos.toString(), optionTotalJuegosDto.coeffMenos, "TN_TOTAL_SETS"),
                            totalDeSetsContent(_createBetForm, optionTotalJuegosDto.puntosMas, optionTotalJuegosDto.puntosMas.toString(), optionTotalJuegosDto.coeffMas, "TN_TOTAL_SETS")
                          ],
                        ),
                        SizedBox(height: 20),
                      ]
                  )
              )
            ])
    );
  }

  static Widget totalDeSetsContent(onCreateForm, targetName, targetDescription, coeff, betType) {
    return
      GestureDetector(
        onTap: () => { onCreateForm("Menos de_" + targetName.toString(), "Menos de " + targetName.toString() + " set(s)", coeff, betType, "")},
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
              Text(targetName.toString() + (targetName==1 ? " set" : " sets"), style: TextStyle(color: Colors.white, fontSize: 14)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(coeff.toString(), style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
        ),
      ) ;
  }

  static Widget optionnCantidadSets(_createBetForm, OptionCantidadDeSetsDto optionCantidadDeSetsDto) {
    return Card(
        key: UniqueKey(),
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  optionnCantidadSetsContent(_createBetForm, optionCantidadDeSetsDto.sets, optionCantidadDeSetsDto.sets , optionCantidadDeSetsDto.coeff),
                ],
              ),
              SizedBox(height: 20)
            ]
        )
    );
  }

  static Widget optionnCantidadSetsContent(onCreateForm, targetName, targetDescription, coeff) {
    return
      GestureDetector(
        onTap: () => { onCreateForm(targetName.toString(), "("+targetDescription.toString()+")", coeff, "TN_CANTIDAD_SETS", "")},
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
              Text("("+targetName.toString()+")", style: TextStyle(color: Colors.white, fontSize: 14)),
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







  static Widget desenlaceDosOpcionesContent(_createBetForm, OptionTotalJuegosDto optionTotalJuegosDto, String betType, _onMsg) {
    return  Container(color: Colors.white, child: Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        desenlaceDosOptionContent(_createBetForm, optionTotalJuegosDto.puntosMenos, optionTotalJuegosDto.coeffMenos, optionTotalJuegosDto.showMenos, "Menos de", betType, _onMsg),
        desenlaceDosOptionContent(_createBetForm, optionTotalJuegosDto.puntosMas, optionTotalJuegosDto.coeffMas, optionTotalJuegosDto.showMas, "Más de", betType, _onMsg)
      ],
    )
    );
  }

  static Widget desenlaceDosOptionContent(_createBetForm, double puntos, double coeff, bool show, String text, String betType, _onMsg) {
    return GestureDetector(
      onTap: () => {
        if (show) {
          _createBetForm(text + "_" + puntos.toString(), text + " " + puntos.toString() + " juego(s)", coeff, betType, "")
        } else {
          _onMsg(text + " " + puntos.toString() + " juego(s)")
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
            Text(puntos.toString() + (puntos==1 ? " juego" : " juegos"), style: TextStyle(color: Colors.white, fontSize: 14)),
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