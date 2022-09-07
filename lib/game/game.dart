import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flame/extensions.dart';
import 'package:flame/input.dart';
import 'package:game_assignment/game/utils/audio_manager.dart';

import '../models/player_data.dart';


class BunnyBurrow extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents, HasTappables {
  late Image spriteSheet;

  final playerData = PlayerData();

  @override
  Future<void>? onLoad() async {
    await Flame.device.fullScreen();
    await Flame.device.setLandscape();

    await AudioManager.init();

    spriteSheet = await images.load('Spritesheet.png');

    camera.viewport = FixedResolutionViewport(
      Vector2(640, 330),
    );

    return super.onLoad();
  }
}
