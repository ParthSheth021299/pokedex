import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palette_generator/palette_generator.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';

import '../../../CommonWidgets/app_bar_widget.dart';

/**
 * Created by Parth Sheth.
 * Created on 01/06/23 at 1:33 pm
 */
class PokemonDetailScreen extends StatefulWidget {
  final String pokemonImage;

  const PokemonDetailScreen({Key? key, required this.pokemonImage})
      : super(key: key);

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  PaletteGenerator? _paletteGenerator;
  List<Color> colorList = [];

  Future<void> _generatePalette() async {
    final imageProvider = NetworkImage(widget.pokemonImage);
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      imageProvider,
      size:
          Size(200, 200), // Specify the size of the image to sample colors from
    );
    List<Color> paletColor = [
      paletteGenerator.dominantColor!.color,
      paletteGenerator.vibrantColor!.color,
       paletteGenerator.lightVibrantColor!.color,
      // paletteGenerator.darkVibrantColor!.color,
      // paletteGenerator.mutedColor!.color,
      // paletteGenerator.lightMutedColor!.color,
      // paletteGenerator.darkMutedColor!.color
    ];
    setState(() {
      _paletteGenerator = paletteGenerator;
      colorList = paletColor;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _generatePalette();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(isDetailScreen: true,),
            SizedBox(height: 50,),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: CachedNetworkImage(
                    progressIndicatorBuilder:
                        (context, url, progress) {
                      return const Center(
                          child: CircularProgressIndicator());
                    },
                    imageUrl:
                    widget.pokemonImage,
                    color: Colors.black,
                    width: 90,
                  ),
                ),
                Positioned(
                  top: -10,
                  left: 10,
                  right: 10,
                  bottom: -10,
                  child: Container(
                    width: 500,
                    child: CachedNetworkImage(
                      progressIndicatorBuilder:
                          (context, url, progress) {
                        return const Center(
                            child: CircularProgressIndicator());
                      },
                      imageUrl:
                      widget.pokemonImage,
                      width: 90,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
