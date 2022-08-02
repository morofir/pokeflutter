import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokeflutter/models/Pokemon.dart';

import '../controllers/PokemonListController.dart';
import '../screens/Homepage.dart';

class SaveCancelBtns extends StatefulWidget {
  SaveCancelBtns({this.pokeData});
  final pokeData;

  @override
  State<SaveCancelBtns> createState() => _SaveCancelBtnsState();
}

class _SaveCancelBtnsState extends State<SaveCancelBtns> {
  void handleAddPokemon(Pokemon p) {
    var pokeObj = {
      "id": p.id,
      "name": p.name,
      "sprite": p.sprite,
      "type": p.type[0]['type']['name'].toString(),
      "weight": p.weight.toString()
    };
    List<dynamic> list = [];

    list.add(pokeObj);
    var alreadyExist =
        readList().toString().contains(pokeObj["sprite"]); //must be unique url
    if (alreadyExist) {
      Get.snackbar("Error!", "pokemon ${pokeObj["name"]} already in the list!",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      controller.saveList(list);
      Get.to(() => HomePage());
      Get.snackbar("Success", "Pokemon ${pokeObj["name"]} added to list",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  final PokemonListController controller = Get.put(PokemonListController());
  readList() => PokemonListController().readWithGetStorage('saveList');

  @override
  Widget build(BuildContext context) {
    final data = readList();

    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            onPressed: () => Get.back(),
            iconSize: 45,
            icon: Icon(Icons.cancel),
          ),
          SizedBox(width: 15),
          IconButton(
            onPressed: () => handleAddPokemon(this.widget.pokeData),
            iconSize: 45,
            icon: Icon(Icons.save),
          ),
        ]),
      ],
    );
  }
}
