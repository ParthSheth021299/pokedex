import 'package:get/get.dart';
import 'package:pokedex/Data/Remote/Response/pokemonData_list_model.dart';

import '../../../../Data/Remote/Response/pokemonList_model_response.dart';
import '../../../../Network/Repository/pokemon_list_repository.dart';

/**
 * Created by Parth Sheth.
 * Created on 30/05/23 at 3:16 pm
 */

class PokemonListViewModel extends FullLifeCycleController {
  var pokemonList = <Results>[].obs;
  var pokemonMoves = <Moves>[].obs;
  var pokemonTypes = <Types>[].obs;
  var pokemonStat = <Stats>[].obs;
  var pokemonImage = ''.obs;
  var pokemonWeight = 0.obs;
  var pokemonHeight = 0.obs;
  var isLoading = true.obs;
  var onError = false.obs;

  @override
  void onInit() {
    super.onInit();
    print('BEFORE VALUE: ${pokemonImage}');
    getAllPokemonData();
    getDataPokemon();
    print('AFTER VALUE: ${pokemonImage}');
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

  Future<void> getDataPokemon() async {
    var pokemon = await PokemonRepository().fetchDataPokemon();
    if (pokemon != null) {
      isLoading.value = false;
      pokemonMoves.value = pokemon.moves!;
      pokemonWeight.value = pokemon.weight!;
      pokemonHeight.value = pokemon.height!;
      pokemonTypes.value = pokemon.types!;
      pokemonStat.value = pokemon.stats!;
      pokemonImage.value = pokemon.sprites!.other!.home!.frontDefault!;
    } else {
      isLoading.value = false;
      onError.value = true;
    }
  }
}
