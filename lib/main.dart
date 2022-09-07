import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game_assignment/game/game.dart';
import 'overlays/game_over.dart';
import 'overlays/main_menu.dart';
import 'overlays/pause_menu.dart';
import 'overlays/settings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyGame());
}

final _game = BunnyBurrow();

class MyGame extends StatelessWidget {
  const MyGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GameWidget<BunnyBurrow>(
            game: kDebugMode ? BunnyBurrow() : _game,
          overlayBuilderMap: {
            MainMenu.id: (context, game) => MainMenu(gameRef: game),
            PauseMenu.id: (context, game) => PauseMenu(gameRef: game),
            GameOver.id: (context, game) => GameOver(gameRef: game),
            Settings.id: (context, game) => Settings(gameRef: game),
          },
          initialActiveOverlays: const [MainMenu.id],
        ),
      ),
    );
  }
}
