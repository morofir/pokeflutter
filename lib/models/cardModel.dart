import 'package:flutter/material.dart';

class cardModel with ChangeNotifier {
  var id;
  var name;
  var sprite;
  var type;
  var weight;

  cardModel({this.id, this.name, this.sprite, this.type, this.weight});

  factory cardModel.fromJson(Map<String, dynamic> json) {
    bool types = json['types'].length == 1;

    String handleTypes(types) {
      if (types)
        return json['types'][0]['type']['name'].toString();
      else {
        return json['types'][0]['type']['name'].toString() +
            " & " +
            json['types'][1]['type']['name'].toString();
      }
    }

    return cardModel(
        id: json["id"].toString(),
        name: json["name"].toString(),
        sprite: json["sprites"]['front_default'],
        type: handleTypes(types),
        weight: json['weight'].toString());
  }
}
