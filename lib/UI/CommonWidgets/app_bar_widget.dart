import 'package:flutter/material.dart';
import 'package:pokedex/UI/CommonWidgets/search_text_field_widget.dart';

import '../../Utils/image_constants.dart';

/**
 * Created by Parth Sheth.
 * Created on 30/05/23 at 5:00 pm
 */
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchPokemonController = TextEditingController();
    return Padding(
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
        ],
      ),
    );
  }
}
