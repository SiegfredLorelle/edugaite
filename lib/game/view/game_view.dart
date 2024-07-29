import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:EduGAIte/audio/audio.dart';
import 'package:EduGAIte/game/game.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  static PageRoute<void> route() {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => const GameScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: context.read<GameBloc>(),
        child: const GameView(),
      ),
    );
  }
}

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GameWidget.controlled(
          loadingBuilder: (context) =>
              const Center(child: CircularProgressIndicator()),
          backgroundBuilder: (context) => const SizedBox.shrink(),
          gameFactory: () => EdugaiteGame(
            gameBloc: context.read<GameBloc>(),
            audioController: context.read<AudioController>(),
          ),
          overlayBuilderMap: {
            'tapToJump': (context, game) => const TapToJumpOverlay(),
          },
          initialActiveOverlays: const ['tapToJump'],
        ),
      ],
    );
  }
}
