/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../Utils/image_constants.dart';
import '../../../../Utils/string_constants.dart';
import '../../../CommonWidgets/search_text_field_widget.dart';
import '../ViewModel/pokemon_view_model.dart';

*/
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pokedex/UI/View/PokemonModule/View/pokemon_detail_screen.dart';

import '../../../CommonWidgets/app_bar_widget.dart';
import '../ViewModel/pokemon_view_model.dart';

/**
 * Created by Parth Sheth.
 * Created on 30/05/23 at 12:03 pm
 */ /*


class PokemonScreen extends StatelessWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchPokemonController = TextEditingController();
    final pokemonViewModel = Get.find<PokemonListViewModel>();
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Align(
                  child: Image.asset('assets/images/png/pokemon.png'),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Image.asset(menuIcon)),
                    Expanded(
                      child: CustomSearchTextField(
                        searchController: searchPokemonController,
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Image.asset(themeIcon)),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: pokemonViewModel.isLoading.value == true
                      ? Center(
                          child: Image.asset(
                              'assets/images/gif/pokemon_loader.gif'),
                        )
                      : GridView.builder(
                          itemCount: pokemonViewModel.pokemonList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 4.0,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.yellow,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20))),
                                            height: 120,
                                            width: 170,
                                          ),
                                          Positioned.fill(
                                            top: -50,
                                            left: 10,
                                            child: FractionalTranslation(
                                              translation: Offset(-0.1, -0.1),
                                              child: Image.network(
                                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${index + 1}.png',width: 130,
                                                height: 130,),
                                            ),
                                          ),
                                        ],
                                      ),
                                      */
/*Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(pokemonViewModel
                                                .pokemonList[index].name
                                                .toString()),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text('Hello'),
                                          ],
                                        ),
                                      ),*/ /*

                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonViewModel = Get.find<PokemonListViewModel>();
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: Column(
            children: [
               CustomAppBar(isDetailScreen: false,),
              const SizedBox(
                height: 10,
              ),
              pokemonViewModel.isLoading.value == true
                  ? Center(
                      child: Image.asset(
                        'assets/images/gif/pikachu_loader.gif',
                        height: 100,
                        width: 100,
                      ),
                    )
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 20,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PokemonDetailScreen(
                                              pokemonImage:
                                                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${index + 1}.png',
                                            )));
                              },
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50.0),
                                    child: Card(
                                      elevation: 4.0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Container(
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: 500,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  // topLeft: Radius.circular(10),
                                                  // topRight: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(50),
                                                  bottomRight:
                                                      Radius.circular(50),
                                                ),
                                              ),
                                              child: Text(
                                                pokemonViewModel
                                                    .pokemonList[index].name
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: MediaQuery.of(context).size.width *
                                        -0.01,
                                    right: MediaQuery.of(context).size.width *
                                        0.02,
                                    left: MediaQuery.of(context).size.width *
                                        0.01,
                                    bottom: MediaQuery.of(context).size.width *
                                        0.10,
                                    child: CachedNetworkImage(
                                      progressIndicatorBuilder:
                                          (context, url, progress) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      },
                                      imageUrl:
                                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${index + 1}.png',
                                      width: 150,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: pokemonViewModel.pokemonList.length,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
