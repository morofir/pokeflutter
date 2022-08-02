import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/PokemonListController.dart';


class PokemonGrid extends StatefulWidget {
  PokemonGrid({Key? key}) : super(key: key);

  @override
  _PokemonGridPageState createState() => _PokemonGridPageState();
}

final PokemonListController controller = Get.put(PokemonListController());

class _PokemonGridPageState extends State<PokemonGrid> {
  @override
  void initState() {
    super.initState();
    new Timer.periodic(Duration(seconds: 0), (Timer t) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    var dataAfterSaved = controller.readWithGetStorage('saveList');
    var decodedList =
        jsonDecode(dataAfterSaved ?? '{"text": "foo","text2":"bar"}');

    return Expanded(
        child: decodedList != null && decodedList.length > 0
            ? GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: decodedList.length ??= 6,
                itemBuilder: (BuildContext context, index) {
                  return GenericCard(decodedList[index]);
                })
            : GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: 10,
                itemBuilder: (BuildContext context, index) {
                  return GenericCard(null);
                }));
  }
}

class GenericCard extends StatefulWidget {
  GenericCard(this.pokemon);
  final dynamic pokemon;

  @override
  State<GenericCard> createState() => _GenericCardState();
}

class _GenericCardState extends State<GenericCard> {
  @override
  Widget build(BuildContext context) {
    var isPokemon = widget.pokemon != null;
    return Padding(
      padding: const EdgeInsets.fromLTRB(3, 5, 3, 0),
      child: Card(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isPokemon
                  ? Text(
                      "${widget.pokemon["name"]}",
                      style: TextStyle(fontSize: 20),
                    )
                  : Text(
                      "Pokemon name",
                      style: TextStyle(fontSize: 20),
                    ),
              isPokemon
                  ? Image.network(widget.pokemon["sprite"])
                  : Image.asset('assets/images/noimage.jpg'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5, left: 10),
                    child: isPokemon
                        ? Text(widget.pokemon["type"],
                            style: TextStyle(fontSize: 16))
                        : Text(
                            "Type",
                            style: TextStyle(fontSize: 16),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5, right: 10),
                    child: isPokemon
                        ? Text(widget.pokemon["weight"],
                            style: TextStyle(fontSize: 16))
                        : Text("Weight", style: TextStyle(fontSize: 16)),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
