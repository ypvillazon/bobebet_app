
import 'package:bobebet_app/models/event/boxing/option_total_puntos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeguirApostandoSportBoxingCardWidgetFunctions {

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



  static Widget desenlaceDosOpcionesContent(_createBetForm, OptionTotalCompletedRoundsDosDesenlacesDto optionTotalPuntos, String betType, _onMsg) {
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
          _createBetForm(text + "_" + puntos.toString(), text + " " + puntos.toString() + " ronda(s)", coeff, betType, "")
        } else {
          _onMsg(text + " " + puntos.toString() + " ronda(s)")
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
            Text(puntos.toString() + (puntos==1 ? " ronda" : " rondas"), style: TextStyle(color: Colors.white, fontSize: 14)),
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