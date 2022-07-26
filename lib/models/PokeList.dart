import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html
//provides a change notification api using voidcallbacks for notifications

class PokeList with ChangeNotifier {
  var url;

  PokeList({this.url});

  factory PokeList.getUrl(dynamic json) {
    return PokeList(
      url: json['url'],
    );
  }
}
//todo