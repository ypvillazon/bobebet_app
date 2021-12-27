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

    coeffPerMarkerByEvent = (map['coeffPerMarkerListDto'] != null ? CoeffPerMarkerByEvent.fromMap(map['coeffPerMarkerListDto']) : null)! ;
    firstHalfMarkers = (map['firstHalfMarkersListDto'] != null ?  CoeffPerMarkerByEvent.fromMap(map['firstHalfMarkersListDto'])  : null)! ;
    secondHalfMarkers = (map['secondHalfMarkersListDto'] != null ?  CoeffPerMarkerByEvent.fromMap(map['secondHalfMarkersListDto'])  : null)! ;
    tiempoConMasGoles = (map['tiempoConMasGoles'] != null ?  TiempoPorGoles.fromMap(map['tiempoConMasGoles'])  : null)! ;
    tiempoConPrimerGol = (map['tiempoConPrimerGol'] != null ?  TiempoPorGoles.fromMap(map['tiempoConPrimerGol'])  : null)! ;
    tiempoConMasGolesH = (map['tiempoConMasGolesH'] != null ?  TiempoPorGoles.fromMap(map['tiempoConMasGolesH'])  : null)! ;
    tiempoConMasGolesA = (map['tiempoConMasGolesA'] != null ?  TiempoPorGoles.fromMap(map['tiempoConMasGolesA'])  : null)! ;
    footballMargenDeVictoriaDto = (map['footballMargenDeVictoriaDto'] != null ?  FootBallMargenDeVictoriaDto.fromMap(map['footballMargenDeVictoriaDto'])  : null)! ;


    paraPartido = (map['paraPartido'] != null ?  OptionsTotalGoles.fromMap(map['paraPartido'])  : null)! ;
    paraH = (map['paraH'] != null ?  OptionsTotalGoles.fromMap(map['paraH'])  : null)! ;
    paraA = (map['paraA'] != null ?  OptionsTotalGoles.fromMap(map['paraA'])  : null)! ;
    paraPrimerTiempo = (map['paraPrimerTiempo'] != null ?  OptionsTotalGoles.fromMap(map['paraPrimerTiempo'])  : null)! ;
    paraPrimerTiempoH = (map['paraPrimerTiempoH'] != null ?  OptionsTotalGoles.fromMap(map['paraPrimerTiempoH'])  : null)! ;
    paraPrimerTiempoA = (map['paraPrimerTiempoA'] != null ?  OptionsTotalGoles.fromMap(map['paraPrimerTiempoA'])  : null)! ;
    paraSegundoTiempo = (map['paraSegundoTiempo'] != null ?  OptionsTotalGoles.fromMap(map['paraSegundoTiempo'])  : null)! ;
    paraSegundoTiempoH = (map['paraSegundoTiempoH'] != null ?  OptionsTotalGoles.fromMap(map['paraSegundoTiempoH'])  : null)! ;
    paraSegundoTiempoA = (map['paraSegundoTiempoA'] != null ?  OptionsTotalGoles.fromMap(map['paraSegundoTiempoA'])  : null)! ;

    cornerPartido = (map['cornerPartido'] != null ?  OptionsTotalGoles.fromMap(map['cornerPartido'])  : null)! ;
    cornerParaH = (map['cornerParaH'] != null ?  OptionsTotalGoles.fromMap(map['cornerParaH'])  : null)! ;
    cornerParaA = (map['cornerParaA'] != null ?  OptionsTotalGoles.fromMap(map['cornerParaA'])  : null)! ;
    cornerParaPrimerTiempo = (map['cornerParaPrimerTiempo'] != null ?  OptionsTotalGoles.fromMap(map['cornerParaPrimerTiempo'])  : null)! ;
    cornerParaPrimerTiempoH = (map['cornerParaPrimerTiempoH'] != null ?  OptionsTotalGoles.fromMap(map['cornerParaPrimerTiempoH'])  : null)! ;
    cornerParaPrimerTiempoA = (map['cornerParaPrimerTiempoA'] != null ?  OptionsTotalGoles.fromMap(map['cornerParaPrimerTiempoA'])  : null)! ;
    cornerParaSegundoTiempo = (map['cornerParaSegundoTiempo'] != null ?  OptionsTotalGoles.fromMap(map['cornerParaSegundoTiempo'])  : null)! ;
    cornerParaSegundoTiempoH = (map['cornerParaSegundoTiempoH'] != null ?  OptionsTotalGoles.fromMap(map['cornerParaSegundoTiempoH'])  : null)! ;
    cornerParaSegundoTiempoA = (map['cornerParaSegundoTiempoA'] != null ?  OptionsTotalGoles.fromMap(map['cornerParaSegundoTiempoA'])  : null)! ;

    tarjetasAmarillasPartido = (map['tarjetasAmarillasPartido'] != null ?  OptionsTotalGoles.fromMap(map['tarjetasAmarillasPartido'])  : null)! ;
    tarjetasAmarillasParaH = (map['tarjetasAmarillasParaH'] != null ?  OptionsTotalGoles.fromMap(map['tarjetasAmarillasParaH'])  : null)! ;
    tarjetasAmarillasParaA = (map['tarjetasAmarillasParaA'] != null ?  OptionsTotalGoles.fromMap(map['tarjetasAmarillasParaA'])  : null)! ;
    tarjetasAmarillasParaPrimerTiempo = (map['tarjetasAmarillasParaPrimerTiempo'] != null ?  OptionsTotalGoles.fromMap(map['tarjetasAmarillasParaPrimerTiempo'])  : null)! ;
    tarjetasAmarillasParaPrimerTiempoH = (map['tarjetasAmarillasParaPrimerTiempoH'] != null ?  OptionsTotalGoles.fromMap(map['tarjetasAmarillasParaPrimerTiempoH'])  : null)! ;
    tarjetasAmarillasParaPrimerTiempoA = (map['tarjetasAmarillasParaPrimerTiempoA'] != null ?  OptionsTotalGoles.fromMap(map['tarjetasAmarillasParaPrimerTiempoA'])  : null)! ;
    tarjetasAmarillasParaSegundoTiempo = (map['tarjetasAmarillasParaSegundoTiempo'] != null ?  OptionsTotalGoles.fromMap(map['tarjetasAmarillasParaSegundoTiempo'])  : null)! ;
    tarjetasAmarillasParaSegundoTiempoH = (map['tarjetasAmarillasParaSegundoTiempoH'] != null ?  OptionsTotalGoles.fromMap(map['tarjetasAmarillasParaSegundoTiempoH'])  : null)! ;
    tarjetasAmarillasParaSegundoTiempoA = (map['tarjetasAmarillasParaSegundoTiempoA'] != null ?  OptionsTotalGoles.fromMap(map['tarjetasAmarillasParaSegundoTiempoA'])  : null)! ;

    tirosPorteriaPartido = (map['tirosPorteriaPartido'] != null ?  OptionsTotalGoles.fromMap(map['tirosPorteriaPartido'])  : null)! ;
    tirosPorteriaParaH = (map['tirosPorteriaParaH'] != null ?  OptionsTotalGoles.fromMap(map['tirosPorteriaParaH'])  : null)! ;
    tirosPorteriaParaA = (map['tirosPorteriaParaA'] != null ?  OptionsTotalGoles.fromMap(map['tirosPorteriaParaA'])  : null)! ;

    footballGolesDto = (map['footballGolesDto'] != null ?  FootballGolesDto.fromMap(map['footballGolesDto'])  : null)! ;
    ganarPartidoConHandicapDto = (map['ganarPartidoConHandicapDto'] != null ?  GanarPartidoConHandicap.fromMap(map['ganarPartidoConHandicapDto'])  : null)! ;
    ganarPartidoConHandicapAsiaticoDto = (map['ganarPartidoConHandicapAsiaticoDto'] != null ?  GanarPartidoConHandicapAsiatico.fromMap(map['ganarPartidoConHandicapAsiaticoDto'])  : null)! ;

    totalPuntosPartido = (map['totalPuntosPartido'] != null ?  TotalPuntosDesenlace.fromMap(map['totalPuntosPartido'])  : null)! ;
    totalPuntosPartidoH = (map['totalPuntosPartidoH'] != null ?  TotalPuntosDesenlace.fromMap(map['totalPuntosPartidoH'])  : null)! ;
    totalPuntosPartidoA = (map['totalPuntosPartidoA'] != null ?  TotalPuntosDesenlace.fromMap(map['totalPuntosPartidoA'])  : null)! ;
    totalPuntosCuartoConMasPuntos = (map['totalPuntosCuartoConMasPuntos'] != null ?  TotalPuntosDesenlace.fromMap(map['totalPuntosCuartoConMasPuntos'])  : null)! ;
    totalPuntosCuartoConMenosPuntos = (map['totalPuntosCuartoConMenosPuntos'] != null ?  TotalPuntosDesenlace.fromMap(map['totalPuntosCuartoConMenosPuntos'])  : null)! ;
    totalPuntosPrimeraMitad = (map['totalPuntosPrimeraMitad'] != null ?  TotalPuntosDesenlace.fromMap(map['totalPuntosPrimeraMitad'])  : null)! ;
    totalPuntosPrimeraMitadH = (map['totalPuntosPrimeraMitadH'] != null ?  TotalPuntosDesenlace.fromMap(map['totalPuntosPrimeraMitadH'])  : null)! ;
    totalPuntosPrimeraMitadA = (map['totalPuntosPrimeraMitadA'] != null ?  TotalPuntosDesenlace.fromMap(map['totalPuntosPrimeraMitadA'])  : null)! ;
    totalPuntosSegundaMitad = (map['totalPuntosSegundaMitad'] != null ?  TotalPuntosDesenlace.fromMap(map['totalPuntosSegundaMitad'])  : null)! ;
    totalPuntosSegundaMitadH = (map['totalPuntosSegundaMitadH'] != null ?  TotalPuntosDesenlace.fromMap(map['totalPuntosSegundaMitadH'])  : null)! ;
    totalPuntosSegundaMitadA = (map['totalPuntosSegundaMitadA'] != null ?  TotalPuntosDesenlace.fromMap(map['totalPuntosSegundaMitadA'])  : null)! ;
    totalPuntosC1 = (map['totalPuntosC1'] != null ?  TotalPuntosDesenlace.fromMap(map['totalPuntosC1'])  : null)! ;
    totalPuntosC2 = (map['totalPuntosC2'] != null ?  TotalPuntosDesenlace.fromMap(map['totalPuntosC2'])  : null)! ;
    totalPuntosC3 = (map['totalPuntosC3'] != null ?  TotalPuntosDesenlace.fromMap(map['totalPuntosC3'])  : null)! ;
    totalPuntosC4 = (map['totalPuntosC4'] != null ?  TotalPuntosDesenlace.fromMap(map['totalPuntosC4'])  : null)! ;

    paridadGolesPartido = (map['paridadGolesPartido'] != null ?  ParidadGolesDto.fromMap(map['paridadGolesPartido'])  : null)! ;
    paridadGolesCasa = (map['paridadGolesCasa'] != null ?  ParidadGolesDto.fromMap(map['paridadGolesCasa'])  : null)! ;
    paridadGolesVisitador = (map['paridadGolesVisitador'] != null ?  ParidadGolesDto.fromMap(map['paridadGolesVisitador'])  : null)! ;
    paridadGolesPrimerTiempo = (map['paridadGolesPrimerTiempo'] != null ?  ParidadGolesDto.fromMap(map['paridadGolesPrimerTiempo'])  : null)! ;
    paridadGolesSegundoTiempo = (map['paridadGolesSegundoTiempo'] != null ?  ParidadGolesDto.fromMap(map['paridadGolesSegundoTiempo'])  : null)! ;

    prorrogaDePartidoDto = (map['prorrogaDePartidoDto'] != null ?  ProrrogaDePartidoDto.fromMap(map['prorrogaDePartidoDto'])  : null)! ;
    basketMitadConMasPuntosDto =  (map['basketMitadConMasPuntosDto'] != null ? BasketMitadConMasPuntosDto.fromMap(map['basketMitadConMasPuntosDto'])  : null)! ;
    basketCuartoConMasPuntosDto = (map['basketCuartoConMasPuntosDto'] != null ?  BasketCuartoConMasPuntosDto.fromMap(map['basketCuartoConMasPuntosDto'])  : null)! ;
    basketMargenDeVictoriaDto = (map['margenDeVictoriaDto'] != null ?  BasketMargenDeVictoriaDto.fromMap(map['margenDeVictoriaDto'])  : null)! ;
    resultadoPartidoDto = (map['resultadoPartidoDto'] != null ?  ResultadoEncuentroDto.fromMap(map['resultadoPartidoDto'])  : null)! ;

    paridadCarrerasPartido = (map['paridadCarrerasPartido'] != null ?  ParidadGolesDto.fromMap(map['paridadCarrerasPartido'])  : null)! ;
    resultadoPrimerasCincoEntradas = (map['resultadoPrimerasCincoEntradas'] != null ?  CarrerasPorEntradasDto.fromMap(map['resultadoPrimerasCincoEntradas'])  : null)! ;
    resultadoPrimeraEntrada = (map['resultadoPrimerasCincoEntradas'] != null ?  CarrerasPorEntradasDto.fromMap(map['resultadoPrimeraEntrada'])  : null)! ;
    resultadoSegundaEntrada =  (map['resultadoSegundaEntrada'] != null ? CarrerasPorEntradasDto.fromMap(map['resultadoSegundaEntrada'])  : null)! ;
    extraIningsDto =  (map['extraInningsDto'] != null ? ExtraIningsDto.fromMap(map['extraInningsDto'])  : null)! ;
    totalCarrerasDesenlacePartido =  (map['totalCarrerasDesenlacePartido'] != null ? TotalCarrerasDesenlace.fromMap(map['totalCarrerasDesenlacePartido'])  : null)! ;
    totalCarrerasDesenlaceH =  (map['totalCarrerasDesenlaceH'] != null ? TotalCarrerasDesenlace.fromMap(map['totalCarrerasDesenlaceH'])  : null)! ;
    totalCarrerasDesenlaceA =  (map['totalCarrerasDesenlaceA'] != null ? TotalCarrerasDesenlace.fromMap(map['totalCarrerasDesenlaceA'])  : null)! ;
    totalCarrerasDesenlacePrimeras5Carreras =  (map['totalCarrerasDesenlacePrimeras5Carreras'] != null ? TotalCarrerasDesenlace.fromMap(map['totalCarrerasDesenlacePrimeras5Carreras'])  : null)! ;
    totalCarrerasDesenlacePrimeraEntrada =  (map['totalCarrerasDesenlacePrimeraEntrada'] != null ? TotalCarrerasDesenlace.fromMap(map['totalCarrerasDesenlacePrimeraEntrada'])  : null)! ;
    totalCarrerasDesenlaceSegundaEntrada = (map['totalCarrerasDesenlaceSegundaEntrada'] != null ?  TotalCarrerasDesenlace.fromMap(map['totalCarrerasDesenlaceSegundaEntrada'])  : null)! ;
    primerEquipo = (map['primerEquipo'] != null ?  EquipoEnHacerCarreras.fromMap(map['primerEquipo'])  : null)! ;
    ultimoEquipo =  (map['ultimoEquipo'] != null ? EquipoEnHacerCarreras.fromMap(map['ultimoEquipo'])  : null)! ;

    primerEnHacer =  (map['primerEnHacer'] != null ? EquipoEnHacer.fromMap(map['primerEnHacer'])  : null)! ;
    ultimoEnHacer = (map['ultimoEnHacer'] != null ?  EquipoEnHacer.fromMap(map['ultimoEnHacer'])  : null)! ;

    /**
     * Tennis
     */
    apuestaAResultadoDto =  (map['apuestaAResultadoDto'] != null ? ApuestaAResultadoDto.fromMap(map['apuestaAResultadoDto'])  : null)! ;
    ganaPrimerSetYGanaPartido =  (map['ganaPrimerSetYGanaPartido'] != null ? GanaPrimerSetYGanaPartido.fromMap(map['ganaPrimerSetYGanaPartido'])  : null)! ;
    pierdePrimerSetYGanaPartido = (map['pierdePrimerSetYGanaPartido'] != null ?  GanaPrimerSetYGanaPartido.fromMap(map['pierdePrimerSetYGanaPartido'])  : null)! ;

    ganadorPrimerSetsDto = (map['ganadorPrimerSetsDto'] != null ?  GanadorSetDto.fromMap(map['ganadorPrimerSetsDto'])  : null)! ;
    ganadorSegundoSetsDto = (map['ganadorSegundoSetsDto'] != null ?  GanadorSetDto.fromMap(map['ganadorSegundoSetsDto'])  : null)! ;
    totalDeJuegos = (map['totalDeJuegos'] != null ?  TotalJuegosDesenlace.fromMap(map['totalDeJuegos'])  : null)! ;
    totalDeJuegosGanadosA = (map['totalDeJuegosGanadosA'] != null ?  TotalJuegosDesenlace.fromMap(map['totalDeJuegosGanadosA'])  : null)! ;
    totalDeJuegosGanadosH = (map['totalDeJuegosGanadosH'] != null ?  TotalJuegosDesenlace.fromMap(map['totalDeJuegosGanadosH'])  : null)! ;
    totalDeJuegosPrimerSet = (map['totalDeJuegosPrimerSet'] != null ?  TotalJuegosDesenlace.fromMap(map['totalDeJuegosPrimerSet'])  : null)! ;
    totalDeJuegosPrimerSetH = (map['totalDeJuegosPrimerSetH'] != null ?  TotalJuegosDesenlace.fromMap(map['totalDeJuegosPrimerSetH'])  : null)! ;
    totalDeJuegosPrimerSetA = (map['totalDeJuegosPrimerSetA'] != null ?  TotalJuegosDesenlace.fromMap(map['totalDeJuegosPrimerSetA'])  : null)! ;
    totalDeJuegosSegundoSet = (map['totalDeJuegosSegundoSet'] != null ?  TotalJuegosDesenlace.fromMap(map['totalDeJuegosSegundoSet'])  : null)! ;
    totalDeJuegosSegundoSetH = (map['totalDeJuegosSegundoSetH'] != null ?  TotalJuegosDesenlace.fromMap(map['totalDeJuegosSegundoSetH'])  : null)! ;
    totalDeJuegosSegundoSetA = (map['totalDeJuegosSegundoSetA'] != null ?  TotalJuegosDesenlace.fromMap(map['totalDeJuegosSegundoSetA'])  : null)! ;
    totalDeSetsDto = (map['totalDeSetsDto'] != null ?  TotalJuegosDesenlace.fromMap(map['totalDeSetsDto'])  : null)! ;
    cantidadDeSetsDto = (map['cantidadDeSetsDto'] != null ?  CantidadDeSetsDto.fromMap(map['cantidadDeSetsDto'])  : null)! ;

    /**
     * Boxing
     */
    optionsTotalCompletedRoundsDosDesenlacesDto = (map['optionsTotalCompletedRoundsDosDesenlacesDto'] != null ?  OptionsTotalCompletedRoundsDosDesenlacesDto.fromMap(map['optionsTotalCompletedRoundsDosDesenlacesDto'])  : null)! ;

    /**
     * American Football
     */
    faCuartoConMasPuntosDto = (map['faCuartoConMasPuntosDto'] != null ?  FACuartoConMasPuntosDto.fromMap(map['faCuartoConMasPuntosDto'])  : null)! ;
    faOptionsPuntosDtoPartido = (map['faOptionsPuntosDtoPartido'] != null ?  FAPuntosDesenlace.fromMap(map['faOptionsPuntosDtoPartido'])  : null)! ;
    faOptionsPuntosDtoPartidoH = (map['faOptionsPuntosDtoPartidoH'] != null ?  FAPuntosDesenlace.fromMap(map['faOptionsPuntosDtoPartidoH'])  : null)! ;
    faOptionsPuntosDtoPartidoA = (map['faOptionsPuntosDtoPartidoA'] != null ?  FAPuntosDesenlace.fromMap(map['faOptionsPuntosDtoPartidoA'])  : null)! ;
    faOptionsPuntosDtoPrimeraMitad = (map['faOptionsPuntosDtoPrimeraMitad'] != null ?  FAPuntosDesenlace.fromMap(map['faOptionsPuntosDtoPrimeraMitad'])  : null)! ;
    faOptionsPuntosDtoPuntosC1 = (map['faOptionsPuntosDtoPuntosC1'] != null ?  FAPuntosDesenlace.fromMap(map['faOptionsPuntosDtoPuntosC1'])  : null)! ;


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
