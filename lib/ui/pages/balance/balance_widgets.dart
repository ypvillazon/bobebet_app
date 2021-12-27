import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BalanceWidgets {

  static Widget montoContent(monto) {
    return Container(
      height: 55,
      width: 200,
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: new LinearGradient(colors: [Colors.deepPurple, Colors.deepPurple.shade400], begin: Alignment.topCenter, end: Alignment.bottomCenter)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Monto", style: TextStyle(color: Colors.white, fontSize: 14), textAlign: TextAlign.center,),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("\$${double.parse((monto).toStringAsFixed(2))}", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
  }

  static Widget changeContent(name,start,end, op) {
    return Container(
      height: 55,
      width: 200,
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(name, style: TextStyle(color: Colors.deepPurple, fontSize: 14), textAlign: TextAlign.center,),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("\$${double.parse((start).toStringAsFixed(2))}", style: TextStyle(color: Colors.deepPurple, fontSize: 16, fontWeight: FontWeight.bold)),
              Text("   >   ", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
              Text("\$${double.parse((end).toStringAsFixed(2))}", style: TextStyle(color: (op == "ADD" ? Colors.green : Colors.red), fontSize: 16, fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
  }

}