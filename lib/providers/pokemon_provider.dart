import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pokeflutter/models/Pokemon.dart';
import 'package:http/http.dart' as http;
import '../screens/Homepage.dart';
import '../models/cardModel.dart';

class PokeProvider with ChangeNotifier {
  bool isLoading = false;
  List<cardModel> pokeList = [];
  List<Pokemon> descList = [];
  Pokemon pokemon = new Pokemon();

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

      Get.to(() => HomePage());
    }
  }
}
