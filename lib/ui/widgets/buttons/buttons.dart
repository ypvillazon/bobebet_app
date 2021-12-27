import 'package:flutter/material.dart';

class Buttons {

  static Widget submitButton(dynamic _onPressed, BuildContext context, String title) {
    return GestureDetector(
        onTap: _onPressed,
        child:  Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.deepPurple.shade300, Colors.deepPurple])),
          child: Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),

        )
    );
  }

  static Widget backButton(BuildContext context, {color: Colors.black}) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, "back");
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: color, size: 22,),
            ),
            Text('Atrás',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: color))
          ],
        ),
      ),
    );
  }

  static Widget dialogButton(dynamic _onPressed, BuildContext context, String title, Color color, ) {
    return GestureDetector(
        onTap: _onPressed,
        child:  Container(
          width: (MediaQuery.of(context).size.width/3.7)-10,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              color: color
              ),
          child: Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),

        )
    );
  }

  static Widget cancelButton(dynamic _onPressed, BuildContext context, String title) {
    return GestureDetector(
        onTap: _onPressed,
        child:  Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.redAccent, Colors.redAccent])),
          child: Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),

        )
    );
  }

}