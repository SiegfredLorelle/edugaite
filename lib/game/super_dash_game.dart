import 'dart:async';
import 'dart:ui' as ui;

import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/sprite.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leap/leap.dart';
import 'package:EduGAIte/audio/audio.dart';
import 'package:EduGAIte/game/game.dart';

Paint _layerPaintFactory(double opacity) {
  return Paint()
    ..color = Color.fromRGBO(255, 255, 255, opacity)
    ..isAntiAlias = false;
}

class SuperDashGame extends LeapGame
    with TapDetector, HasKeyboardHandlerComponents {
  SuperDashGame({
    required this.gameBloc,
    required this.audioController,
    this.customBundle,
    this.inMapTester = false,
  }) : super(
          tileSize: 64,
          configuration: const LeapConfiguration(
            tiled: TiledOptions(),
          ),
        );

  static final _cameraViewport = Vector2(592, 1024);
  static const prefix = 'assets/map/';
  static const _sections = [
    'flutter_runnergame_map_A.tmx',
    'flutter_runnergame_map_B.tmx',
    'flutter_runnergame_map_C.tmx',
  ];
  static const _sectionsBackgroundColor = [
    (Color(0xFFDADEF6), Color(0xFFEAF0E3)),
    (Color(0xFFEBD6E1), Color(0xFFC9C8E9)),
    (Color(0xFF002052), Color(0xFF0055B4)),
  ];

  final GameBloc gameBloc;
  final AssetBundle? customBundle;
  final AudioController audioController;
  final List<VoidCallback> _inputListener = [];

  late final SpriteSheet itemsSpritesheet;
  final bool inMapTester;

  GameState get state => gameBloc.state;

  Player? get player => world.firstChild<Player>();

  List<Tileset> get tilesets => leapMap.tiledMap.tileMap.map.tilesets;

  Tileset get itemsTileset {
    return tilesets.firstWhere(
      (tileset) => tileset.name == 'tile_items_v2',
    );
  }

  Tileset get enemiesTileset {
    return tilesets.firstWhere(
      (tileset) => tileset.name == 'tile_enemies_v2',
    );
  }

  void addInputListener(VoidCallback listener) {
    _inputListener.add(listener);
  }

  void removeInputListener(VoidCallback listener) {
    _inputListener.remove(listener);
  }

  void _triggerInputListeners() {
    for (final listener in _inputListener) {
      listener();
    }
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);

    _triggerInputListeners();
    overlays.remove('tapToJump');
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    if (kIsWeb && audioController.isMusicEnabled) {
      audioController.startMusic();
    }

    camera = CameraComponent.withFixedResolution(
      width: _cameraViewport.x,
      height: _cameraViewport.y,
    )..world = world;

    images = Images(
      prefix: prefix,
      bundle: customBundle,
    );

    itemsSpritesheet = SpriteSheet(
      image: await images.load('objects/tile_items_v2.png'),
      srcSize: Vector2.all(tileSize),
    );
    await loadWorldAndMap(
      images: images,
      prefix: prefix,
      bundle: customBundle,
      tiledMapPath: _sections.first,
    );
    _setSectionBackground();

    final player = Player(
      levelSize: leapMap.tiledMap.size.clone(),
      cameraViewport: _cameraViewport,
    );
    unawaited(
      world.addAll([player]),
    );

    await _addSpawners();
    _addTreeHouseFrontLayer();
    _addTreeHouseSign();

    add(
      KeyboardListenerComponent(
        keyDown: {
          LogicalKeyboardKey.space: (_) {
            _triggerInputListeners();
            overlays.remove('tapToJump');
            return false;
          },
        },
        keyUp: {
          LogicalKeyboardKey.space: (_) {
            return false;
          },
        },
      ),
    );
  }

  void _addTreeHouseSign() {
    world.add(
      TreeSign(
        position: Vector2(
          448,
          1862,
        ),
      ),
    );
  }

  void _addTreeHouseFrontLayer() {
    final layer = leapMap.tiledMap.tileMap.renderableLayers.last;
    world.add(TreeHouseFront(renderFront: layer.render));
  }

  void _setSectionBackground() {
    final colors = _sectionsBackgroundColor[state.currentSection];
    camera.backdrop = RectangleComponent(
      size: size.clone(),
      paint: Paint()
        ..shader = ui.Gradient.linear(
          Offset.zero,
          Offset(size.x, size.y),
          [
            colors.$1,
            colors.$2,
          ],
        ),
    );
  }

  void gameOver() {
    gameBloc.add(const GameOver());

    world.firstChild<Player>()?.removeFromParent();

    _resetEntities();

    Future<void>.delayed(
      const Duration(seconds: 1),
      () async {
        await loadWorldAndMap(
          images: images,
          prefix: prefix,
          bundle: customBundle,
          tiledMapPath: _sections.first,
        );
        if (isLastSection || isFirstSection) {
          _addTreeHouseFrontLayer();
        }

        if (isFirstSection) {
          _addTreeHouseSign();
        }
        final newPlayer = Player(
          levelSize: leapMap.tiledMap.size.clone(),
          cameraViewport: _cameraViewport,
        );
        await world.add(newPlayer);

        await newPlayer.mounted;
        await _addSpawners();
        overlays.add('tapToJump');
      },
    );
  }

  void _resetEntities() {
    children.whereType<ObjectGroupProximityBuilder<Player>>().forEach(
          (spawner) => spawner.removeFromParent(),
        );
    world.firstChild<TreeHouseFront>()?.removeFromParent();
    world.firstChild<TreeSign>()?.removeFromParent();

    leapMap.children
        .whereType<Enemy>()
        .forEach((enemy) => enemy.removeFromParent());
    leapMap.children
        .whereType<Item>()
        .forEach((enemy) => enemy.removeFromParent());
  }

  Future<void> _addSpawners() async {
    await addAll([
      ObjectGroupProximityBuilder<Player>(
        proximity: _cameraViewport.x * 1.5,
        tileLayerName: 'items',
        tileset: itemsTileset,
        componentBuilder: Item.new,
      ),
      ObjectGroupProximityBuilder<Player>(
        proximity: _cameraViewport.x * 1.5,
        tileLayerName: 'enemies',
        tileset: enemiesTileset,
        componentBuilder: Enemy.new,
      ),
    ]);
  }

  Future<void> _loadNewSection() async {
    final nextSectionIndex = state.currentSection + 1 < _sections.length
        ? state.currentSection + 1
        : 0;

    final nextSection = _sections[nextSectionIndex];

    _resetEntities();

    await loadWorldAndMap(
      images: images,
      prefix: prefix,
      bundle: customBundle,
      tiledMapPath: nextSection,
    );

    if (isFirstSection) {
      _addTreeHouseSign();
    }

    if (isLastSection || isFirstSection) {
      _addTreeHouseFrontLayer();
    }

    await _addSpawners();
  }

  @override
  void onMapUnload(LeapMap map) {
    player?.velocity.setZero();
  }

  @override
  void onMapLoaded(LeapMap map) {
    player?.loadSpawnPoint();
    player?.loadRespawnPoints();
    player?.walking = true;
    player?.spritePaintColor(Colors.white);
    player?.isPlayerTeleporting = false;

    _setSectionBackground();
  }

  void sectionCleared() {
    if (isLastSection) {
      player?.spritePaintColor(Colors.transparent);
      player?.walking = false;
    }

    _loadNewSection();

    gameBloc.add(GameSectionCompleted(sectionCount: _sections.length));
  }

  bool get isLastSection => state.currentSection == _sections.length - 1;
  bool get isFirstSection => state.currentSection == 0;
}
