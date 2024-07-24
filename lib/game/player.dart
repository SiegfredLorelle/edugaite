import 'package:flame/components.dart';
import 'package:flame/game.dart';

class Player extends SpriteComponent with HasGameRef<FlameGame> {
  Player();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('game/player.png');
    size = Vector2(50, 100);
    position = Vector2(100, gameRef.size.y - size.y - 50);
  }

}
