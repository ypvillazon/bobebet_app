import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/models/event/football/paridad_goles_dto.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_baseball/seguir_apostando_sport_baseball_card_widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EquipoEnHacerCarrerasList {

  static List<Widget> get(Event event, dynamic _createBetForm) {
    List<Widget> widgets = [];
    if(event.primerEquipo.available) {
      widgets.add(
          SeguirApostandoSportBaseballCardWidgetFunctions
              .equipoHaceCarreras(
              _createBetForm, event.primerEquipo,
              "BS_PRIMERO_HACER_CARRERAS")
      );
    }
    if(event.ultimoEquipo.available) {
      widgets.add(
          SeguirApostandoSportBaseballCardWidgetFunctions
              .equipoHaceCarreras(
              _createBetForm, event.ultimoEquipo,
              "BS_ULTIMO_HACER_CARRERAS")
      );
    }
    return widgets;
  }

}