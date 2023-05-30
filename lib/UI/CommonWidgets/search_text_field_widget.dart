import 'package:flutter/material.dart';

import '../../Utils/string_constants.dart';

/**
 * Created by Parth Sheth.
 * Created on 30/05/23 at 2:34 pm
 */

class CustomSearchTextField extends StatelessWidget {
  final TextEditingController searchController;
  const CustomSearchTextField({Key? key, required this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.white),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: searchTxt
      ),
    );
  }
}
