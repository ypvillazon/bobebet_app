import 'package:bobebet_app/models/event/football/equipo_en_hacer.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/seguir_apostando_sport_football_card_widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EquipoEnHacerList {

  static List<Widget> primero(EquipoEnHacer primerEnHacer, dynamic _createBetForm, _onMsg) {
    List<Widget> widgets = [];
    if (primerEnHacer.marcarUnGolAvailable) {
	    widgets.add(
		  SeguirApostandoSportFootballCardWidgetFunctions
		      .equipoEnHacer(
		    _createBetForm,
		    primerEnHacer.marcarUnGolOption,
		    primerEnHacer.home,
		    primerEnHacer.away,
		    primerEnHacer.none,
		    primerEnHacer.marcarUnGolCoeffH,
		    primerEnHacer.marcarUnGolCoeffA,
		    primerEnHacer.marcarUnGolCoeffNone,
		    "FT_PRIMER_EQUIPO_MARCAR_GOL",
        _onMsg
		  )
	     );
     }

     if (primerEnHacer.recibirTarjetaAmarillaAvailable) {
	      widgets.add(
		  SeguirApostandoSportFootballCardWidgetFunctions
		      .equipoEnHacer(
		      _createBetForm,
		      primerEnHacer.recibirTarjetaAmarilla,
		      primerEnHacer.home,
		      primerEnHacer.away,
		      primerEnHacer.none,
		      primerEnHacer.recibirTarjetaAmarillaCoeffH,
		      primerEnHacer.recibirTarjetaAmarillaCoeffA,
		      primerEnHacer.recibirTarjetaAmarillaCoeffNone,
		      "FT_PRIMER_EQUIPO_TENER_TARJETA_AMARILLA",
          _onMsg
		  )
	      );
      }
    
      if (primerEnHacer.tomarUnCornerAvailable) {
	      widgets.add(
		  SeguirApostandoSportFootballCardWidgetFunctions
		      .equipoEnHacer(
		    _createBetForm,
		    primerEnHacer.tomarUnCornerOption,
		    primerEnHacer.home,
		    primerEnHacer.away,
		    primerEnHacer.none,
		    primerEnHacer.tomarUnCornerCoeffH,
		    primerEnHacer.tomarUnCornerCoeffA,
		    primerEnHacer.tomarUnCornerCoeffNone,
		    "FT_PRIMER_EQUIPO_HACER_CORNER",
        _onMsg
		  )
	      );
      }
    return widgets;
  }

  static List<Widget> ultimo(EquipoEnHacer ultimoEnHacer, dynamic _createBetForm, _onMsg) {
    List<Widget> widgets = [];
    if(ultimoEnHacer.available) {

			if (ultimoEnHacer.marcarUnGolAvailable) {
				widgets.add(
						SeguirApostandoSportFootballCardWidgetFunctions
								.equipoEnHacer(
								_createBetForm,
								ultimoEnHacer.marcarUnGolOption,
								ultimoEnHacer.home,
								ultimoEnHacer.away,
								ultimoEnHacer.none,
								ultimoEnHacer.marcarUnGolCoeffH,
								ultimoEnHacer.marcarUnGolCoeffA,
								ultimoEnHacer.marcarUnGolCoeffNone,
								"FT_ULTIMO_EQUIPO_MARCAR_GOL",
								_onMsg
						)
				);
			}

			if (ultimoEnHacer.recibirTarjetaAmarillaAvailable) {
				widgets.add(
						SeguirApostandoSportFootballCardWidgetFunctions
								.equipoEnHacer(
								_createBetForm,
								ultimoEnHacer.recibirTarjetaAmarilla,
								ultimoEnHacer.home,
								ultimoEnHacer.away,
								ultimoEnHacer.none,
								ultimoEnHacer.recibirTarjetaAmarillaCoeffH,
								ultimoEnHacer.recibirTarjetaAmarillaCoeffA,
								ultimoEnHacer.recibirTarjetaAmarillaCoeffNone,
								"FT_ULTIMO_EQUIPO_TENER_TARJETA_AMARILLA",
								_onMsg
						)
				);
			}

			if (ultimoEnHacer.tomarUnCornerAvailable) {
				widgets.add(
						SeguirApostandoSportFootballCardWidgetFunctions
								.equipoEnHacer(
								_createBetForm,
								ultimoEnHacer.tomarUnCornerOption,
								ultimoEnHacer.home,
								ultimoEnHacer.away,
								ultimoEnHacer.none,
								ultimoEnHacer.tomarUnCornerCoeffH,
								ultimoEnHacer.tomarUnCornerCoeffA,
								ultimoEnHacer.tomarUnCornerCoeffNone,
								"FT_ULTIMO_EQUIPO_HACER_CORNER",
								_onMsg
						)
				);
			}
    }
    return widgets;
  }

}
