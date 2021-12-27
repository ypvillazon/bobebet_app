import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:bobebet_app/configuration/configuration.dart';
import 'package:bobebet_app/models/actualizacion.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/verificar_actualizacion_service.dart';
import 'package:bobebet_app/ui/pages/balance/balance_page.dart';
import 'package:bobebet_app/ui/pages/bets/bets_page.dart';
import 'package:bobebet_app/ui/pages/event/events.dart';
import 'package:bobebet_app/ui/pages/settings/settings.dart';
import 'package:bobebet_app/ui/pages/stats/bets/stats_home.dart';
import 'package:bobebet_app/ui/pages/updated/update.dart';
import 'package:bobebet_app/ui/pages/users/users.dart';
import 'package:bobebet_app/ui/widgets/common/Texts.dart';
import 'package:bobebet_app/ui/widgets/common/bezierContainer.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/ui/widgets/option.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {

  final String role ;
  final String userSessionId ;

  const HomePage({Key? key, required this.role, required this.userSessionId}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {

  bool verificandoActualizacion = false;
  List<String> namesSelected = [] ;
  bool hayQueActualizar = false;
  late Actualizacion actualizacion ;

  VerificarActualizacionService verificarActualizacionService = VerificarActualizacionService();

  @override
  void initState() {
    Prefs.namesSelected.then((v) => {
      if(v != '') {
        setState(() {
          namesSelected = (jsonDecode(v) as List).map((eid) => eid.toString()).toList() ;
        })
      },
    });
    checkActualizacion();
    super.initState();
  }

  checkActualizacion() {
    setState(() {
      verificandoActualizacion=true;
    });
    verificarActualizacionService.check().then((value) {
      if (value.statusCode == 0) {
        actualizacion = value.actualizacion;
        hayQueActualizar = (actualizacion.versionAppStatus == 'RECIENTE' || actualizacion.versionAppStatus == 'OBSOLETA');
        if(actualizacion.versionAppStatus != "ACTIVA") {
          if(IS_WEB) {
            MessageWidget.warn(context,
                "¡ NUEVA ACTUALIZACIÓN ! \n"
                "Usted presenta la versión " + actualizacion.versionName + " y la cual debe actualizar por " + actualizacion.nowVersionName + ". \n"
                "Para realizar esta acción, debe borrar la caché de nu navegador.\n"
                    "Para cerrar este mensaje, deslice hacia arriba." ,
                25, pos: FlushbarPosition.TOP);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                UpdatePage(actualizacion: actualizacion)));
          }
        }
        setState(() {
          verificandoActualizacion=false;
        });
      } else {
        setState(() {
          verificandoActualizacion=false;
        });
        MessageWidget.error(context, "No se ha podido verificar las actualizaciones.", 4);
      }
    });
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
                  child: BezierContainer(key: GlobalKey(),)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 40),
                      (hayQueActualizar) ?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                                icon: Icon(Icons.file_download, size: 40, color: Colors.white),
                              onPressed: ()=>{
                              Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePage(actualizacion: actualizacion)))
                              }
                          )
                        ],
                      ) :
                      Container()
                      ,
                      SizedBox(height: 50),

                      Texts.title1(),
                      Texts.title2(),
                      SizedBox(height: height/20),
                      OptionWidget(
                        key: GlobalKey(),
                        icon: Icons.access_time,
                        title: 'Partidos',
                        subtitle: 'Vea los próximos partidos.',
                        onPressed: () => {
                          Prefs.namesSelected.then((v) => {
                            if(v != '') {
                              setState(() {
                                namesSelected = (jsonDecode(v) as List).map((eid) => eid.toString()).toList() ;
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EventsPage(namesSelected: namesSelected)));
                              })
                            } else {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => EventsPage(namesSelected: namesSelected)))
                            },
                          })
                        },
                      ),
                      OptionWidget(
                        key: GlobalKey(),
                        icon: Icons.monetization_on,
                        title: 'Mis apuestas',
                        subtitle: 'Estados de los partidos.',
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BetsPage()))
                        },
                      ),
                      OptionWidget(
                        key: GlobalKey(),
                        icon: Icons.supervised_user_circle,
                        title: 'Usuarios',
                        subtitle: 'Administre sus bancos y usuarios.',
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UsersPage(expanded: false)))
                        },
                      ),
                      OptionWidget(
                        key: GlobalKey(),
                        icon: Icons.attach_money,
                        title: 'Balance',
                        subtitle: 'Vea las operaciones de dinero.',
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BalancePage(userSessionId: widget.userSessionId)))
                        },
                      ),
                      OptionWidget(
                          key: GlobalKey(),
                          icon: Icons.graphic_eq,
                          title: 'Estadísticas de apuestas',
                          subtitle: 'Estadísticas de mis usuarios.',
                          onPressed: () => {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => StatsHomePage()))
                          }
                      ),
                      /*
                      (widget.role == "ROLE_MASTER") ?
                      OptionWidget(
                        icon: Icons.build,
                        title: 'Estados de partidos',
                        subtitle: 'Cambiar partidos no finalizados',
                        onPressed: () => {
                          if(widget.role != "ROLE_MASTER") {
                            MessageWidget.error(context, "Solo el usuario Master puede acceder.", 4)
                          } else {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => EventsWithOutFinishPage()))
                          }
                        },
                      ) : Container(),
                       */
                      
                      /*
                      (widget.role == "ROLE_MASTER") ?
                      OptionWidget(
                        icon: Icons.perm_data_setting,
                        title: 'Datos de partido',
                        subtitle: 'Actualizar datos de los partidos',
                        onPressed: () => {
                          if(widget.role != "ROLE_MASTER") {
                            MessageWidget.error(context, "Solo el usuario Master puede acceder.", 4)
                          } else {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateEventDataPage()))
                          }
                        },
                      ) : Container(),
                       */

                      /*
                      (widget.role == "ROLE_MASTER" && widget.userSessionId == "aaaa.bbbb.cccc") ?
                      OptionWidget(
                          icon: Icons.money_off,
                          title: 'Ganancia Master',
                          subtitle: 'Estadísticas de ganancia del Master.',
                          onPressed: () => {
                            if(widget.role != "ROLE_MASTER") {
                              MessageWidget.error(context, "Solo el usuario Master puede acceder.", 4)
                            } else {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MasterLogsHomePage()))
                            }
                          }
                      ) : Container(),
                       */
                      OptionWidget(
                        key: GlobalKey(),
                        icon: Icons.settings_applications,
                        title: 'Configuración',
                        subtitle: 'Realice todos los ajustes necesarios.',
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()))
                        },
                      )
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
