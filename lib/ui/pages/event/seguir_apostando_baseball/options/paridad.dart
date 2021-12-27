import 'package:bobebet_app/models/event/football/paridad_goles_dto.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_baseball/seguir_apostando_sport_baseball_card_widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Paridad {

  static List<Widget> get(ParidadGolesDto paridadGolesDto, dynamic _createBetForm, String betType) {
    List<Widget> widgets = [];
    widgets.add(
          SeguirApostandoSportBaseballCardWidgetFunctions.paridadContent(_createBetForm, paridadGolesDto, betType)
    );
    return widgets;
  }

}