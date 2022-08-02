import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/PokemonListController.dart';

enum options { Name, Nickname }

class NameRadio extends StatefulWidget {
  var pokeId = 0;
  NameRadio(this.pokeId);

  @override
  _NameRadioState createState() => _NameRadioState();
}

class _NameRadioState extends State<NameRadio> {
  options _chosenOption = options.Name;

  get textChosen => _chosenOption == options.Name ? 'Name' : 'Nickname';
  final PokemonListController controller = Get.put(PokemonListController());

  String get pokeId => widget.pokeId.toString();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Name'),
          leading: Radio(
            value: options.Name,
            groupValue: _chosenOption,
            onChanged: (value) {
              setState(() {
                _chosenOption = value as options;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Nickname'),
          leading: Radio(
            value: options.Nickname,
            groupValue: _chosenOption,
            onChanged: (value) {
              setState(() {
                _chosenOption = value as options;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 15, 20, 25),
          child: TextField(
            onSubmitted: (value) => controller.setNameOrNick(pokeId, value), //the key is the pokemon number
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Pokemon $textChosen',
            ),
          ),
        ),
      ],
    );
  }
}
