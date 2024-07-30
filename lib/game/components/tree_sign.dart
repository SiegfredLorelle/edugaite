import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/text.dart';
import 'package:EduGAIte/game/edugaite_game.dart';

class TreeSign extends TextComponent with HasGameRef<EdugaiteGame> {
  TreeSign({
    super.position,
  }) : super(
          textRenderer: TextPaint(
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 24,
              fontFamily: 'Google Sans',
            ),
          ),
        );

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    // Move text lower and to the left by adjusting the position
    position =
        Vector2(position.x - 50, position.y + 8); // Adjust the values as needed

    final currentLevel = gameRef.state.currentLevel;
    text = 'LEVEL $currentLevel';
  }
}
