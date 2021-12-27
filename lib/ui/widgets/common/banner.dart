import 'package:flutter/material.dart';
import 'package:bobebet_app/ui/widgets/custom_shape.dart';
import 'package:bobebet_app/ui/widgets/responsive_ui.dart';

class BannerWidget extends StatelessWidget {
  BannerWidget({required Key key, required this.icon, }) :
        super(key: key);

  final IconData icon ;

  late double _height;
  late double _width;
  late double _pixelRatio;
  late bool _large;
  late bool _medium;

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
    _pixelRatio = MediaQuery
        .of(context)
        .devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    //double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 4
                  : (_medium ? _height / 3.75 : _height / 3.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Theme.of(context).primaryColor, Theme.of(context).primaryColor],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large
                  ? _height / 4.5
                  : (_medium ? _height / 4.25 : _height / 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Theme.of(context).primaryColor, Theme.of(context).primaryColor],
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 50),
          alignment: Alignment.bottomCenter,
          child: Icon(
            this.icon,
            size: 80,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

}