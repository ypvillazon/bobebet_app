import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_baseball/seguir_apostando_sport_baseball_card_widget_functions.dart';
import 'package:flutter/material.dart';

class ExtraInnings {

  static List<Widget> get(Event event, dynamic _createBetForm) {
    List<Widget> widgets = [];
    widgets.add(SeguirApostandoSportBaseballCardWidgetFunctions.extraInnings(_createBetForm, event.extraIningsDto));
    return widgets;
  }

}