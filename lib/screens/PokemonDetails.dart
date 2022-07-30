import 'package:flutter/material.dart';
import 'package:pokeflutter/widgets/DetailsScreen.dart';

import 'package:provider/provider.dart';

import '../models/Pokemon.dart';
import '../providers/pokemon_provider.dart';
import '../widgets/NameRadio.dart';

class PokeDetailScreen extends StatefulWidget {
  static const routeName = '/pokeDetailScreen';

  @override
  _PokeDetailScreenState createState() => _PokeDetailScreenState();
}

class _PokeDetailScreenState extends State<PokeDetailScreen> {
  var _isInit = true;

  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final route = ModalRoute.of(context);
      final pokeId = ModalRoute.of(context)?.settings.arguments as String;
      Provider.of<PokeProvider>(context, listen: false)
          .getSpecificPoke(pokeId,
              context) //this is the call for getting the specific pokemon
          .then((_) {});
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<PokeProvider>(context);
    final pokeData = providerData.pokemon;

    return Scaffold(
        backgroundColor: Colors.white,
        body: providerData.isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 35,
                        bottom: -60,
                        left: 35,
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/loading.gif',
                          placeholderFit: BoxFit.contain, //todo change
                          image: pokeData.sprite,
                          imageScale: 0.15,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            pokeData.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 40,
                            ),
                          ),
                          Text(
                            'National #' + pokeData.id.toString(),
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w800),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Enter Name/Nickname',
                            style: TextStyle(
                                fontSize: 20, fontStyle: FontStyle.italic),
                          ),
                          NameRadio(),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
  }
}