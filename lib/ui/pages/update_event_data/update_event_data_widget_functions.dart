

import 'package:bobebet_app/models/downlaod_data_event_status_dto.dart';
import 'package:bobebet_app/models/event/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateEventDataWidgetFunctions {

  static Widget navigatorCardBar(_width, DownlaodDataEventStatusDto downlaodDataEventStatusDto, _refreshDataEvent) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Fecha: " + downlaodDataEventStatusDto.date),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.refresh, size: 30, color: Colors.deepPurple),
                onPressed: _refreshDataEvent
            )
          ],
        )
      ],
    );
  }

  static Widget footerCardBar(_width, _updateDataEvent) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(""),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.check_circle, size: 30, color: Colors.deepPurple),
                onPressed: _updateDataEvent
            )
          ],
        )
      ],
    );
  }

  static Widget updating(_width) {
    return Center(
        child: Container(
            width: _width/2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const LinearProgressIndicator(
                ),
                new Text("Actualizando...")
              ],
            ))
    ) ;
  }



  static Widget betContent(onCreateForm, teamName, teamCoeff, teamCoeffUp, bool close, sport, onMsg) {
    return
      GestureDetector(
        onTap: () => { (close) ? onMsg((teamName == "draw") ? "el empate" : teamName) : onCreateForm(teamName, teamCoeff, sport) },
        child: Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: new LinearGradient(colors: [Colors.deepPurple, Colors.deepPurple.shade400], begin: Alignment.topCenter, end: Alignment.bottomCenter)
          ),
          child: (close) ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.close, size: 26, color: Colors.white,)
                ],
              )
            :
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(((teamName.length>9) ? teamName.substring(0,9) + "..." : ((teamName=='draw') ? "Empate" : teamName)), style: TextStyle(color: Colors.white, fontSize: 14)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(teamCoeff.toString(), style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                      Icon(
                        ((teamCoeffUp==0) ? Icons.remove : (teamCoeffUp==1) ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                        color: ((teamCoeffUp==0) ? Colors.grey : (teamCoeffUp==1) ? Colors.greenAccent : Colors.red),
                      )
                    ],
                  )
                ],
              ),
        ),
      ) ;
  }

  static Widget detailsFootball(_width, DownlaodDataEventStatusDto downlaodDataEventStatusDto) {
    return Column(
      children: [
        element("Marcadores finales: ", downlaodDataEventStatusDto.marcadoresFinales),
        SizedBox(height: 5),
        element("Marcadores del primer tiempo: ", downlaodDataEventStatusDto.marcadoresPrimerTiempo),
        SizedBox(height: 5),
        element("Marcadores del segundo tiempo: ", downlaodDataEventStatusDto.marcadoresSegundoTiempo),
        SizedBox(height: 5),
        element("Tiempo con primer gol: ", downlaodDataEventStatusDto.tiempoConPrimerGol),
        SizedBox(height: 5),
        element("Tiempo con más goles: ", downlaodDataEventStatusDto.tiempoConMasGoles),
        SizedBox(height: 5),
        element("Tiempo con más goles (visitador): ", downlaodDataEventStatusDto.tiempoConMasGolesEquipoA),
        SizedBox(height: 5),
        element("Tiempo con más goles (casa): ", downlaodDataEventStatusDto.tiempoConMasGolesEquipoH),
        SizedBox(height: 5),
        element("Total de goles (3 desenlaces): ", downlaodDataEventStatusDto.totalGoles3Desenlaces)

      ],
    ) ;
  }

  static Widget detailsBasketball(_width, DownlaodDataEventStatusDto downlaodDataEventStatusDto) {
    return Column(
      children: [
        element("Margen de victoria: ", downlaodDataEventStatusDto.margenDeVictoria),
        SizedBox(height: 5),
        element("Mitad con más puntos: ", downlaodDataEventStatusDto.mitadConMasPuntos),
        SizedBox(height: 5),
        element("Cuarto con más punto: ", downlaodDataEventStatusDto.cuartoConMasPuntos),
        SizedBox(height: 5),
        element("Prórroga en el partido: ", downlaodDataEventStatusDto.prorrogaEnElPartido)
      ],
    ) ;
  }

  static Widget element(String title, bool value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text((value) ? "Si" : "No", style: TextStyle(color: (value ? Colors.green: Colors.red)),),
            Text("          "),
          ],
        )
      ],
    );
  }

  static Widget updates(_width, DownlaodDataEventStatusDto downlaodDataEventStatusDto) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("¿Actualizado? (al menos una): ", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text((downlaodDataEventStatusDto.downloadData) ? "Si" : "No", style: TextStyle(color: (downlaodDataEventStatusDto.downloadData ? Colors.green: Colors.red)),),
              ],
            )
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("Última actualización: ", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text((downlaodDataEventStatusDto.downloadDataDate=="") ? " - " : downlaodDataEventStatusDto.downloadDataDate),
              ],
            )
          ],
        )
      ],
    ) ;
  }

}