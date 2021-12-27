import 'package:bobebet_app/models/users.dart';

class UserTree {
  late String jsonTree;
  late List<User> users ;
}

class UserTreeResponse {
  late int statusCode ;
  late String message ;
  late String jsonData ;
  late UserTree userTree ;
}