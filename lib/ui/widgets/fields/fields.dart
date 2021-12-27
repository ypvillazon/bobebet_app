import 'dart:ui';

import 'package:flutter/material.dart';

class Fields {

  static Widget entryField(String title, dynamic _onchange, {bool isPassword = false, controller: null, textInputType=TextInputType.number, help="", width=null}) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            "${help}",
            style: TextStyle(fontSize: 10, color: Colors.grey, fontStyle: FontStyle.italic),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              keyboardType: textInputType,
              controller: controller,
              onChanged: _onchange,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  static Widget doubleField(String title, dynamic _onchange, creditController, {focusNode, help=""}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            "${help}",
            style: TextStyle(fontSize: 10, color: Colors.grey, fontStyle: FontStyle.italic),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              focusNode: focusNode,
              controller: creditController,
              keyboardType: TextInputType.number,
              onChanged: _onchange,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

}