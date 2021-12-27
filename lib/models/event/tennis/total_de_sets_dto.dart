
class TotalDeSetsDto {

  bool available ;
  String title ;
  double menosDeSets ;
  double menosDeSetsCoeff ;
  double masDeSets ;
  double masDeSetsCoeff ;

  TotalDeSetsDto.fromMap(Map<String, dynamic> map) :
    available = map['available'],
    title = map['title'],
    menosDeSets = map['menosDeSets'],
    menosDeSetsCoeff = map['menosDeSetsCoeff'],
    masDeSets = map['masDeSets'],
    masDeSetsCoeff = map['masDeSetsCoeff'];


}

