import 'package:flutter/material.dart';
import 'package:pokeflutter/models/Pokemon.dart';

class singleCard extends StatelessWidget {
  final dynamic pokemon;
  final BuildContext context;

  const singleCard(this.pokemon, this.context);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
      margin: EdgeInsets.only(bottom: 20, top: 5, left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [Text(pokemon.name), Image.network(pokemon.url.toString())],
      ),
    );
  }
}
