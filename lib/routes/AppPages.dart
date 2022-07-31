import 'package:get/get.dart';

import '../screens/PokemonDetails.dart';
part './AppRoutes.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: AppRoutes.pokemonDetail,
      page: () => PokeDetailScreen(),
    ),
  ];
}
