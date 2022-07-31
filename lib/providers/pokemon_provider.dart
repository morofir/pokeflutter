import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pokeflutter/models/Pokemon.dart';
import 'package:http/http.dart' as http;

import '../models/cardModel.dart';

class PokeProvider with ChangeNotifier {
  bool isLoading = false;
  List<cardModel> pokeList = [];
  List<Pokemon> descList = [];
  Pokemon pokemon = new Pokemon();

  Future<void> getData() async {
    List<cardModel> tmp = [];
    try {
      isLoading = true;
      Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/');
      final response = await http.get(url);
      final responseData = json.decode(response.body) as Map<String, dynamic>;

      tmp.add(cardModel.fromJson(responseData));
      pokeList = tmp;
      isLoading = false;
      print('pppp ${pokeList.length}');

      notifyListeners();
    } catch (e) {
      isLoading = false;
    }
  }

  Future<void> getSpecificPoke(String id, context) async {
    List<Pokemon> tmp = [];
    Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$id');
    try {
      isLoading = true;
      final response = await http.get(url);
      final data = json.decode(response.body) as Map<String, dynamic>;
      pokemon = Pokemon.fromJson(data);
      isLoading = false;
      descList = tmp;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      print('Error: ' + e.toString());
      notifyListeners();
      Get.snackbar("Error", "Pokemon not found!",
          snackPosition: SnackPosition.BOTTOM);
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text("Pokemon not found!"),
      // ));
      Navigator.of(context).pop();
      throw (e);
    }
  }
}
