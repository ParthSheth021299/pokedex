import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'UI/View/PokemonModule/View/pokemon_screen.dart';
import 'UI/View/PokemonModule/ViewModel/pokemon_view_model.dart';
import 'UI/View/SplashModule/View/splash_screen.dart';

void main() {
  runApp(const MyApp());
  Get.lazyPut<PokemonListViewModel>(() => PokemonListViewModel(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.red,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        useMaterial3: true
      ),
      home: SplashScreen(),
    );
  }
}

