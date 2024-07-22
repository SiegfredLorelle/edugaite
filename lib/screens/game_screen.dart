import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import '../game/game.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: GameWidget(game: EndlessRunnerGame()),
        ),
      ),
    );
  }
}
