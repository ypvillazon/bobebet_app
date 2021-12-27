import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/models/event/football/paridad_goles_dto.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_baseball/seguir_apostando_sport_baseball_card_widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarrerasPorEntrada {

  static List<Widget> get(Event event, dynamic _createBetForm) {
    List<Widget> widgets = [];
    if(event.resultadoPrimerasCincoEntradas.available) {
      widgets.add(
          SeguirApostandoSportBaseballCardWidgetFunctions
              .carrerasEntradasContent(
              _createBetForm, event.resultadoPrimerasCincoEntradas,
              "BS_PRIMERAS_CINCO_ENTRADAS")
      );
    }
    if(event.resultadoPrimeraEntrada.available) {
      widgets.add(
          SeguirApostandoSportBaseballCardWidgetFunctions
              .carrerasEntradasContent(
              _createBetForm, event.resultadoPrimeraEntrada,
              "BS_PRIMERA_ENTRADA")
      );
    }
    if(event.resultadoSegundaEntrada.available) {
      widgets.add(
          SeguirApostandoSportBaseballCardWidgetFunctions
              .carrerasEntradasContent(
              _createBetForm, event.resultadoSegundaEntrada,
              "BS_SEGUNDA_ENTRADA")
      );
    }

    return widgets;
  }

}