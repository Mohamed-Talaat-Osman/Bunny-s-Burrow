import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/image_composition.dart';
import 'package:flutter/animation.dart';

import '../game.dart';
import 'player.dart';

class Coin extends SpriteComponent
    with CollisionCallbacks, HasGameRef<BunnyBurrow> {
  Coin(
      Image image, {
        Vector2? position,
        Vector2? size,
        Vector2? scale,
        double? angle,
        Anchor? anchor,
        int? priority,
      }) : super.fromImage(
    image,
    srcPosition: Vector2(3 * 32, 0),
    srcSize: Vector2.all(32),
    position: position,
    size: size,
    scale: scale,
    angle: angle,
    anchor: anchor,
    priority: priority,
  );

  @override
  Future<void>? onLoad() {
    add(CircleHitbox()..collisionType = CollisionType.passive);

    add(
      MoveEffect.by(
        Vector2(0, -4),
        EffectController(
          alternate: true,
          infinite: true,
          duration: 1,
          curve: Curves.ease,
        ),
      ),
    );

    return super.onLoad();
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player) {

      add(
        OpacityEffect.fadeOut(
          LinearEffectController(0.3),
          onComplete: () {
            add(RemoveEffect());
          },
        ),
      );

      gameRef.playerData.score.value += 1;
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
