import 'package:flutter/material.dart';
import 'package:game_assignment/game/game.dart';
import 'package:game_assignment/overlays/settings.dart';

import '../game/game_play.dart';


class MainMenu extends StatelessWidget {
  static const id = 'MainMenu';
  final BunnyBurrow gameRef;

  const MainMenu({super.key, required this.gameRef});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.fitWidth,
          ),
          color: Colors.black,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    gameRef.overlays.remove(id);
                    gameRef.add(GamePlay());
                  },
                  child: const Text('Play'),
                ),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    gameRef.overlays.remove(id);
                    gameRef.overlays.add(Settings.id);
                  },
                  child: const Text('Settings'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
