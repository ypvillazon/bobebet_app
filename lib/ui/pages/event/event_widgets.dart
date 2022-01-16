

import 'package:bobebet_app/models/event/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventsWidgets {

  static Widget navigatorCardBar(_width, Event e, _updateEvent) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Faltan " + e.time + "...",  style: TextStyle(color: Colors.grey, fontSize: 14, fontStyle: FontStyle.italic)),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.refresh, size: 30, color: Colors.deepPurple),
                onPressed: _updateEvent
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



  static Widget betContent(onCreateForm, teamName, teamCoeff, teamCoeffUp, bool show, sportType, onMsg, double width) {
    return
      GestureDetector(
        onTap: () => { (!show) ? onMsg((teamName == "draw") ? "el empate" : teamName) : onCreateForm(teamName, teamCoeff, sportType) },
        child: Container(
          height: 50,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: new LinearGradient(colors: [Colors.deepPurple, Colors.deepPurple.shade400], begin: Alignment.topCenter, end: Alignment.bottomCenter)
          ),
          child: (!show) ?
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

}