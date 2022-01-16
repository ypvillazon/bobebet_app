import 'package:bobebet_app/models/event/american_football/fa_option_puntos.dart';
import 'package:bobebet_app/models/event/american_football/fa_puntos_desenlace.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_fa/seguir_apostando_sport_fa_card_widget_functions.dart';
import 'package:flutter/material.dart';

class PuntosDesenlace {

  static List<Widget> get(FAPuntosDesenlace faPuntosDesenlace, dynamic _createBetForm, String betType, _onMsg) {
    List<Widget> widgets = [] ;
    widgets.add(
      Container(
          padding: EdgeInsets.only(right: 10, top: 10, bottom: 0),
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.all(Radius.circular(6))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SeguirApostandoSportFACardWidgetFunctions.teamTitle1(faPuntosDesenlace.option1),
              SeguirApostandoSportFACardWidgetFunctions.teamTitle1(faPuntosDesenlace.option2)
            ],
          )
      ),
    ) ;

    print("CRISTIAN ...");
    print("CRISTIAN ...");
    print("C: " + faPuntosDesenlace.rows.length.toString());
    print("CRISTIAN ...");

    for (int i = 0; i < faPuntosDesenlace.rows.length; i++) {
      print("I: " + i.toString());
      FAOptionPuntos faOptionPuntos = faPuntosDesenlace.rows[i];
      print("O: " + faOptionPuntos.toString());
      widgets.add(
          SeguirApostandoSportFACardWidgetFunctions.desenlaceDosOpcionesContent(_createBetForm, faOptionPuntos, betType, _onMsg)
      );
      widgets.add(
          SizedBox(height: 10, child:Container(color: Colors.white,))
      ) ;
    }
    return widgets ;
  }
}
