import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:leap/leap.dart';
import 'package:pathxp/pathxp.dart';
import 'package:EduGAIte/game/game.dart';

enum EnemyType {
  bettle,
  butterfly,
  grasshopper,
  bee,
  ant,
  firefly,
  unknown;

  static EnemyType fromValue(String value) {
    switch (value) {
      case 'Butterfly':
        return EnemyType.butterfly;
      case 'Beetle':
        return EnemyType.bettle;
      case 'Bee':
        return EnemyType.bee;
      case 'Grasshopper':
        return EnemyType.grasshopper;
      case 'Firefly':
        return EnemyType.firefly;
      case 'Ant':
        return EnemyType.ant;
      default:
        return EnemyType.unknown;
    }
  }
}

class Enemy extends PhysicalEntity<SuperDashGame> {
  Enemy({
    required this.tiledObject,
    this.enemyDamage = 1,
  })  : type = EnemyType.fromValue(
          (tiledObject.properties.byName['Type'] as StringProperty?)?.value ??
              '',
        ),
        super(
          // Remove collisionType if it's not defined
          static: tiledObject.properties.byName['Fly']?.value as bool? ?? false,
        );

  final int enemyDamage;
  final EnemyType type;
  final TiledObject tiledObject;

  @override
  int get priority => 1;

  @override
  Future<void> onLoad() async {
    size = Vector2.all(gameRef.tileSize * .5);
    position = Vector2(tiledObject.x, tiledObject.y);

    final path =
        (tiledObject.properties.byName['Path'] as StringProperty?)?.value;

    if (path != null) {
      final pathXp = Pathxp(path);
      add(FollowPathBehavior(pathXp));
    }

    final spritePosition = size / 2 - Vector2(0, size.y / 2);

    switch (type) {
      case EnemyType.bettle:
        final bettleAnimation = await gameRef.loadSpriteAnimation(
          'anim/spritesheet_enemy_beetle.png',
          SpriteAnimationData.sequenced(
            amount: 16,
            amountPerRow: 8,
            textureSize: Vector2.all(64),
            stepTime: .04,
          ),
        );
        add(
          SpriteAnimationComponent(
            size: Vector2.all(gameRef.tileSize),
            animation: bettleAnimation,
            anchor: Anchor.center,
            position: spritePosition,
          ),
        );
        break;
      case EnemyType.bee:
        final beeAnimation = await gameRef.loadSpriteAnimation(
          'anim/spritesheet_enemy_bee.png',
          SpriteAnimationData.sequenced(
            amount: 14,
            amountPerRow: 7,
            textureSize: Vector2.all(64),
            stepTime: .04,
          ),
        );
        add(
          SpriteAnimationComponent(
            size: Vector2.all(gameRef.tileSize),
            animation: beeAnimation,
            anchor: Anchor.center,
            position: spritePosition,
          ),
        );
        break;
      case EnemyType.butterfly:
        final butterflyAnimation = await gameRef.loadSpriteAnimation(
          'anim/spritesheet_enemy_butterfly.png',
          SpriteAnimationData.sequenced(
            amount: 16,
            amountPerRow: 8,
            textureSize: Vector2.all(64),
            stepTime: .04,
          ),
        );
        add(
          SpriteAnimationComponent(
            size: Vector2.all(gameRef.tileSize),
            animation: butterflyAnimation,
            anchor: Anchor.center,
            position: spritePosition,
          ),
        );
        break;
      case EnemyType.grasshopper:
        final grasshopperAnimation = await gameRef.loadSpriteAnimation(
          'anim/spritesheet_enemy_grasshopper.png',
          SpriteAnimationData.sequenced(
            amount: 22,
            amountPerRow: 11,
            textureSize: Vector2.all(64),
            stepTime: .04,
          ),
        );
        add(
          SpriteAnimationComponent(
            size: Vector2.all(gameRef.tileSize),
            animation: grasshopperAnimation,
            anchor: Anchor.center,
            position: spritePosition,
          ),
        );
        break;
      case EnemyType.ant:
        final antAnimation = await gameRef.loadSpriteAnimation(
          'anim/spritesheet_enemy_ant.png',
          SpriteAnimationData.sequenced(
            amount: 12,
            amountPerRow: 6,
            textureSize: Vector2.all(64),
            stepTime: .04,
          ),
        );
        add(
          SpriteAnimationComponent(
            size: Vector2.all(gameRef.tileSize),
            animation: antAnimation,
            anchor: Anchor.center,
            position: spritePosition,
          ),
        );
        break;
      case EnemyType.firefly:
        final fireflyAnimation = await gameRef.loadSpriteAnimation(
          'anim/spritesheet_enemy_dragonfly.png',
          SpriteAnimationData.sequenced(
            amount: 32,
            amountPerRow: 8,
            textureSize: Vector2.all(64),
            stepTime: .04,
          ),
        );
        add(
          SpriteAnimationComponent(
            size: Vector2.all(gameRef.tileSize),
            animation: fireflyAnimation,
            anchor: Anchor.center,
            position: spritePosition,
          ),
        );
        break;
      default:
        add(
          RectangleComponent(
            size: Vector2.all(gameRef.tileSize),
            paint: Paint()..color = Colors.pink,
            anchor: Anchor.center,
            position: spritePosition,
          ),
        );
        break;
    }

    return super.onLoad();
  }
}
