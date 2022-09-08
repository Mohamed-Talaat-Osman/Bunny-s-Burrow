import 'package:flutter/material.dart';
import 'package:game_assignment/game/game.dart';
import 'package:game_assignment/widgets/card.dart';

import '../game/utils/audio_manager.dart';
import '../widgets/default_button.dart';
import '../widgets/regular_text.dart';
import 'main_menu.dart';

class PauseMenu extends StatelessWidget {
  static const id = 'PauseMenu';
  final BunnyBurrow gameRef;

  const PauseMenu({super.key, required this.gameRef});

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
                  AudioManager.resumeBgm();
                  gameRef.overlays.remove(id);
                  gameRef.resumeEngine();
                },
                color: Colors.blueAccent,
                child: RegularText(
                  text: "Resume",
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
