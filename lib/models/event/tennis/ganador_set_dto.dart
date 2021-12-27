
class GanadorSetDto {

  bool available ;
  String title ;
  String home ;
  double coeffH ;
  double lastCoeffH ;
  bool showH ;
  int homeCoeffUp ;
  String away ;
  double coeffA ;
  double lastCoeffA ;
  int awayCoeffUp ;
  bool showA ;

  GanadorSetDto.fromMap(Map<String, dynamic> map) :
    available = map['available'],
    title = map['title'],
    home = map['home'],
    coeffH = map['coeffH'],
    lastCoeffH = map['lastCoeffH'],
    showH = map['showH'],
    homeCoeffUp = map['homeCoeffUp'],
    away = map['away'],
    coeffA = map['coeffA'],
    lastCoeffA = map['lastCoeffA'],
    awayCoeffUp = map['awayCoeffUp'],
    showA = map['showA'];


}

