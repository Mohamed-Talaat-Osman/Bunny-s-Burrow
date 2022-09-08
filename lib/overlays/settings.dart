import 'package:flutter/material.dart';
import 'package:game_assignment/game/game.dart';
import 'package:game_assignment/widgets/backGround.dart';
import 'package:game_assignment/widgets/regular_text.dart';

import '../game/utils/audio_manager.dart';
import '../widgets/card.dart';
import '../widgets/default_button.dart';
import 'main_menu.dart';


class Settings extends StatelessWidget {
  static const id = 'Settings';
  final BunnyBurrow gameRef;

  const Settings({super.key, required this.gameRef});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BackGroundImage(
        child: Center(
          child: CustomCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: ValueListenableBuilder<bool>(
                    valueListenable: AudioManager.sfx,
                    builder: (context, sfx, child) => SwitchListTile(
                      title: RegularText(
                        text: "Sound Effects",
                        size: 18,
                        color: Colors.black87,
                      ),
                      value: sfx,
                      onChanged: (value) => AudioManager.sfx.value = value,
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: ValueListenableBuilder<bool>(
                    valueListenable: AudioManager.bgm,
                    builder: (context, bgm, child) => SwitchListTile(
                      title: RegularText(
                        text: "Background Music",
                        size: 18,
                        color: Colors.black87,
                      ),
                      value: bgm,
                      onChanged: (value) => AudioManager.bgm.value = value,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DefaultButton(
                  onTap:  () {
                    gameRef.overlays.remove(id);
                    gameRef.overlays.add(MainMenu.id);
                  },
                  color: Colors.blueAccent,
                  child: RegularText(
                    text: "Back",
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
