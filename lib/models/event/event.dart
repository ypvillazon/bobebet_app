import 'package:bobebet_app/models/event/american_football/fa_cuarto_con_mas_puntos_dto.dart';
import 'package:bobebet_app/models/event/american_football/fa_puntos_desenlace.dart';
import 'package:bobebet_app/models/event/baseball/carreras_por_entradas_dto.dart';
import 'package:bobebet_app/models/event/baseball/equipo_en_hacer_carreras.dart';
import 'package:bobebet_app/models/event/baseball/extra_inings_dto.dart';
import 'package:bobebet_app/models/event/baseball/total_carreras_desenlace.dart';
import 'package:bobebet_app/models/event/basketball/basket_cuarto_con_mas_puntos_dto.dart';
import 'package:bobebet_app/models/event/basketball/basket_margen_de_victoria_dto.dart';
import 'package:bobebet_app/models/event/basketball/basket_mitad_con_mas_puntos_dto.dart';
import 'package:bobebet_app/models/event/basketball/prorroga_de_partido_dto.dart';
import 'package:bobebet_app/models/event/basketball/resultado_encuentro_dto.dart';
import 'package:bobebet_app/models/event/basketball/total_puntos_desenlace.dart';
import 'package:bobebet_app/models/event/boxing/total_puntos_desenlace.dart';
import 'package:bobebet_app/models/event/coeff_per_marker_by_event.dart';
import 'package:bobebet_app/models/event/football/equipo_en_hacer.dart';
import 'package:bobebet_app/models/event/football/football_goles_dto.dart';
import 'package:bobebet_app/models/event/football/football_margen_de_victoria_dto.dart';
import 'package:bobebet_app/models/event/football/ganar_partido_con_handicap.dart';
import 'package:bobebet_app/models/event/football/ganar_partido_con_handicap_asiatico.dart';
import 'package:bobebet_app/models/event/football/options_total_goles.dart';
import 'package:bobebet_app/models/event/football/paridad_goles_dto.dart';
import 'package:bobebet_app/models/event/football/total_goles_tres_desenlaces.dart';
import 'package:bobebet_app/models/event/tennis/apuesta_a_resultado_dto.dart';
import 'package:bobebet_app/models/event/tennis/cantidad_de_sets_dto.dart';
import 'package:bobebet_app/models/event/tennis/gana_primer_set_y_gana_partido.dart';
import 'package:bobebet_app/models/event/tennis/ganador_set_dto.dart';
import 'package:bobebet_app/models/event/tennis/total_de_sets_dto.dart';
import 'package:bobebet_app/models/event/tennis/total_juegos_desenlace.dart';
import 'package:bobebet_app/models/event/tiempo_x_goles.dart';

class Event {
  late String eventId;
  late String sport;
  late String date;
  late String event ;

  late String teamHomeName;
  late double teamHomeCoeff;
  late int teamHomeCoeffUp;
  late bool showHome ;

  late String teamAwayName;
  late double teamAwayCoeff;
  late int teamAwayCoeffUp;
  late bool showAway ;

  late double drawCoeff;
  late int drawCoeffUp;
  late bool showDraw ;

  late String time;
  late String status;
  late String sportType;

  late CoeffPerMarkerByEvent coeffPerMarkerByEvent ;
  late CoeffPerMarkerByEvent firstHalfMarkers ;
  late CoeffPerMarkerByEvent secondHalfMarkers ;
  late TiempoPorGoles tiempoConMasGoles;
  late TiempoPorGoles tiempoConPrimerGol;
  late TiempoPorGoles tiempoConMasGolesH;
  late TiempoPorGoles tiempoConMasGolesA;
  late FootBallMargenDeVictoriaDto footballMargenDeVictoriaDto;

  late OptionsTotalGoles paraPartido;
  late OptionsTotalGoles paraH;
  late OptionsTotalGoles paraA;
  late OptionsTotalGoles paraPrimerTiempo;
  late OptionsTotalGoles paraPrimerTiempoH;
  late OptionsTotalGoles paraPrimerTiempoA;
  late OptionsTotalGoles paraSegundoTiempo;
  late OptionsTotalGoles paraSegundoTiempoH;
  late OptionsTotalGoles paraSegundoTiempoA;

  late OptionsTotalGoles cornerPartido;
  late OptionsTotalGoles cornerParaH;
  late OptionsTotalGoles cornerParaA;
  late OptionsTotalGoles cornerParaPrimerTiempo;
  late OptionsTotalGoles cornerParaPrimerTiempoH;
  late OptionsTotalGoles cornerParaPrimerTiempoA;
  late OptionsTotalGoles cornerParaSegundoTiempo;
  late OptionsTotalGoles cornerParaSegundoTiempoH;
  late OptionsTotalGoles cornerParaSegundoTiempoA;

  late OptionsTotalGoles tarjetasAmarillasPartido;
  late OptionsTotalGoles tarjetasAmarillasParaH;
  late OptionsTotalGoles tarjetasAmarillasParaA;
  late OptionsTotalGoles tarjetasAmarillasParaPrimerTiempo;
  late OptionsTotalGoles tarjetasAmarillasParaPrimerTiempoH;
  late OptionsTotalGoles tarjetasAmarillasParaPrimerTiempoA;
  late OptionsTotalGoles tarjetasAmarillasParaSegundoTiempo;
  late OptionsTotalGoles tarjetasAmarillasParaSegundoTiempoH;
  late OptionsTotalGoles tarjetasAmarillasParaSegundoTiempoA;

  late OptionsTotalGoles tirosPorteriaPartido;
  late OptionsTotalGoles tirosPorteriaParaH;
  late OptionsTotalGoles tirosPorteriaParaA;

  late FootballGolesDto footballGolesDto ;
  late GanarPartidoConHandicap ganarPartidoConHandicapDto;
  late GanarPartidoConHandicapAsiatico ganarPartidoConHandicapAsiaticoDto;

  late ParidadGolesDto paridadGolesPartido ;
  late ParidadGolesDto paridadGolesCasa ;
  late ParidadGolesDto paridadGolesVisitador ;
  late ParidadGolesDto paridadGolesPrimerTiempo ;
  late ParidadGolesDto paridadGolesSegundoTiempo ;

  late ProrrogaDePartidoDto prorrogaDePartidoDto ;
  late BasketMitadConMasPuntosDto basketMitadConMasPuntosDto ;
  late BasketCuartoConMasPuntosDto basketCuartoConMasPuntosDto ;
  late BasketMargenDeVictoriaDto basketMargenDeVictoriaDto ;

  late ParidadGolesDto paridadCarrerasPartido ;
  late CarrerasPorEntradasDto resultadoPrimerasCincoEntradas ;
  late CarrerasPorEntradasDto resultadoPrimeraEntrada ;
  late CarrerasPorEntradasDto resultadoSegundaEntrada ;
  late ExtraIningsDto extraIningsDto;
  late TotalCarrerasDesenlace totalCarrerasDesenlacePartido;
  late TotalCarrerasDesenlace totalCarrerasDesenlaceH;
  late TotalCarrerasDesenlace totalCarrerasDesenlaceA;
  late TotalCarrerasDesenlace totalCarrerasDesenlacePrimeras5Carreras;
  late TotalCarrerasDesenlace totalCarrerasDesenlacePrimeraEntrada;
  late TotalCarrerasDesenlace totalCarrerasDesenlaceSegundaEntrada;
  late EquipoEnHacerCarreras primerEquipo;
  late EquipoEnHacerCarreras ultimoEquipo;

  late TotalPuntosDesenlace totalPuntosPartido;
  late TotalPuntosDesenlace totalPuntosPartidoH;
  late TotalPuntosDesenlace totalPuntosPartidoA;
  late TotalPuntosDesenlace totalPuntosCuartoConMasPuntos;
  late TotalPuntosDesenlace totalPuntosCuartoConMenosPuntos;
  late TotalPuntosDesenlace totalPuntosPrimeraMitad;
  late TotalPuntosDesenlace totalPuntosPrimeraMitadH;
  late TotalPuntosDesenlace totalPuntosPrimeraMitadA;
  late TotalPuntosDesenlace totalPuntosSegundaMitad;
  late TotalPuntosDesenlace totalPuntosSegundaMitadH;
  late TotalPuntosDesenlace totalPuntosSegundaMitadA;
  late TotalPuntosDesenlace totalPuntosC1;
  late TotalPuntosDesenlace totalPuntosC2;
  late TotalPuntosDesenlace totalPuntosC3;
  late TotalPuntosDesenlace totalPuntosC4;

  late ResultadoEncuentroDto resultadoPartidoDto ;

  late EquipoEnHacer primerEnHacer;
  late EquipoEnHacer ultimoEnHacer;

  /**
   * Tennis
   */
  late   ApuestaAResultadoDto apuestaAResultadoDto;
  late GanaPrimerSetYGanaPartido ganaPrimerSetYGanaPartido;
  late GanaPrimerSetYGanaPartido pierdePrimerSetYGanaPartido;
  late GanadorSetDto ganadorPrimerSetsDto;
  late GanadorSetDto ganadorSegundoSetsDto;
  late TotalJuegosDesenlace totalDeJuegos;
  late TotalJuegosDesenlace totalDeJuegosGanadosH;
  late TotalJuegosDesenlace totalDeJuegosGanadosA;
  late TotalJuegosDesenlace totalDeJuegosPrimerSet;
  late TotalJuegosDesenlace totalDeJuegosPrimerSetH;
  late TotalJuegosDesenlace totalDeJuegosPrimerSetA;
  late TotalJuegosDesenlace totalDeJuegosSegundoSet;
  late TotalJuegosDesenlace totalDeJuegosSegundoSetH;
  late TotalJuegosDesenlace totalDeJuegosSegundoSetA;

  late TotalJuegosDesenlace totalDeSetsDto;
  late CantidadDeSetsDto cantidadDeSetsDto;

  /**
   * Boxing
   */
  late OptionsTotalCompletedRoundsDosDesenlacesDto optionsTotalCompletedRoundsDosDesenlacesDto;

  /**
   * American Football
   */
  late FACuartoConMasPuntosDto faCuartoConMasPuntosDto;
  late FAPuntosDesenlace faOptionsPuntosDtoPartido;
  late FAPuntosDesenlace faOptionsPuntosDtoPartidoH;
  late FAPuntosDesenlace faOptionsPuntosDtoPartidoA;
  late FAPuntosDesenlace faOptionsPuntosDtoPrimeraMitad;
  late FAPuntosDesenlace faOptionsPuntosDtoPuntosC1;


  Event.fromMap(Map<String, dynamic> map) {
    eventId = map['eventId'];
    sport = map['sport'];
    event = map['event'];
    sportType = map['sportType'];
    teamHomeName = map['teamHomeName'];
    teamHomeCoeff = double.parse((map['teamHomeCoeff']).toStringAsFixed(3));
    teamHomeCoeffUp = map['teamHomeCoeffUp'];
    showHome = map['showHome'];
    teamAwayName = map['teamAwayName'];
    teamAwayCoeff = double.parse((map['teamAwayCoeff']).toStringAsFixed(3));
    teamAwayCoeffUp = map['teamAwayCoeffUp'];
    showAway = map['showAway'];
    drawCoeff = double.parse((map['drawCoeff']).toStringAsFixed(3));
    drawCoeffUp = map['drawCoeffUp'];
    showDraw = map['showDraw'];
    status = map['status'];
    time = map['time'];
    var s = DateTime.parse(map['date']).toLocal() ;
    date = "${s.year}/${s.month}/${s.day} ${s.hour}:${s.minute}:${s.second}" ;
    print("OKOK");

    coeffPerMarkerByEvent = CoeffPerMarkerByEvent.fromMap(map['coeffPerMarkerListDto']);

    firstHalfMarkers =  CoeffPerMarkerByEvent.fromMap(map['firstHalfMarkersListDto']) ;
    secondHalfMarkers = CoeffPerMarkerByEvent.fromMap(map['secondHalfMarkersListDto']) ;

    print("OKOK2");

    tiempoConMasGoles = TiempoPorGoles.fromMap(map['tiempoConMasGoles'])  ;
    tiempoConPrimerGol =  TiempoPorGoles.fromMap(map['tiempoConPrimerGol']) ;
    tiempoConMasGolesH =   TiempoPorGoles.fromMap(map['tiempoConMasGolesH'])  ;
    tiempoConMasGolesA =  TiempoPorGoles.fromMap(map['tiempoConMasGolesA'])   ;
    footballMargenDeVictoriaDto =  FootBallMargenDeVictoriaDto.fromMap(map['footballMargenDeVictoriaDto']) ;

    print("OKOK");


    paraPartido = OptionsTotalGoles.fromMap(map['paraPartido']) ;
    paraH =  OptionsTotalGoles.fromMap(map['paraH'])   ;
    paraA =  OptionsTotalGoles.fromMap(map['paraA'])   ;
    paraPrimerTiempo =  OptionsTotalGoles.fromMap(map['paraPrimerTiempo'])   ;
    paraPrimerTiempoH =  OptionsTotalGoles.fromMap(map['paraPrimerTiempoH'])   ;
    paraPrimerTiempoA =  OptionsTotalGoles.fromMap(map['paraPrimerTiempoA'])   ;
    paraSegundoTiempo =  OptionsTotalGoles.fromMap(map['paraSegundoTiempo'])   ;
    paraSegundoTiempoH =   OptionsTotalGoles.fromMap(map['paraSegundoTiempoH'])   ;
    paraSegundoTiempoA = OptionsTotalGoles.fromMap(map['paraSegundoTiempoA'])   ;

    print("OKOK 3");

    cornerPartido =  OptionsTotalGoles.fromMap(map['cornerPartido'])   ;
    cornerParaH = OptionsTotalGoles.fromMap(map['cornerParaH'])   ;
    cornerParaA =  OptionsTotalGoles.fromMap(map['cornerParaA'])   ;
    cornerParaPrimerTiempo =  OptionsTotalGoles.fromMap(map['cornerParaPrimerTiempo'])   ;
    cornerParaPrimerTiempoH =  OptionsTotalGoles.fromMap(map['cornerParaPrimerTiempoH'])   ;
    cornerParaPrimerTiempoA =   OptionsTotalGoles.fromMap(map['cornerParaPrimerTiempoA'])   ;
    cornerParaSegundoTiempo =   OptionsTotalGoles.fromMap(map['cornerParaSegundoTiempo'])   ;
    cornerParaSegundoTiempoH =   OptionsTotalGoles.fromMap(map['cornerParaSegundoTiempoH'])   ;
    cornerParaSegundoTiempoA = OptionsTotalGoles.fromMap(map['cornerParaSegundoTiempoA'])   ;

    tarjetasAmarillasPartido =  OptionsTotalGoles.fromMap(map['tarjetasAmarillasPartido'])   ;
    tarjetasAmarillasParaH =   OptionsTotalGoles.fromMap(map['tarjetasAmarillasParaH'])   ;
    tarjetasAmarillasParaA =  OptionsTotalGoles.fromMap(map['tarjetasAmarillasParaA'])   ;
    tarjetasAmarillasParaPrimerTiempo =  OptionsTotalGoles.fromMap(map['tarjetasAmarillasParaPrimerTiempo'])   ;
    tarjetasAmarillasParaPrimerTiempoH = OptionsTotalGoles.fromMap(map['tarjetasAmarillasParaPrimerTiempoH'])   ;
    tarjetasAmarillasParaPrimerTiempoA =  OptionsTotalGoles.fromMap(map['tarjetasAmarillasParaPrimerTiempoA'])   ;
    tarjetasAmarillasParaSegundoTiempo = OptionsTotalGoles.fromMap(map['tarjetasAmarillasParaSegundoTiempo'])   ;
    tarjetasAmarillasParaSegundoTiempoH =  OptionsTotalGoles.fromMap(map['tarjetasAmarillasParaSegundoTiempoH'])   ;
    tarjetasAmarillasParaSegundoTiempoA =  OptionsTotalGoles.fromMap(map['tarjetasAmarillasParaSegundoTiempoA'])   ;

    tirosPorteriaPartido =  OptionsTotalGoles.fromMap(map['tirosPorteriaPartido'])   ;
    tirosPorteriaParaH = OptionsTotalGoles.fromMap(map['tirosPorteriaParaH'])   ;
    tirosPorteriaParaA = OptionsTotalGoles.fromMap(map['tirosPorteriaParaA'])   ;

    print("OKOK 4");

    footballGolesDto = FootballGolesDto.fromMap(map['footballGolesDto'])   ;
    ganarPartidoConHandicapDto =  GanarPartidoConHandicap.fromMap(map['ganarPartidoConHandicapDto'])   ;
    ganarPartidoConHandicapAsiaticoDto =  GanarPartidoConHandicapAsiatico.fromMap(map['ganarPartidoConHandicapAsiaticoDto'])   ;

    totalPuntosPartido =  TotalPuntosDesenlace.fromMap(map['totalPuntosPartido'])   ;
    totalPuntosPartidoH =  TotalPuntosDesenlace.fromMap(map['totalPuntosPartidoH'])   ;
    totalPuntosPartidoA =  TotalPuntosDesenlace.fromMap(map['totalPuntosPartidoA'])   ;
    totalPuntosCuartoConMasPuntos =  TotalPuntosDesenlace.fromMap(map['totalPuntosCuartoConMasPuntos'])   ;
    totalPuntosCuartoConMenosPuntos =   TotalPuntosDesenlace.fromMap(map['totalPuntosCuartoConMenosPuntos'])   ;
    totalPuntosPrimeraMitad =  TotalPuntosDesenlace.fromMap(map['totalPuntosPrimeraMitad'])   ;
    totalPuntosPrimeraMitadH =  TotalPuntosDesenlace.fromMap(map['totalPuntosPrimeraMitadH'])   ;
    totalPuntosPrimeraMitadA =  TotalPuntosDesenlace.fromMap(map['totalPuntosPrimeraMitadA'])   ;
    totalPuntosSegundaMitad =   TotalPuntosDesenlace.fromMap(map['totalPuntosSegundaMitad'])   ;
    totalPuntosSegundaMitadH =  TotalPuntosDesenlace.fromMap(map['totalPuntosSegundaMitadH'])   ;
    totalPuntosSegundaMitadA =  TotalPuntosDesenlace.fromMap(map['totalPuntosSegundaMitadA'])   ;
    totalPuntosC1 =  TotalPuntosDesenlace.fromMap(map['totalPuntosC1'])   ;
    totalPuntosC2 =  TotalPuntosDesenlace.fromMap(map['totalPuntosC2'])   ;
    totalPuntosC3 =   TotalPuntosDesenlace.fromMap(map['totalPuntosC3'])   ;
    totalPuntosC4 =  TotalPuntosDesenlace.fromMap(map['totalPuntosC4'])   ;

    print("OKOK 5");

    paridadGolesPartido = ParidadGolesDto.fromMap(map['paridadGolesPartido'])   ;
    paridadGolesCasa =   ParidadGolesDto.fromMap(map['paridadGolesCasa'])   ;
    paridadGolesVisitador = ParidadGolesDto.fromMap(map['paridadGolesVisitador'])   ;
    paridadGolesPrimerTiempo =   ParidadGolesDto.fromMap(map['paridadGolesPrimerTiempo'])   ;
    paridadGolesSegundoTiempo =   ParidadGolesDto.fromMap(map['paridadGolesSegundoTiempo'])   ;

    print("OKOK 6");


    prorrogaDePartidoDto = ProrrogaDePartidoDto.fromMap(map['prorrogaDePartidoDto'])   ;

    print("OKOK 7");


    basketMitadConMasPuntosDto =   BasketMitadConMasPuntosDto.fromMap(map['basketMitadConMasPuntosDto'])   ;
    basketCuartoConMasPuntosDto =  BasketCuartoConMasPuntosDto.fromMap(map['basketCuartoConMasPuntosDto'])   ;
    basketMargenDeVictoriaDto =  BasketMargenDeVictoriaDto.fromMap(map['margenDeVictoriaDto'])   ;
    resultadoPartidoDto =  ResultadoEncuentroDto.fromMap(map['resultadoPartidoDto'])   ;

    print("OKOK 8");

    paridadCarrerasPartido = ParidadGolesDto.fromMap(map['paridadCarrerasPartido'])   ;
    resultadoPrimerasCincoEntradas = CarrerasPorEntradasDto.fromMap(map['resultadoPrimerasCincoEntradas'])   ;
    resultadoPrimeraEntrada = CarrerasPorEntradasDto.fromMap(map['resultadoPrimeraEntrada'])   ;
    resultadoSegundaEntrada = CarrerasPorEntradasDto.fromMap(map['resultadoSegundaEntrada'])   ;
    extraIningsDto =   ExtraIningsDto.fromMap(map['extraInningsDto'])   ;
    totalCarrerasDesenlacePartido =  TotalCarrerasDesenlace.fromMap(map['totalCarrerasDesenlacePartido'])   ;
    totalCarrerasDesenlaceH =  TotalCarrerasDesenlace.fromMap(map['totalCarrerasDesenlaceH'])   ;
    totalCarrerasDesenlaceA =   TotalCarrerasDesenlace.fromMap(map['totalCarrerasDesenlaceA'])   ;
    totalCarrerasDesenlacePrimeras5Carreras =  TotalCarrerasDesenlace.fromMap(map['totalCarrerasDesenlacePrimeras5Carreras'])   ;
    totalCarrerasDesenlacePrimeraEntrada =   TotalCarrerasDesenlace.fromMap(map['totalCarrerasDesenlacePrimeraEntrada'])   ;
    totalCarrerasDesenlaceSegundaEntrada =  TotalCarrerasDesenlace.fromMap(map['totalCarrerasDesenlaceSegundaEntrada'])   ;
    primerEquipo =   EquipoEnHacerCarreras.fromMap(map['primerEquipo'])   ;
    ultimoEquipo =  EquipoEnHacerCarreras.fromMap(map['ultimoEquipo'])   ;

    print("OKOK 9");

    primerEnHacer = EquipoEnHacer.fromMap(map['primerEnHacer'])   ;
    ultimoEnHacer =  EquipoEnHacer.fromMap(map['ultimoEnHacer'])   ;

    print("OKOK 10");

    /**
     * Tennis
     */
    apuestaAResultadoDto =   ApuestaAResultadoDto.fromMap(map['apuestaAResultadoDto'])   ;
    ganaPrimerSetYGanaPartido =   GanaPrimerSetYGanaPartido.fromMap(map['ganaPrimerSetYGanaPartido'])   ;
    pierdePrimerSetYGanaPartido =   GanaPrimerSetYGanaPartido.fromMap(map['pierdePrimerSetYGanaPartido'])   ;

    ganadorPrimerSetsDto =  GanadorSetDto.fromMap(map['ganadorPrimerSetsDto'])   ;
    ganadorSegundoSetsDto =   GanadorSetDto.fromMap(map['ganadorSegundoSetsDto'])   ;
    totalDeJuegos =   TotalJuegosDesenlace.fromMap(map['totalDeJuegos'])   ;
    totalDeJuegosGanadosA =  TotalJuegosDesenlace.fromMap(map['totalDeJuegosGanadosA'])   ;
    totalDeJuegosGanadosH = TotalJuegosDesenlace.fromMap(map['totalDeJuegosGanadosH'])   ;
    totalDeJuegosPrimerSet =  TotalJuegosDesenlace.fromMap(map['totalDeJuegosPrimerSet'])   ;
    totalDeJuegosPrimerSetH =  TotalJuegosDesenlace.fromMap(map['totalDeJuegosPrimerSetH'])   ;
    totalDeJuegosPrimerSetA =   TotalJuegosDesenlace.fromMap(map['totalDeJuegosPrimerSetA'])   ;
    totalDeJuegosSegundoSet =   TotalJuegosDesenlace.fromMap(map['totalDeJuegosSegundoSet'])   ;
    totalDeJuegosSegundoSetH =   TotalJuegosDesenlace.fromMap(map['totalDeJuegosSegundoSetH'])   ;
    totalDeJuegosSegundoSetA =   TotalJuegosDesenlace.fromMap(map['totalDeJuegosSegundoSetA'])   ;
    totalDeSetsDto = TotalJuegosDesenlace.fromMap(map['totalDeSetsDto'])   ;
    cantidadDeSetsDto =   CantidadDeSetsDto.fromMap(map['cantidadDeSetsDto'])   ;

    /**
     * Boxing
     */
    optionsTotalCompletedRoundsDosDesenlacesDto = OptionsTotalCompletedRoundsDosDesenlacesDto.fromMap(map['optionsTotalCompletedRoundsDosDesenlacesDto'])   ;

    /**
     * American Football
     */
    faCuartoConMasPuntosDto =  FACuartoConMasPuntosDto.fromMap(map['faCuartoConMasPuntosDto'])   ;
    faOptionsPuntosDtoPartido =   FAPuntosDesenlace.fromMap(map['faOptionsPuntosDtoPartido'])   ;
    faOptionsPuntosDtoPartidoH =   FAPuntosDesenlace.fromMap(map['faOptionsPuntosDtoPartidoH'])   ;
    faOptionsPuntosDtoPartidoA =  FAPuntosDesenlace.fromMap(map['faOptionsPuntosDtoPartidoA'])   ;
    faOptionsPuntosDtoPrimeraMitad =  FAPuntosDesenlace.fromMap(map['faOptionsPuntosDtoPrimeraMitad'])   ;
    faOptionsPuntosDtoPuntosC1 =  FAPuntosDesenlace.fromMap(map['faOptionsPuntosDtoPuntosC1'])   ;


  }

}

class EventResponse {
  late int statusCode ;
  late String message ;
  late List<Event> events ;
}

class OneEventResponse {
  late int statusCode ;
  late String message ;
  late Event event ;
}
