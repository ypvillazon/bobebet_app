class FootBallOptionMargenDeVictoriaDto {
  late String option ;
  late int goles ;
  late String team ;
  late String typeTeam ;
  late double coeffSi ;
  late double coeffNo ;

  FootBallOptionMargenDeVictoriaDto.fromMap(Map<String, dynamic> map) {
    option = map['option'];
    goles = map['goles'];
    team = map['team'];
    typeTeam = map['typeTeam'];
    coeffSi = map['coeffSi'];
    coeffNo = map['coeffNo'];
  }

}