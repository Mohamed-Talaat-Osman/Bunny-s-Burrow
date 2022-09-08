import 'package:flutter/material.dart';
import 'package:game_assignment/game/game.dart';
import 'package:game_assignment/widgets/card.dart';
import '../game/game_play.dart';
import '../widgets/default_button.dart';
import '../widgets/regular_text.dart';
import 'main_menu.dart';

class GameOver extends StatelessWidget {
  static const id = 'GameOver';
  final BunnyBurrow gameRef;

  const GameOver({super.key, required this.gameRef});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withAlpha(100),
      body: Center(
        child: CustomCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultButton(
                onTap:  () {
                  gameRef.overlays.remove(id);
                  gameRef.resumeEngine();
                  gameRef.removeAll(gameRef.children);
                  gameRef.add(GamePlay());
                },
                color: Colors.blueAccent,
                child: RegularText(
                  text: "Restart",
                  size: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DefaultButton(
                onTap:  () {
                  gameRef.overlays.remove(id);
                  gameRef.resumeEngine();
                  gameRef.removeAll(gameRef.children);
                  gameRef.overlays.add(MainMenu.id);
                },
                color: Colors.blueAccent,
                child: RegularText(
                  text: "Exit",
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
