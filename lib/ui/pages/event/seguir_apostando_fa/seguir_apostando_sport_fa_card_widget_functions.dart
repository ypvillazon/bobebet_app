
import 'package:bobebet_app/models/event/american_football/fa_cuarto_con_mas_puntos_dto.dart';
import 'package:bobebet_app/models/event/american_football/fa_option_puntos.dart';
import 'package:flutter/material.dart';

class SeguirApostandoSportFACardWidgetFunctions {

  static Widget teamTitle(teamName) {
    return Container(
      height: 30,
      width: 100,
      child: Text(((teamName.length>13) ? teamName.substring(0,9) + "..." : ((teamName=='draw') ? "Empate" : teamName)), style: TextStyle(fontSize: 14, color: Colors.deepPurple),textAlign: TextAlign.center,),
    );
  }

  static Widget teamTitle1(teamName) {
    return Container(
      height: 30,
      width: 140,
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

  static Widget cuartosConMasPuntosContent(onCreateForm, targetName, targetDescription, coeff, betType, text, {double width=100, String customTargetName=""}) {
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


  static Widget cuartosConMasPuntos(_createBetForm, FACuartoConMasPuntosDto faCuartoConMasPuntosDto) {
    String text = " con más puntos en el partido" ;
    String type = "FA_CUARTO_CON_MAS_PUNTOS" ;
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
                            cuartosConMasPuntosContent(_createBetForm, faCuartoConMasPuntosDto.optionCuarto1, faCuartoConMasPuntosDto.optionCuarto1, faCuartoConMasPuntosDto.coeffCuarto1, type, text, width: 150),
                            cuartosConMasPuntosContent(_createBetForm, faCuartoConMasPuntosDto.optionCuarto2, faCuartoConMasPuntosDto.optionCuarto2, faCuartoConMasPuntosDto.coeffCuarto2, type, text, width: 150),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            cuartosConMasPuntosContent(_createBetForm, faCuartoConMasPuntosDto.optionCuarto3, faCuartoConMasPuntosDto.optionCuarto3 , faCuartoConMasPuntosDto.coeffCuarto3, type, text, width: 150),
                            cuartosConMasPuntosContent(_createBetForm, faCuartoConMasPuntosDto.optionCuarto4, faCuartoConMasPuntosDto.optionCuarto4 , faCuartoConMasPuntosDto.coeffCuarto4, type, text, width: 150),
                          ],
                        ),
                        SizedBox(height: 20),
                      ]
                  )
              )
            ])
    );
  }



  static Widget desenlaceDosOpcionesContent(_createBetForm, FAOptionPuntos faOptionPuntos, String betType, _onMsg) {
    return  Container(color: Colors.white, child: Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        desenlaceDosOptionContent(_createBetForm, faOptionPuntos.puntosMenos, faOptionPuntos.coeffMenos, faOptionPuntos.showMenos, "Menos de", betType, _onMsg),
        desenlaceDosOptionContent(_createBetForm, faOptionPuntos.puntosMas, faOptionPuntos.coeffMas, faOptionPuntos.showMas, "Más de", betType, _onMsg)
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