import 'package:flame/components.dart';
import 'package:flame/game.dart';

class Obstacle extends SpriteComponent with HasGameRef<FlameGame> {
  Obstacle();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('game/obstacle.png');
    size = Vector2(50, 50);
    position = Vector2(gameRef.size.x, gameRef.size.y - size.y - 50);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Update obstacle logic here
    position.x -= 200 * dt; // Move obstacle to the left

    if (position.x < -size.x) {
      removeFromParent();
    }
  }
}
