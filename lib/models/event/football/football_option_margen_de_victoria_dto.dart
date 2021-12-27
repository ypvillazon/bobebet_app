class FootBallOptionMargenDeVictoriaDto {
  String option ;
  int goles ;
  String team ;
  String typeTeam ;
  double coeffSi ;
  double coeffNo ;

  FootBallOptionMargenDeVictoriaDto.fromMap(Map<String, dynamic> map) :
    option = map['option'],
    goles = map['goles'],
    team = map['team'],
    typeTeam = map['typeTeam'],
    coeffSi = map['coeffSi'],
    coeffNo = map['coeffNo'];

}