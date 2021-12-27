import 'package:bobebet_app/models/event/coeff_per_marker.dart';
import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/seguir_apostando_sport_football_card_widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FootballMarcadoresPrimerTiempo {

  static List<Widget> get(Event event, dynamic _createBetForm, String betType, String text) {
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
              SeguirApostandoSportFootballCardWidgetFunctions.teamTitle(((event.teamHomeName.length>9) ? event.teamHomeName.substring(0,9) + "..." : event.teamHomeName)),
              SeguirApostandoSportFootballCardWidgetFunctions.teamTitle("Empate"),
              SeguirApostandoSportFootballCardWidgetFunctions.teamTitle(((event.teamAwayName.length>9) ? event.teamAwayName.substring(0,9) + "..." : event.teamAwayName)),
            ],
          )
      ),
    ) ;
    for (int i = 0; i < event.firstHalfMarkers.markers.length; i++) {
      CoeffPerMarker coeffPerMarker = event.firstHalfMarkers.markers[i] ;
      widgets.add( Container(color: Colors.white, child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          (coeffPerMarker.markerHome != "")
              ?
          GestureDetector(
            onTap: () => {
              _createBetForm(coeffPerMarker.markerHome, coeffPerMarker.markerHome, coeffPerMarker.coeffHome, betType, text)
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: new LinearGradient( colors: [Colors.deepPurple, Colors.deepPurple], begin: Alignment.topCenter, end: Alignment.bottomCenter)
              ),
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: <Widget>[
                  Text(coeffPerMarker.markerHome, style: TextStyle(color: Colors.white, fontSize: 14)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${double.parse((coeffPerMarker.coeffHome).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            ),
          )
              :
          Container(height: 50, width: 100),
          (coeffPerMarker.markerDraw != "")
              ?
          GestureDetector(
            onTap: () => {
              _createBetForm(coeffPerMarker.markerDraw, coeffPerMarker.markerDraw, coeffPerMarker.coeffDraw, betType, text)
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                  gradient: new LinearGradient( colors: [Colors.deepPurple, Colors.deepPurple], begin: Alignment.topCenter, end: Alignment.bottomCenter)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(coeffPerMarker.markerDraw, style: TextStyle(color: Colors.white, fontSize: 14)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${double.parse((coeffPerMarker.coeffDraw).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            ),
          )
              : Container(height: 50, width: 100),
          (coeffPerMarker.markerAway != "")
              ? GestureDetector(
            onTap: () => {
              _createBetForm(coeffPerMarker.markerAway, coeffPerMarker.markerAway, coeffPerMarker.coeffAway, betType, text)
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(10),
                  gradient: new LinearGradient( colors: [Colors.deepPurple, Colors.deepPurple], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: <Widget>[
                  Text( coeffPerMarker.markerAway, style: TextStyle(color: Colors.white, fontSize: 14)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text( "${double.parse((coeffPerMarker.coeffAway).toStringAsFixed(3))}", style: TextStyle( color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            ),
          )
              : Container(height: 50, width: 100, )
        ],
      )));
      widgets.add(
          SizedBox(height: 10, child: Container(color: Colors.white,),)
      );
    }
    return widgets ;
  }
}
