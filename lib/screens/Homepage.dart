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
  void initState() {
    super.initState();
    Provider.of<PokeProvider>(context, listen: false).getData();
  }

  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<PokeProvider>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<PokeProvider>(context);
    final pokemonsData = data.pokeList;

    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Pokémon Wiki',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 35,
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
          // Expanded(
          //     child: data.isLoading
          //         ? Center(child: CircularProgressIndicator())
          //         : RefreshIndicator(
          //             onRefresh: () => _refreshData(context),
          //             child: ListView(
          //               padding: EdgeInsets.all(4),
          //               children: [
          //                 Column(
          //                     children: pokemonsData
          //                         .map((item) => singleCard(item, context))
          //                         .toList()),
          //               ],
          //             ),
          //           )),
        ],
      ),
    ));
  }
}
