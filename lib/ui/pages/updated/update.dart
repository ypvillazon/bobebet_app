import 'dart:ui';

import 'package:bobebet_app/models/actualizacion.dart';
import 'package:bobebet_app/services/downlaod_actualizacion_service.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/bezierContainer.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class UpdatePage extends StatefulWidget {

  final Actualizacion actualizacion ;

  const UpdatePage({Key? key, required this.actualizacion}) : super(key: key);

  @override
  _UpdatePageScreenState createState() => _UpdatePageScreenState();
}

class _UpdatePageScreenState extends State<UpdatePage> {

  DownloadActualizacionService downloadActualizacionService = DownloadActualizacionService();

  @override
  void initState() {
    super.initState();
  }

  nuevaDescarga() {
    downloadActualizacionService.download(widget.actualizacion.nowVersionName).then((value) {});
  }

  void _launchURL() async {
    nuevaDescarga();
    await canLaunch(widget.actualizacion.downloadLink) ? await launch(widget.actualizacion.downloadLink) : throw 'Could not launch ${widget.actualizacion.downloadLink}';

  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height/20),
                      Buttons.backButton(context, color: Colors.white),
                      SizedBox(height: 30),
                      Icon(Icons.file_download, size: 100, color: Colors.deepPurple,),
                      Text("Nueva actualización", style: TextStyle(fontSize: 26, color: Colors.deepPurple, fontWeight: FontWeight.bold),),
                      SizedBox(height: 20),
                      Text("Versión instalada", style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      Text(widget.actualizacion.versionName , style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Text("Nueva versión", style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      Text(widget.actualizacion.nowVersionName , style: TextStyle(fontSize: 20,color: Colors.teal, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Text("La versión caduca en", style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      Text(widget.actualizacion.tiempoRestanteActualizar , style: TextStyle(fontSize: 20,color: Colors.red, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Buttons.submitButton(_launchURL, context, "Actualizar ahora"),
                      SizedBox(height: 20),
                      Buttons.cancelButton(() => {
                        if (widget.actualizacion.versionAppStatus != 'OBSOLETA') {
                          Navigator.pop(context, "back")
                        } else {
                          MessageWidget.info(context, "Debe actualizar obligatoriamente, esta versión esta obsoleta.", 5)
                        }
                      }, context, "Actualizar más tarde"),

                    ],
                  ),
                ),
              ),
              //Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        ));

  }
}
