import 'package:flutter/material.dart';
import 'package:pokeflutter/models/pokeList.dart';
import 'package:pokeflutter/widgets/singleCard.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../providers/pokemon_provider.dart';

class PokemonGrid extends StatefulWidget {
  PokemonGrid({Key? key}) : super(key: key);

  @override
  _PokemonGridPageState createState() => _PokemonGridPageState();
}

class _PokemonGridPageState extends State<PokemonGrid> {
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
    final providerData = Provider.of<PokeProvider>(context);
    final data = providerData.pokeList;

    return Expanded(
        child: data.isNotEmpty
            ? Container(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(5),
                  addAutomaticKeepAlives: true,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      columnCount: 2,
                      child: ScaleAnimation(
                        child: GestureDetector(
                          child: singleCard(data[index], context),
                          onTap: () {
                            print('mor');
                          },

                          //ontap navigate to details screen
                          // onTap: () {
                          //
                          // },
                        ),
                      ),
                    );
                  },
                ),
              )
            : GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: 10,
                itemBuilder: (BuildContext context, index) {
                  return EmptyCard();
                }));
  }
}

class EmptyCard extends StatelessWidget {
  const EmptyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(3, 5, 3, 0),
      child: Card(
        child: Column(children: [
          Text("Pokemon name"),
          Image.asset('assets/images/noimage.jpg'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10),
                child: Text(
                  "Type",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 10),
                child: Text("Weight", style: TextStyle(fontSize: 12)),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
