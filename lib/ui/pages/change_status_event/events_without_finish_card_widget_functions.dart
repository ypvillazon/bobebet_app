import 'package:bobebet_app/models/event/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventsWithOutFinishCardWidgetFunctions {

  static Widget navigatorCardBar(_width, Event e) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text("Fecha " + e.date,  style: TextStyle(color: Colors.grey, fontSize: 14))
      ]
    );
  }


  static Widget content(execute, teamName, eventId) {
    return
      GestureDetector(
        onTap: () => { execute(teamName, eventId) },
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
                Text(((teamName.length>9) ? teamName.substring(0,9) + "..." : ((teamName=='draw') ? "Empate" : teamName)), style: TextStyle(color: Colors.white, fontSize: 14))
              ]
          )
        )
      );
  }

}