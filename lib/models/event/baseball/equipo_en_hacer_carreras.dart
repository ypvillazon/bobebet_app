import 'package:bobebet_app/models/event/baseball/option_total_carreras_desenlace.dart';

class EquipoEnHacerCarreras {

  late bool available ;
  late  String title ;
  late  String teamHome ;
  late  String teamAway ;
  late  double coeffHome ;
  late  double coeffAway ;

  EquipoEnHacerCarreras.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      title = map['title'];
      available = map['available'];
      teamHome = map['teamHome'];
      teamAway = map['teamAway'];
      coeffHome = map['coeffHome'];
      coeffAway = map['coeffAway'];
    }
  }

}

