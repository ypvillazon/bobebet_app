
import 'package:bobebet_app/models/event/basketball/basket_cuarto_con_mas_puntos_dto.dart';
import 'package:bobebet_app/models/event/basketball/basket_margen_de_victoria_dto.dart';
import 'package:bobebet_app/models/event/basketball/basket_mitad_con_mas_puntos_dto.dart';
import 'package:bobebet_app/models/event/basketball/basket_option_margen_de_victoria_dto.dart';
import 'package:bobebet_app/models/event/basketball/option_total_puntos.dart';
import 'package:bobebet_app/models/event/basketball/prorroga_de_partido_dto.dart';
import 'package:bobebet_app/models/event/basketball/resultado_encuentro_dto.dart';
import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/models/event/tiempo_x_goles.dart';
import 'package:bobebet_app/ui/widgets/common/empty_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeguirApostandoSportBasketballCardWidgetFunctions {

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

  static Widget prorrogaDePartidoContent(onCreateForm, targetName, targetDescription, coeff, betType, text, {double width=100, String customTargetName=""}) {
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

  static Widget prorrogaDePartido(_createBetForm, ProrrogaDePartidoDto prorrogaDePartidoDto) {
    String text = " indicando que apuesta por prórroga en el partido" ;
    String type = "BK_PRORROGA_DE_PARTIDO" ;
    return Card(
        key: UniqueKey(),
        color: Colors.white,
        child: Column(
            children: [
              new Container(
                  padding: const EdgeInsets.all(10.0),
                  child:
                  (prorrogaDePartidoDto.available) ?
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            prorrogaDePartidoContent(_createBetForm, prorrogaDePartidoDto.optionSi, prorrogaDePartidoDto.title + " (Si)", prorrogaDePartidoDto.optionCoeffSi, type, text, width: 150),
                            prorrogaDePartidoContent(_createBetForm, prorrogaDePartidoDto.optionNo, prorrogaDePartidoDto.title + " (No)", prorrogaDePartidoDto.optionCoeffNo, type, text, width: 150),
                          ],
                        ),
                        SizedBox(height: 20),
                      ]
                  )
                      :
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        EmptyLists.emptyListsMessage(
                            0,
                            "Los valores de apuestas asociadas a este elemento  no se han encontrado, inténtelo más tarde.",
                            Colors.deepPurple
                        )
                      ]
                  )
              )
            ])
    );
  }

  static Widget mitadConMasPuntos(_createBetForm, BasketMitadConMasPuntosDto basketMitadConMasPuntosDto) {
    String text = " con más puntos en el partido" ;
    String type = "BK_MITAD_CON_MAS_PUNTOS" ;
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
                            prorrogaDePartidoContent(_createBetForm, basketMitadConMasPuntosDto.optionMitad1, basketMitadConMasPuntosDto.optionMitad1, basketMitadConMasPuntosDto.coeffMitad1, type, text, width: 150),
                            prorrogaDePartidoContent(_createBetForm, basketMitadConMasPuntosDto.optionMitad2, basketMitadConMasPuntosDto.optionMitad2,basketMitadConMasPuntosDto.coeffMitad2, type, text, width: 150),
                          ],
                        ),
                        SizedBox(height: 20),
                      ]
                  )
              )
            ])
    );
  }

  static Widget cuartosConMasPuntos(_createBetForm, BasketCuartoConMasPuntosDto basketCuartoConMasPuntosDto) {
    String text = " con más puntos en el partido" ;
    String type = "BK_CUARTO_CON_MAS_PUNTOS" ;
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
                            prorrogaDePartidoContent(_createBetForm, basketCuartoConMasPuntosDto.optionCuarto1, basketCuartoConMasPuntosDto.optionCuarto1, basketCuartoConMasPuntosDto.coeffCuarto1, type, text, width: 150),
                            prorrogaDePartidoContent(_createBetForm, basketCuartoConMasPuntosDto.optionCuarto2, basketCuartoConMasPuntosDto.optionCuarto2, basketCuartoConMasPuntosDto.coeffCuarto2, type, text, width: 150),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            prorrogaDePartidoContent(_createBetForm, basketCuartoConMasPuntosDto.optionCuarto3, basketCuartoConMasPuntosDto.optionCuarto3 , basketCuartoConMasPuntosDto.coeffCuarto3, type, text, width: 150),
                            prorrogaDePartidoContent(_createBetForm, basketCuartoConMasPuntosDto.optionCuarto4, basketCuartoConMasPuntosDto.optionCuarto4 , basketCuartoConMasPuntosDto.coeffCuarto4, type, text, width: 150),
                          ],
                        ),
                        SizedBox(height: 20),
                      ]
                  )
              )
            ])
    );
  }

  static Widget margenDeVictoria(_createBetForm, BasketOptionMargenDeVictoriaDto option, Event event, String type, String text) {
    String text = " para margen de victoria" ;
    String type = "BK_MARGEN_DE_VICTORIA" ;
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
                  prorrogaDePartidoContent(_createBetForm, event.teamHomeName, option.option + " ( para casa)", option.coeffH, type, text, width: 150, customTargetName: (option.option + "_H")),
                  prorrogaDePartidoContent(_createBetForm, event.teamAwayName, option.option + " ( para el visitante)", option.coeffA, type, text, width: 150, customTargetName:  (option.option + "_A")),
                ],
              ),
              SizedBox(height: 20)
            ]
        )
    );
  }

  static Widget resultadoEncuentro(_createBetForm, ResultadoEncuentroDto resultadoEncuentroDto, betType) {
    return Card(
        key: UniqueKey(),
        color: (resultadoEncuentroDto.available) ? Colors.white : Colors.deepPurple,
        child: Column(
            children: [
              new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 10),
                        Text(resultadoEncuentroDto.title, textAlign: TextAlign.center, style: TextStyle(color: Colors.deepPurple, fontSize: 14,fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SeguirApostandoSportBasketballCardWidgetFunctions.resultadoEncuentroContent(_createBetForm, resultadoEncuentroDto.h, resultadoEncuentroDto.hCoeff, resultadoEncuentroDto.hcoeffUp, betType),
                            SeguirApostandoSportBasketballCardWidgetFunctions.resultadoEncuentroContent(_createBetForm, resultadoEncuentroDto.d, resultadoEncuentroDto.dCoeff, resultadoEncuentroDto.dcoeffUp , betType),
                            SeguirApostandoSportBasketballCardWidgetFunctions.resultadoEncuentroContent(_createBetForm, resultadoEncuentroDto.a, resultadoEncuentroDto.aCoeff, resultadoEncuentroDto.acoeffUp , betType),
                          ],
                        ),
                        SizedBox(height: 10),
                      ]
                  )
              )
            ])
    );
  }

  static Widget resultadoEncuentroContent(onCreateForm, targetName, coeff, up, betType) {
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




  static Widget desenlaceDosOpcionesContent(_createBetForm, OptionTotalPuntos optionTotalPuntos, String betType, _onMsg) {
    return  Container(color: Colors.white, child: Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        desenlaceDosOptionContent(_createBetForm, optionTotalPuntos.puntosMenos, optionTotalPuntos.coeffMenos, optionTotalPuntos.showMenos, "Menos de", betType, _onMsg),
        desenlaceDosOptionContent(_createBetForm, optionTotalPuntos.puntosMas, optionTotalPuntos.coeffMas, optionTotalPuntos.showMas, "Más de", betType, _onMsg)
      ],
    )
    );
  }

  static Widget desenlaceDosOptionContent(_createBetForm, double puntos, double coeff, bool show, String text, String betType, _onMsg) {
    return GestureDetector(
      onTap: () => {
        if (show) {
          _createBetForm(text + "_" + puntos.toString(), text + " " + puntos.toString() + " punto(s)", coeff, betType, "")
        } else {
          _onMsg(text + " " + puntos.toString() + " punto(s)")
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
            Text(puntos.toString() + (puntos==1 ? " punto" : " puntos"), style: TextStyle(color: Colors.white, fontSize: 14)),
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