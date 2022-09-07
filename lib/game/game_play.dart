import 'package:flame/components.dart';
import 'package:game_assignment/game/game.dart';
import 'package:game_assignment/game/utils/audio_manager.dart';
import 'hud/hud.dart';
import 'level/level.dart';

class GamePlay extends Component with HasGameRef<BunnyBurrow> {
  Level? _currentLevel;
  final hud = Hud(priority: 1);

  @override
  Future<void>? onLoad() {
    AudioManager.playBgm('8BitPlatformerLoop.wav');

    loadLevel('Level1.tmx');
    gameRef.add(hud);
    gameRef.playerData.score.value = 0;
    gameRef.playerData.health.value = 3;

    return super.onLoad();
  }

  @override
  void onRemove() {
    gameRef.remove(hud);
    super.onRemove();
  }

  void loadLevel(String levelName) {
    _currentLevel?.removeFromParent();
    _currentLevel = Level(levelName);
    add(_currentLevel!);
  }
}
