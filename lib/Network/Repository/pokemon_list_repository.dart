import 'package:flutter/foundation.dart';

import '../../Data/Remote/Response/pokemonList_model_response.dart';
import '../APIs/api_constants.dart';
import '../NetworkHandler/dio_with_interceptor.dart';

/**
 * Created by Parth Sheth.
 * Created on 30/05/23 at 3:11 pm
 */
class PokemonRepository{
   var customDio = CustomDio();
   var client;

   Future<PokemonListResponseModel> fetchAllPokemonData() async{
    try {
      client = await customDio.getDio();
      var response = await client.get(pokemonListUrl);
      return PokemonListResponseModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      return PokemonListResponseModel.withError('No Internet Connection');
    }
  }
}