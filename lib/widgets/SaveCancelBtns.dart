import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokeflutter/models/Pokemon.dart';

class SaveCancelBtns extends StatefulWidget {
  SaveCancelBtns({this.pokeData});
  final pokeData;

  @override
  State<SaveCancelBtns> createState() => _SaveCancelBtnsState();
}

class _SaveCancelBtnsState extends State<SaveCancelBtns> {
  void handleAddPokemon(Pokemon p) {
    print('pokemon: ' +
        p.id.toString() +
        " " +
        p.name +
        " " +
        p.sprite +
        " " +
        p.type[0]['type']['name'].toString() +
        " " +
        p.weight.toString());
    List<Pokemon> list = [];
    list.add(p);
    // controller.saveList(list);
    // controller.saveListWithGetStorage("pokeList", list);
    // final savedPokemons = controller.saveList(list);
    // var listsaved = controller.readWithGetStorage("pokeList");
    // print(listsaved);
  }

  final ListStorage controller = Get.put(ListStorage());

  @override
  Widget build(BuildContext context) {
    // final counter = controller.readCount();

    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
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
        FloatingActionButton(
          onPressed: () async {
            setState(() {
              // controller.increment();
              // controller.writeCount(counter);
            });
          },
          tooltip: 'Increment',
          backgroundColor: Colors.cyan,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}

class ListStorage extends GetxController {
  final box = GetStorage("pokeList");

  //write to storage
  saveListWithGetStorage(String storageKey, List<Pokemon> storageValue) async =>
      await box.write(storageKey, jsonEncode(storageValue));

  /// read from storage
  readWithGetStorage(String storageKey) => box.read(storageKey);

  saveList(List<Pokemon> listNeedToSave) {
    /// getting all saved data
    String oldSavedData = GetStorage().read('pokeList');

    /// in case there is saved data
    if (oldSavedData.isNotEmpty) {
      /// create a holder list for the old data
      List<dynamic> oldSavedList = jsonDecode(oldSavedData);

      /// append the new list to saved one
      oldSavedList.addAll(listNeedToSave);

      /// save the new collection
      return GetStorage().write('pokeList', oldSavedList);
    } else {
      /// in case of there is no saved data -- add the new list to storage
      return GetStorage().write('pokeList', listNeedToSave);
    }
  }
}
