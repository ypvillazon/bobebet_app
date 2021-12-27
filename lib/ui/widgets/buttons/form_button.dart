import 'package:flutter/material.dart';
import 'package:bobebet_app/ui/widgets/responsive_ui.dart';

class FormButtonWidget extends StatelessWidget {
  FormButtonWidget({required Key key, required this.title, required this.onPressed }) :
        super(key: key);

  final String title ;
  final Function onPressed;

  late double _w;
  late double _h;
  late double _p;
  late  bool _l;
  late bool _m;

  _onPressed() {
    onPressed();
  }

  @override
  Widget build(BuildContext context) {
    _w = MediaQuery.of(context).size.width;
    _h = MediaQuery.of(context).size.height;
    _p = MediaQuery.of(context).devicePixelRatio;
    _l = ResponsiveWidget.isScreenLarge(_w, _p);
    _m = ResponsiveWidget.isScreenMedium(_w, _p);

    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: _onPressed,
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: _l ? _w / 4 : (_m ? _w / 3.75 : _w / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color:  Theme.of(context).primaryColor
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          title,
          //style: TextStyle(fontSize: _l ? 16 : (_m ? 12 : 14), color: Theme.of(context).cardTheme.color,),
        ),
      ),
    );
  }

}