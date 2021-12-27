import 'dart:async';
import 'dart:convert';

import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';
import 'package:device_info/device_info.dart';

class DeviceInfoService {

  RestClientService restClientService = RestClientService() ;
  String PATH = '/api/bobe/access' ;

  Future<void> send() async {
    AndroidDeviceInfo deviceInfo = await new DeviceInfoPlugin().androidInfo ;
    String sessionId  = await Prefs.sessionId ;
    await restClientService.post('${PATH}/?token=${sessionId}', _deviceInfoDetailsToJson(deviceInfo)) ;
  }

  String _deviceInfoDetailsToJson(AndroidDeviceInfo build) {
    var map = new Map();
    map["deviceId"] = build.id;
    map["versionRelease"] = build.version.release ;
    map["versionBaseOS"] = build.version.baseOS ;
    map["versionCodename"] = build.version.codename ;
    map["androidId"] = build.androidId ;
    map["board"] = build.board ;
    map["brand"] = build.brand ;
    map["device"] = build.device ;
    map["display"] = build.device ;
    map["fingerprint"] = build.fingerprint ;
    map["hardware"] = build.hardware ;
    map["host"] = build.host ;
    map["isPhysicalDevice"] = build.isPhysicalDevice ;
    map["manufacturer"] = build.manufacturer ;
    map["model"] = build.model ;
    map["product"] = build.product ;
    map["systemFeatures"] = build.systemFeatures ;
    map["type"] = build.type ;
    print('');
    print("DEVICE: " + jsonEncode(map));
    print('');
    return jsonEncode(map);
  }

}