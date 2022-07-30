class Pokemon {
  var id;
  var name;
  var sprite;
  var type;
  var weight;

  Pokemon({this.id, this.name, this.sprite, this.type, this.weight});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
        id: json["id"],
        name: json["name"],
        sprite: json["sprites"]['front_default'],
        type: json['types'], //todo?
        weight: json['weight']);
  }
}
