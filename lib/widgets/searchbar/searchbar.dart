import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../screens/PokemonDetails.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _textController = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  void handleSearch(value) {
    if (value.isNotEmpty) {
      Get.toNamed(PokeDetailScreen.routeName, arguments: value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        style: TextStyle(color: Colors.black),
        maxLines: 1,
        controller: _textController,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey[600]),
          errorText: _validate ? null : null,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          icon: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: IconButton(
              onPressed: () => handleSearch(_textController.text),
              icon: new Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
          hintText: "What Pokémon are you looking for? ",
        ),
        onSubmitted: handleSearch,
      ),
    );
  }
}
