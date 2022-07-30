import 'package:flutter/material.dart';

class singleCard extends StatelessWidget {
  final dynamic pokemon;
  final BuildContext context;

  const singleCard(this.pokemon, this.context);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
      margin: EdgeInsets.only(bottom: 10, top: 5, left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        child: Column(children: [
          Text(pokemon.name),
          Image.network(pokemon.sprite),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 20),
                child: Text(
                  "${pokemon.weight}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 20),
                child: Text("${pokemon.type}", style: TextStyle(fontSize: 20)),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
