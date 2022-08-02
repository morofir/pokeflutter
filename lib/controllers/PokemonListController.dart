import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PokemonListController extends GetxController {
  final box = GetStorage();

  //if we want a fresh list
  void clearData() async => GetStorage().erase();

  //write to storage
  saveListWithGetStorage(String storageKey, List<dynamic> storageValue) async =>
      await box.write(storageKey, jsonEncode(storageValue));

  /// read from storage
  readWithGetStorage(String storageKey) => box.read(storageKey);

  /// for nicknames/names
  String getNameOrNick(String chosen) => box.read(chosen);

  setNameOrNick(String key,String chosen) => box.write(key, chosen);

  saveList(List<dynamic> listNeedToSave) {
    /// getting all saved dat
    String? oldSavedData =
        PokemonListController().readWithGetStorage('saveList');

    /// in case there is saved data
    if (oldSavedData != null) {
      /// create a holder list for the old data
      List<dynamic> oldSavedList = jsonDecode(oldSavedData);

      /// append the new list to saved one
      oldSavedList.addAll(listNeedToSave);

      /// save the new collection
      return PokemonListController()
          .saveListWithGetStorage('saveList', oldSavedList);
    } else {
      /// in case of there is no saved data -- add the new list to storage
      return PokemonListController()
          .saveListWithGetStorage('saveList', listNeedToSave);
    }
  }
}
