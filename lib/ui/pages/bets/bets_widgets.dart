import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventBetsWidgets {

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

  static Widget betContent(_width, teamName, targetDescription, teamCoeff) {
    return Container(
      height: 65,
      width: _width/1.3,
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: new LinearGradient(colors: [Colors.deepPurple, Colors.deepPurple.shade400], begin: Alignment.topCenter, end: Alignment.bottomCenter)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text((targetDescription == null ? ((teamName == 'draw') ? "Empate" : teamName) : ((targetDescription == 'draw') ? "Empate" : targetDescription)), style: TextStyle(color: Colors.white, fontSize: 14), textAlign: TextAlign.center,),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(teamCoeff.toString(), style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
  }

  static String processTarget(String target) {
    return target.replaceAll("_H", " a casa").replaceAll("_A", " al visitante").replaceAll("_", " ") ;
  }

}