import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../../PokemonModule/View/pokemon_screen.dart';

/// Created by Parth Sheth.
/// Created on 30/05/23 at 12:06 pm

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? _animation;

  AssetsAudioPlayer? assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, 3), // Start the image at the bottom
      end: Offset.zero, // Move the image to the center
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    ));
    _controller?.forward();
    assetsAudioPlayer?.open(
      Audio("assets/audio/mp3/splash_sound.mp3"),
      autoStart: true,
      forceOpen: true,
      showNotification: false,
    );
    assetsAudioPlayer?.playlistFinished.listen((event) {

      if (event == true) {
        Future.delayed(const Duration(seconds: 2));
        Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) => const PokemonScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
              (route) => false,
        );

      }

    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SlideTransition(
            position: _animation!,
            child: Image.asset('assets/images/png/pokemon.png'), // Replace with your image asset path
          ),
        ),
      ),
    );
  }
}

