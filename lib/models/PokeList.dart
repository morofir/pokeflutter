import 'package:flutter/material.dart';

class pokeList with ChangeNotifier {
  var url;

  pokeList({this.url});

  factory pokeList.getUrl(dynamic json) {
    return pokeList(url: json['url']);
  }
}
