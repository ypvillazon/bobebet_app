import 'dart:async';
import 'dart:convert';
import 'package:bobebet_app/models/tree.dart';
import 'package:bobebet_app/models/users.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';

class UsersService {
  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/users';

  Future<UserTreeResponse> userTree(bool expanded) async {
    String sessionId = await Prefs.sessionId ;
    var uri = '${PATH}?token=${sessionId}&expanded=${expanded}' ;
    GenericResponse response = await restClientService.get(uri) ;
    return _userTreeResponseFromJson(response.statusCode, response.message, (response.statusCode==0) ? response.data : null);
  }

  UserTreeResponse _userTreeResponseFromJson(int statusCode, String message, String json) {
    var userTreeResponse = new UserTreeResponse();
    userTreeResponse.statusCode = statusCode;
    userTreeResponse.message = message;
    userTreeResponse.jsonData = json ;
    if ((json != null)) {
      userTreeResponse.userTree = treeFromJson(json);
    } else {
      userTreeResponse.userTree = null as UserTree;
    }
    return userTreeResponse ;
  }

  UserTree treeFromJson(String json) {
    var userTree = new UserTree();
    Map<String, dynamic> map = jsonDecode(json);
    userTree.jsonTree = jsonEncode(map['tree']);
    userTree.users = (map['users'] as List).map((user) => User.fromMap(user)).toList();
    return userTree ;
  }


}