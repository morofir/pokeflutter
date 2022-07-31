import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokeflutter/providers/pokemon_provider.dart';
import 'package:pokeflutter/routes/AppPages.dart';
import 'package:pokeflutter/screens/Homepage.dart';
import 'package:pokeflutter/screens/PokemonDetails.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  runApp(const MyApp());
  await GetStorage.init();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PokeProvider(),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
          routes: {
            PokeDetailScreen.routeName: (ctx) => PokeDetailScreen(),
          },
          getPages: AppPages.pages,
        ));
  }
}
