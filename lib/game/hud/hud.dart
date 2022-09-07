import 'package:flame/components.dart';
import 'package:flame/input.dart';

import '../../overlays/game_over.dart';
import '../../overlays/pause_menu.dart';
import '../game.dart';
import '../utils/audio_manager.dart';


class Hud extends Component with HasGameRef<BunnyBurrow> {
  late final TextComponent scoreTextComponent;
  late final TextComponent healthTextComponent;

  Hud({super.children, super.priority}) {
    positionType = PositionType.viewport;
  }

  @override
  Future<void>? onLoad() {
    scoreTextComponent = TextComponent(
      text: 'Score: 0',
      position: Vector2.all(10),
    );
    add(scoreTextComponent);

    healthTextComponent = TextComponent(
      text: 'x3',
      anchor: Anchor.topRight,
      position: Vector2(gameRef.size.x - 10, 10),
    );
    add(healthTextComponent);

    final playerSprite = SpriteComponent.fromImage(
      gameRef.spriteSheet,
      srcPosition: Vector2.zero(),
      srcSize: Vector2.all(32),
      anchor: Anchor.topRight,
      position: Vector2(
          healthTextComponent.position.x - healthTextComponent.size.x - 3, 3),
    );
    add(playerSprite);

    gameRef.playerData.score.addListener(onScoreChange);
    gameRef.playerData.health.addListener(onHealthChange);

    final pauseButton = SpriteButtonComponent(
      onPressed: () {
        // AudioManager.pauseBgm();
        gameRef.pauseEngine();
        gameRef.overlays.add(PauseMenu.id);
      },
      button: Sprite(
        gameRef.spriteSheet,
        srcSize: Vector2.all(32),
        srcPosition: Vector2(32 * 4, 0),
      ),
      size: Vector2.all(32),
      anchor: Anchor.topCenter,
      position: Vector2(gameRef.size.x / 2, 5),
    )..positionType = PositionType.viewport;
    add(pauseButton);

    return super.onLoad();
  }

  @override
  void onRemove() {
    gameRef.playerData.score.removeListener(onScoreChange);
    gameRef.playerData.health.removeListener(onHealthChange);
    super.onRemove();
  }

  void onScoreChange() {
    scoreTextComponent.text = 'Score: ${gameRef.playerData.score.value}';
  }

  void onHealthChange() {
    healthTextComponent.text = 'x${gameRef.playerData.health.value}';

    if (gameRef.playerData.health.value == 0) {
      AudioManager.stopBgm();
      gameRef.pauseEngine();
      gameRef.overlays.add(GameOver.id);
    }
  }
}
