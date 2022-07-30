import 'package:flutter/material.dart';

class cardModel with ChangeNotifier {
  var id;
  var name;
  var sprite;
  var type;
  var weight;

  cardModel({this.id, this.name, this.sprite, this.type, this.weight});

  factory cardModel.fromJson(Map<String, dynamic> json) {
    return cardModel(
        id: json["id"].toString(),
        name: json["name"].toString(),
        sprite: json["sprite"],
        type: json['types'], //todo?
        weight: json['weight']);
  }
}
