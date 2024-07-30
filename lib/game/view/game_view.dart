import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:EduGAIte/audio/audio.dart';
import 'package:EduGAIte/game/game.dart';
import 'package:EduGAIte/game/bloc/navigation_bloc.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  static PageRoute<void> route() {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => const GameScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final gameBloc = context.read<GameBloc>();
    gameBloc.add(GameSectionCompleted(sectionCount: 1)); // Increment level here

    return Scaffold(
      body: MultiProvider(
        providers: [
          BlocProvider.value(value: gameBloc),
          BlocProvider.value(value: context.read<NavigationBloc>()),
        ],
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
            navigationBloc: context.read<NavigationBloc>(),
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
