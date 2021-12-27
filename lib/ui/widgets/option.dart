import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {
  OptionWidget({Key? key, required this.icon, required this.title, required this.subtitle, required this.onPressed}) :
        super(key: key);

  late IconData icon;
  late String title ;
  late String subtitle ;
  late Function() onPressed  ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(this.icon, size: 50, color: Colors.deepPurple ),
                title: Text(this.title, style: TextStyle(fontSize:16, color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                subtitle: Text(this.subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 13) ),
              ),
            ],
          ),
        ));
  }
}