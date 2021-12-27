
import 'dart:convert';

import 'package:bobebet_app/models/event_filters.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/get_event_filters_service.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:flutter/material.dart';

class FilterEventPage extends StatefulWidget {
  FilterEventPage({Key? key}) : super(key: key);

  @override
  _FilterEventPageState createState() => new _FilterEventPageState();
}

class _FilterEventPageState extends State<FilterEventPage> {

  late double _height;
  late double _width;
  List filters = [];
  List<String> namesSelected = [];

  GetEventFiltersService getEventFiltersService = GetEventFiltersService() ;

  @override
  void initState() {
    _fetch() ;
    super.initState();
  }

  void _fetch() {
    Prefs.namesSelected.then((v) => {
      if(v != '') {
        setState(() {
          namesSelected = (jsonDecode(v) as List).map((eid) => eid.toString()).toList() ;
        })
      },
      getEventFiltersService.eventFilters().then((value) {
        if (value.statusCode == 0) {
            setState(() {
              filters = value.eventFilters;
              for(var i=0;i<filters.length;i++) {
                if(namesSelected.contains(filters[i].name)){
                  filters[i].selected = true;
                }
              }
            });
          } else {
            if (value.statusCode == 461) {
              MessageWidget.expiredVersion(context);
            } else {
              if (value.statusCode == 99) {
                MessageWidget.expired(context);
              } else {
                MessageWidget.error(context, value.message, 4);
              }
            }
          }
        }).catchError((error) {
          MessageWidget.error(context, "Ha ocurrido un error. Detalles: " + error, 4);
        })
      });
  }

  _selectedFilters(EventFilter e, v) {
    setState(() {
      e.selected = v;
    });
    for(var i=0;i<filters.length;i++) {
      if(filters[i].parents.contains(e.name)){

        setState(() {
          filters[i].selected = v;
        });
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          width: _width,
            height: _height,
            color: Colors.white,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: _height * .05),
                Buttons.backButton(context),
                Text("¿Qué partidos quieres seguir?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                Text(""),
                Expanded(
                    child:
                    (filters.length == 0)
                        ?
                    Center(child: CircularProgressIndicator())
                        :
                    ListView.builder(
                        itemCount: filters.length,
                        //padding: const EdgeInsets.all(10.0),
                        itemBuilder: (context, index) {
                          EventFilter e = filters[index] ;
                          if(e.level!=4) {
                            return Container(
                              decoration: BoxDecoration(
                                color: ((e.level == 1) ? Colors.deepPurple.shade400 : (e.level == 2) ? Colors.deepPurple.shade100 : (e.level == 3) ? Colors.deepPurple.shade200 : Colors.deepPurple.shade100),
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.only(left: double.parse((10 * e.level - 1).toString())),
                                leading: Checkbox(
                                  value: e.selected,
                                  onChanged: (v) => {
                                    _selectedFilters(e, v)
                                  },
                                  focusColor: Colors.white,
                                ),

                                title: Text(e.name, style: TextStyle(color: Colors.black, fontWeight: ((e.level == 1) ? FontWeight.bold : FontWeight.normal))),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        }
                    )
                ),
                SizedBox(height: _height/60),
                Buttons.submitButton(()=>{
                  namesSelected=[],
                  for(var i=0;i<filters.length;i++) {
                    if(filters[i].level==2 && filters[i].selected){
                      namesSelected.add(filters[i].name)
                    }
                  },
                  //if(namesSelected.length ==0){
                 //   namesSelected.add("99999")
                  //},
                  Prefs.setNamesSelected(jsonEncode(namesSelected)) ,
                  Navigator.of(context).pop(namesSelected)
                }, context, "Aceptar")
              ],
            )
        )
    );
  }

}
