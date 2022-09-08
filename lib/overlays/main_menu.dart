import 'package:flutter/material.dart';
import 'package:game_assignment/game/game.dart';
import 'package:game_assignment/overlays/settings.dart';
import 'package:game_assignment/widgets/backGround.dart';
import 'package:game_assignment/widgets/card.dart';
import 'package:game_assignment/widgets/default_button.dart';
import 'package:game_assignment/widgets/regular_text.dart';

import '../game/game_play.dart';


class MainMenu extends StatelessWidget {
  static const id = 'MainMenu';
  final BunnyBurrow gameRef;

  const MainMenu({super.key, required this.gameRef});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundImage(
        child: Center(
          child: CustomCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultButton(
                    onTap:  () {
                      gameRef.overlays.remove(id);
                      gameRef.add(GamePlay());
                    },
                    color: Colors.blueAccent,
                  child: RegularText(
                    text: "Play",
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
                    gameRef.overlays.add(Settings.id);
                  },
                  color: Colors.blueAccent,
                  child: RegularText(
                    text: "Settings",
                    size: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
