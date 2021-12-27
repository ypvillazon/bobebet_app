import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_tennis/seguir_apostando_sport_tennis_card_widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimerSetyPartido {

  static List<Widget> get(Event event, dynamic _createBetForm) {
    List<Widget> widgets = [];
    if(event.ganaPrimerSetYGanaPartido.available) {
      widgets.add(
          SeguirApostandoSportTennisCardWidgetFunctions.primerSetYPartido(
              _createBetForm, event.ganaPrimerSetYGanaPartido, "TN_GANA_1ER_SET_Y_GANA_PARTIDO")
      );
    }
    if(event.pierdePrimerSetYGanaPartido.available) {
      widgets.add(
          SeguirApostandoSportTennisCardWidgetFunctions.primerSetYPartido(
              _createBetForm, event.pierdePrimerSetYGanaPartido, "TN_PIERDE_1ER_SET_Y_GANA_PARTIDO")
      );
    }
    return widgets;
  }

}