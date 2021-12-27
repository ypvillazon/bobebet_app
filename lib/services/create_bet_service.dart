import 'package:bobebet_app/models/bet.dart';
import 'dart:async';
import 'package:bobebet_app/services/common/rest_client_service.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:flutter/material.dart';

class CreateBetService {

  RestClientService restClientService = RestClientService() ;
  String PATH = '/api/bet/bets' ;

  Future<GenericResponse> create(Bet bet) async {
    print(bet.toJson()) ;
    String sessionId = await Prefs.sessionId ;
    var uri = '${PATH}?token=${sessionId}' ;
    return await restClientService.post(uri, bet.toJson());
  }
}
