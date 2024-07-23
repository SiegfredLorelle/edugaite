import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import '../game/game.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

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
