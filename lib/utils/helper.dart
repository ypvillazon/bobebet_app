import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelperFunctions {

  static String getValidPhoneNumber(Iterable phoneNumbers) {
    if (phoneNumbers != null && phoneNumbers.toList().isNotEmpty) {
      List phoneNumbersList = phoneNumbers.toList();
      return phoneNumbersList[0].value;
    }
    return "";
  }

  static Widget loading() {
    return Center(
        child: Container(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {},
            child: CircularProgressIndicator(),
          )),
        );
  }

  static Widget loading1() {
    return Center(
      child: Container(
          margin: EdgeInsets.only(top: 100),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {},
            child: CircularProgressIndicator(),
          )),
    );
  }

  static Widget updating(_width, {msg="Actualizando..."}) {
    return Center(
        child: Container(
          padding: EdgeInsets.all(20),
            width: _width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const LinearProgressIndicator(
                ),
                new Text(msg)
              ],
            ))
    ) ;
  }

  static Widget creatingBet(_width) {
    return Container(
        height: 60,
        width: _width/2,
        //color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const LinearProgressIndicator(
            ),
            new Text("Creando apuesta...", style: TextStyle(color: Colors.grey.shade600, fontStyle: FontStyle.italic),)
          ],
        )
    ) ;
  }

  static Widget betStatus(String status) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
            HelperFunctions.icons(status),
            color: HelperFunctions.color(status), size: 25),
        Text(
            HelperFunctions.texts(status),
            style: TextStyle(
                color: HelperFunctions.color(status),
                fontSize: 18)),
      ],
    );
  }

  static Color color(String status) {
    if(status == "WAIT") {
      return Colors.white;
    }
    if(status == "WON") {
      return Colors.greenAccent;
    }
    if(status == "CANCELED") {
      return Colors.yellowAccent;
    }
    if(status == "GANADO_MITAD") {
      return Colors.lightGreenAccent;
    }
    if(status == "EMPATE") {
      return Colors.orangeAccent;
    }
    if(status == "PERDIDO_MITAD") {
      return Colors.pinkAccent.shade100;
    }
    if(status == "LOST") {
      return Colors.redAccent;
    }
    return Colors.white;
  }

  static IconData icons(String status) {
    if(status == "WAIT") {
      return Icons.access_time;
    }
    if(status == "WON") {
      return Icons.thumb_up;
    }
    if(status == "CANCELED") {
      return Icons.cancel;
    }
    if(status == "GANADO_MITAD") {
      return Icons.wrap_text;
    }
    if(status == "EMPATE") {
      return Icons.code;
    }
    if(status == "PERDIDO_MITAD") {
      return Icons.money_off;
    }
    if(status == "LOST") {
      return Icons.thumb_down;
    }
    return Icons.access_time;
  }

  static String texts(String status) {
    if(status == "WAIT") {
      return " ESPERA ...";
    }
    if(status == "WON") {
      return " GANADO !";
    }
    if(status == "CANCELED") {
      return " CANCELADO !";
    }
    if(status == "GANADO_MITAD") {
      return " MITAD GANADA !";
    }
    if(status == "EMPATE") {
      return " EMPATADO !";
    }
    if(status == "PERDIDO_MITAD") {
      return " MITAD PERDIDO !";
    }
    if(status == "LOST") {
      return " PERDIDO !";
    }
    return " ESPERA ...";
  }

}