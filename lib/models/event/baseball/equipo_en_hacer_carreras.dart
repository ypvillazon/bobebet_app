import 'package:bobebet_app/models/event/baseball/option_total_carreras_desenlace.dart';

class EquipoEnHacerCarreras {

  bool available ;
  String title ;
  String teamHome ;
  String teamAway ;
  double coeffHome ;
  double coeffAway ;

  EquipoEnHacerCarreras.fromMap(Map<String, dynamic> map) :
    title = map['title'],
    available = map['available'],
    teamHome = map['teamHome'],
    teamAway = map['teamAway'],
    coeffHome = map['coeffHome'],
    coeffAway = map['coeffAway'];

}

