import 'dart:ui';
import 'package:bobebet_app/models/operation.dart';
import 'package:bobebet_app/ui/pages/balance/balance_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OperationCardWidget extends StatefulWidget {
  final Operation operation;
  final String userSessionId ;

  OperationCardWidget({Key? key, required this.operation, required this.userSessionId}) : super(key: key);

  @override
  _OperationCardWidgetSate createState() => new _OperationCardWidgetSate();
}

class _OperationCardWidgetSate extends State<OperationCardWidget> {

  late Operation operation;
  late String userLoginId;

  late double _height;
  late double _width;

  @override
  void initState() {
    operation = widget.operation;
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery
        .of(context)
        .size
        .height;

    _width = MediaQuery
        .of(context)
        .size
        .width;

    return Card(
        key: UniqueKey(),
        color: Colors.white,
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: _width * 0.03),
                    padding: EdgeInsets.only(top: 10),
                    alignment: Alignment.topLeft,
                    width: _width / 1.5,
                    height: 50,
                    //color: Colors.green,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50))
                    ),
                    child: status(),
                  )
                ],
              )
              ,
              new Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: _height / 70),
                    Column(

                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("            De: ", style: TextStyle(color: Colors.deepPurple, fontSize: 16, fontWeight: FontWeight.bold)),
                              Text("${((widget.userSessionId == operation.fromUserId) ? " Mi" : operation.fromUserName)}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ((widget.userSessionId == operation.fromUserId) ? Colors.indigoAccent : Colors.black))),
                            ]
                        ),
                        SizedBox(height: 5),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("         Para: ", style: TextStyle(color: Colors.deepPurple, fontSize: 16, fontWeight: FontWeight.bold)),
                              Text("${((widget.userSessionId == operation.toUserId) ? "Mi" : operation.toUserName)}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ((widget.userSessionId == operation.toUserId) ? Colors.indigoAccent : Colors.black))),
                            ]
                        ),
                        SizedBox(height: _height / 70),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            BalanceWidgets.montoContent(operation.credit)
                          ],
                        ),
                        SizedBox(height: _height / 70),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            BalanceWidgets.changeContent(((widget.userSessionId == operation.toUserId) ? "Mi" : operation.toUserName), operation.userToCreditStart, operation.userToCreditEnd, operation.operation)
                          ],
                        ),
                        SizedBox(height: _height / 70),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text("Transaccion: ${operation.createdAt}", style: TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ])


    );
  }

  Widget status() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
            (operation.operation == "ADD") ? Icons.add_circle : Icons
                .remove_circle,
            color: (operation.operation == "ADD") ? Colors.green : Colors
                .redAccent, size: 25),
        Text(
            (operation.operation == "ADD") ? " ADICIONADO" : " SUSTRAIDO",
            style: TextStyle(
                color: (operation.operation == "ADD") ? Colors.green : Colors
                    .redAccent,
                fontSize: 18)),
      ],
    );
  }

}

