
class User {
  late String id;
  late String parentId;
  late String name;
  late double credit;
  late double bankWonPercent ;
  late double userWonPercent ;
  late double minBetCredit ;
  late double minCredit ;
  late double minCreditForBetByEvent;
  late bool enable;
  late String role ;

  User();

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    parentId = map['parentId'];
    name = map['name'];
    credit = map['credit'];
    bankWonPercent = map['bankWonPercent'];
    userWonPercent = map['userWonPercent'];
    minBetCredit = map['minBetCredit'];
    minCredit = map['minCredit'];
    minCreditForBetByEvent = map['minCreditForBetByEvent'];
    enable = map['enable'];
    role = map['role'];
  }
}

class UserDetailsResponse {
  late int statusCode ;
  late String message ;
  late User user ;
}

class UserAdd {
  late String name ;
  late String email ;
  late String role ;
  late String credit ;
  late String bankWonPercent ;
  late String userWonPercent ;
  late String minBetCredit ;
  late String minCredit ;

  UserAdd();
}

class UserAddResponse {
  late int statusCode ;
  late String message ;
  late String data ;
}

class UserUpdate {
  late String id ;
  late String bankWonPercent ;
  late String minBetCredit ;
  late String minCredit ;
  late String userWonPercent ;
  late String credit ;
  late String minCreditForBetByEvent ;
}