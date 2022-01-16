
class GanadorSetDto {

  late bool available ;
  late String title ;
  late String home ;
  late double coeffH ;
  late double lastCoeffH ;
  late  bool showH ;
  late  int homeCoeffUp ;
  late  String away ;
  late  double coeffA ;
  late double lastCoeffA ;
  late  int awayCoeffUp ;
  late  bool showA ;

  GanadorSetDto.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      available = map['available'];
      title = map['title'];
      home = map['home'];
      coeffH = map['coeffH'];
      lastCoeffH = map['lastCoeffH'];
      showH = map['showH'];
      homeCoeffUp = map['homeCoeffUp'];
      away = map['away'];
      coeffA = map['coeffA'];
      lastCoeffA = map['lastCoeffA'];
      awayCoeffUp = map['awayCoeffUp'];
      showA = map['showA'];
    }
  }


}

