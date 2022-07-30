import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokeflutter/models/Pokemon.dart';
import 'package:http/http.dart' as http;

import '../models/cardModel.dart';

class PokeProvider with ChangeNotifier {
  bool isLoading = false;
  List<cardModel> list = [];
  List<Pokemon> pokemonList = [];

  Pokemon pokemon = new Pokemon();

  Future<void> getData() async {
    int pokeNum = 20;
    List<cardModel> tmp = [];
  }

  Future<void> getSpecificPoke(String id) async {
    List<Pokemon> tmp = [];
    Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$id');
    try {
      final response = await http.get(url);
      final data = json.decode(response.body) as Map<String, dynamic>;
      pokemon = Pokemon.fromJson(data);
      isLoading = false;
      notifyListeners();
      // inspect(pokemon);
    } catch (e) {
      isLoading = true;
      print('Error: ' + e.toString());
      notifyListeners();
      throw (e);
    }
  }
}
