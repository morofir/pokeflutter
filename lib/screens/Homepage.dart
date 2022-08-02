import 'package:flutter/material.dart';
import 'package:pokeflutter/providers/pokemon_provider.dart';
import 'package:pokeflutter/widgets/gridview/PokemonGrid.dart';
import 'package:pokeflutter/widgets/searchbar/Searchbar.dart';
import 'package:provider/provider.dart';

import '../widgets/singleCard.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Pokémon Wiki',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 45),
              child: Text(
                'Search Pokémon by entering their name or National number.',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.grey[500],
                ),
              ),
            ),
            SearchBar(),
            PokemonGrid(),
          ],
        ),
      ),
    ));
  }
}
