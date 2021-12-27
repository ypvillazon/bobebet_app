class DownlaodDataEventStatusDto {
  late String eventId ;
  late String date;
  late String sport;
  late String name;
  late String game;
  late String event;
  late bool downloadData ;
  late String downloadDataDate ;
  late bool marcadoresFinales ;
  late bool marcadoresPrimerTiempo ;
  late bool marcadoresSegundoTiempo ;
  late bool tiempoConMasGoles ;
  late bool tiempoConPrimerGol ;
  late bool tiempoConMasGolesEquipoH ;
  late bool tiempoConMasGolesEquipoA ;
  late bool totalGoles3Desenlaces ;
  late bool prorrogaEnElPartido ;
  late bool margenDeVictoria ;
  late bool mitadConMasPuntos ;
  late bool cuartoConMasPuntos ;

  DownlaodDataEventStatusDto.fromJson(Map<String, dynamic> map){
    // date
    var dateDateTime = DateTime.parse(map['date']).toLocal() ;
    String dateConverted = "${dateDateTime.year}/${dateDateTime.month}/${dateDateTime.day} ${dateDateTime.hour}:${dateDateTime.minute}:${dateDateTime.second}" ;

    var downloadDataDateDateTime = DateTime.parse(map['downloadDataDate']).toLocal() ;
    String downloadDataDateConverted = "${downloadDataDateDateTime.year}/${downloadDataDateDateTime.month}/${downloadDataDateDateTime.day} ${downloadDataDateDateTime.hour}:${downloadDataDateDateTime.minute}:${downloadDataDateDateTime.second}" ;

    eventId = map['eventId'];
    date = dateConverted;
    sport = map['sport'];
    name = map['name'];
    game = map['game'];
    event = map['event'];
    downloadData = map['downloadData'];
    downloadDataDate = downloadDataDateConverted;
    marcadoresFinales = map['marcadoresFinales'];
    marcadoresPrimerTiempo = map['marcadoresPrimerTiempo'];
    marcadoresSegundoTiempo = map['marcadoresSegundoTiempo'];
    tiempoConMasGoles = map['tiempoConMasGoles'];
    tiempoConPrimerGol = map['tiempoConPrimerGol'];
    tiempoConMasGolesEquipoH = map['tiempoConMasGolesEquipoH'];
    tiempoConMasGolesEquipoA = map['tiempoConMasGolesEquipoA'];
    totalGoles3Desenlaces = map['totalGoles3Desenlaces'];
    prorrogaEnElPartido = map['prorrogaEnElPartido'];
    margenDeVictoria = map['margenDeVictoria'];
    mitadConMasPuntos = map['mitadConMasPuntos'];
    cuartoConMasPuntos = map['cuartoConMasPuntos'];

  }

}

class DownlaodDataEventStatusDtoResponse {
  late int statusCode ;
  late String message ;
  late List<DownlaodDataEventStatusDto> downlaodDataEventStatusDtos ;
}

class DownlaodOneDataEventStatusDtoResponse {
  late int statusCode ;
  late String message ;
  late DownlaodDataEventStatusDto downlaodDataEventStatusDto ;
}