part of 'game_bloc.dart';

class GameState extends Equatable {
  const GameState({
    required this.currentLevel,
    required this.currentSection,
  });

  const GameState.initial()
      : currentLevel = 1,
        currentSection = 0;

  final int currentLevel;
  final int currentSection;

  GameState copyWith({
    int? currentLevel,
    int? currentSection,
  }) {
    return GameState(
      currentLevel: currentLevel ?? this.currentLevel,
      currentSection: currentSection ?? this.currentSection,
    );
  }

  @override
  List<Object?> get props => [currentLevel, currentSection];
}
