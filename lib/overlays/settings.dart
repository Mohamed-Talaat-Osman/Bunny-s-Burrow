import 'package:flutter/material.dart';
import 'package:game_assignment/game/game.dart';

import '../game/utils/audio_manager.dart';
import 'main_menu.dart';


class Settings extends StatelessWidget {
  static const id = 'Settings';
  final BunnyBurrow gameRef;

  const Settings({super.key, required this.gameRef});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ValueListenableBuilder<bool>(
                valueListenable: AudioManager.sfx,
                builder: (context, sfx, child) => SwitchListTile(
                  title: const Text('Sound Effects'),
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
                  title: const Text('Background Music'),
                  value: bgm,
                  onChanged: (value) => AudioManager.bgm.value = value,
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  gameRef.overlays.remove(id);
                  gameRef.overlays.add(MainMenu.id);
                },
                child: const Text('Back'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
