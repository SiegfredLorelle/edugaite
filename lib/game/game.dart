import 'package:flame/game.dart';
import 'player.dart';
import 'obstacle.dart';

class EndlessRunnerGame extends FlameGame {
  late Player _player;
  late List<Obstacle> _obstacles;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _player = Player();
    await add(_player);

    _obstacles = [];
    // Add initial obstacles
    addObstacle();
  }

  void addObstacle() {
    final obstacle = Obstacle();
    add(obstacle);
    _obstacles.add(obstacle);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Update game logic here
  }
}
