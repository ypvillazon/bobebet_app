import 'package:flutter/material.dart';
import 'package:bobebet_app/ui/widgets/responsive_ui.dart';

class CustomTextField extends StatelessWidget {

  late String hint;
  late TextEditingController textEditingController;
  late TextInputType keyboardType;
  late bool obscureText;
  late IconData icon;
  late double _width;
  late double _pixelRatio;
  late bool large;
  late bool medium;
  final ValueChanged<String> onChanged;


  CustomTextField(
    {required this.hint,
      required this.textEditingController,
      required this.keyboardType,
      required this.icon,
      this.obscureText=false,
      required this.onChanged
     });

  _onChanged(String v) {
    onChanged(v) ;
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium=  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      //color: Colors.white,
      //shadowColor: Theme.of(context).cardTheme.shadowColor,
      borderRadius: BorderRadius.circular(15.0),
      elevation: large? 12 : (medium? 10 : 8),
      child: TextFormField(
        //style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
        onChanged: _onChanged,
        obscureText: this.obscureText,
        controller: textEditingController,
        keyboardType: keyboardType,
        //cursorColor: Colors.orange[200],
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Theme.of(context).primaryColor, size: 20),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
