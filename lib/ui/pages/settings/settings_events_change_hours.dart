
import 'package:bobebet_app/models/hour_configuration.dart';
import 'package:bobebet_app/services/get_hour_settings_service.dart';
import 'package:bobebet_app/services/update_hour_settings_service.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/Texts.dart';
import 'package:bobebet_app/ui/widgets/common/bezierContainer.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/ui/widgets/fields/fields.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:bobebet_app/utils/validator.dart';
import 'package:flutter/material.dart';

class SettingEventsChangeTimePage extends StatefulWidget {
  SettingEventsChangeTimePage({Key? key}) : super(key: key);

  @override
  _SettingEventsChangeTimePageState createState() => _SettingEventsChangeTimePageState();
}

class _SettingEventsChangeTimePageState extends State<SettingEventsChangeTimePage> {

  UpdateHourSettingsService updateHourSettingsService = UpdateHourSettingsService() ;
  GetHourSettingsService getHourSettingsService = GetHourSettingsService() ;

  TextEditingController hourConfigurationController = new TextEditingController() ;
  TextEditingController statsHourConfigurationController = new TextEditingController() ;


  Validator validator = Validator() ;
  bool loading = false ;
  String hours = "12";
  String statsHours = "48";
  late HourConfiguration hourConfiguration ;

  @override
  void initState() {
    hourConfigurationController.text = hours ;
    statsHourConfigurationController.text = statsHours ;
    _load();
    super.initState();
  }

  _onChanceHours(String v) {
    setState(() {
      hours = v ;
    });
  }

  _onChanceStatsHours(String v) {
    setState(() {
      statsHours = v ;
    });
  }

  void _load() {
    setState(() {
      loading=true;
    });
    getHourSettingsService.get().then((value) {
      if (value.statusCode == 0) {
        setState(() {
          hours=value.hourConfiguration.hours.toString();
          hourConfiguration = value.hourConfiguration ;
          hourConfigurationController.text = hourConfiguration.hours.toString() ;
          statsHourConfigurationController.text = hourConfiguration.statsHours.toString() ;
          loading = false ;
        });
      } else {
        setState(() {
          loading = false ;
        });
        MessageWidget.error(context, value.message, 4);
      }
    });
  }

  _onPressed() {
      if (validator.isEmpty(hours) || validator.isEmpty(statsHours)) {
        MessageWidget.error(context, "Las horas son obligatorias.", 3);
      } else {
        if (validator.validateNumber(hours) != "" || validator.validateNumber(statsHours) != "") {
          MessageWidget.error(context, "Las horas deben se solo dígitos.", 3);
        } else {
          if (int.parse(hours) < 1 || int.parse(hours) > 24) {
            MessageWidget.error(context, "La hora (eventos) debe ser mayor que 0 y menor que 24.", 3);
          } else {
            if (int.parse(statsHours) < 1) {
              MessageWidget.error(context, "La hora (estadisticas) debe ser mayor que 0.", 3);
            } else {
              setState(() {
                loading = true;
              });
              updateHourSettingsService.update(int.parse(hours), int.parse(statsHours)).then((value) => {
                if(value.statusCode == 0) {
                  setState(() {
                    loading = false;
                  }),
                  MessageWidget.info(context, "Horas cambiadas con éxito", 3)
                } else {
                    setState(() {
                      loading = false;
                    }),
                    if (value.statusCode == 461) {
                      MessageWidget.expiredVersion(context)
                    } else {
                        if (value.statusCode == 99) {
                          MessageWidget.expired(context)
                        } else {
                            MessageWidget.error(context, value.message, 4)
                          }
                      }
                  }
              });
            }
          }
        }
      }
    }

  Widget _emailPasswordWidget() {
    return Column(
        children: <Widget>[
        Fields.entryField("Horas (eventos)", _onChanceHours, controller: hourConfigurationController, help: "* Especifica la cantidad de horas a futuro que para mostrar los proximos partidos, por defecto es 12 horas."),
        Fields.entryField("Horas (estadisticas)", _onChanceStatsHours, controller: statsHourConfigurationController, help: "* Especifica la cantidad de horas para mostrar las estadisticas, por defecto es 48 horas para atras.")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body:
        loading ?
        HelperFunctions.loading()
        :
        Container(
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
                  Buttons.backButton(context, color: Colors.black),
                  SizedBox(height: height * .1),
                  Texts.title1(),
                  Texts.title2(),
                  SizedBox(height: height/20),
                  _emailPasswordWidget(),
                  SizedBox(height: 20),
                  Buttons.submitButton(_onPressed, context, "Aceptar"),
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
