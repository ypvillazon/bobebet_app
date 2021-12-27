import 'dart:convert';

class SearchEventDto {

  List<String> namesSelected ;

  SearchEventDto(this.namesSelected);

  String toMap() {
    var map = new Map();
    map["namesSelected"] = this.namesSelected;
    String json = jsonEncode(map);
    return json;
  }

}