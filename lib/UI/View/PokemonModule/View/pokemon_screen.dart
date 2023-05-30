/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../Utils/image_constants.dart';
import '../../../../Utils/string_constants.dart';
import '../../../CommonWidgets/search_text_field_widget.dart';
import '../ViewModel/pokemon_view_model.dart';

*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
              CustomAppBar(),
              SizedBox(height: 50,),
              pokemonViewModel.isLoading.value == true
                  ? Center(
                      child: Image.asset(
                          'assets/images/gif/pokemon_loader.gif'),
                    )
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: pokemonViewModel.pokemonList.length,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Positioned(
                                    top: 50,
                                    child: Card(
                                      elevation: 4.0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(20)),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.yellow,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(20),
                                                    topRight: Radius.circular(20))),
                                            height: 100,
                                            width: 170,
                                          ),
                                          Text('Hello')
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -10,
                                    right: 30,
                                    left: 20,
                                    child: Image.network(
                                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${index + 20}.png',width: 150,
                                      height: 130,),
                                  ),
                                ],
                              );
                            }),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
