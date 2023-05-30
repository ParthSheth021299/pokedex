import 'package:get/get.dart';

import '../../../../Data/Remote/Response/pokemonList_model_response.dart';
import '../../../../Network/Repository/pokemon_list_repository.dart';

/**
 * Created by Parth Sheth.
 * Created on 30/05/23 at 3:16 pm
 */

class PokemonListViewModel extends FullLifeCycleController {

  var pokemonList = <Results>[].obs;
  var isLoading = true.obs;
  var onError = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllPokemonData();
  }

  Future<void> getAllPokemonData() async {
    var pokemon = await PokemonRepository().fetchAllPokemonData();
    if (pokemon != null) {
      isLoading.value = false;
      pokemonList.value = pokemon.results!;
    } else {
      isLoading.value = false;
      onError.value = true;
    }
  }
}
