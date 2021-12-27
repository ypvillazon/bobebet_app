import 'dart:async';

import 'package:bobebet_app/services/common/rest_client_service.dart';
import 'package:bobebet_app/preference/prefs.dart';

class EnableOrDisableUserService {

  RestClientService restClientService = RestClientService() ;
  String PATH = '/api/bet/users/status' ;

  Future<GenericResponse> change(bool status, String userId) async {
    String token = await Prefs.sessionId ;
    var uri = '${PATH}?token=${token}&userStatus=${(status) ? "E" : "D"}&userId=${userId}' ;
    print(uri) ;
    return await restClientService.post(uri, "");
  }
}
