enum GameMode { singlePlayer, twoPlayer }

enum Player { x, o, none }

enum GameState { playing, won, draw }

class GameModel {
  List<Player> board;
  Player currentPlayer;
  GameMode gameMode;
  GameState gameState;
  Player winner;
  int playerXScore;
  int playerOScore;
  int drawCount;

  GameModel({
    required this.board,
    required this.currentPlayer,
    required this.gameMode,
    required this.gameState,
    required this.winner,
    required this.playerXScore,
    required this.playerOScore,
    required this.drawCount,
  });

  factory GameModel.initial() {
    return GameModel(
      board: List.filled(9, Player.none),
      currentPlayer: Player.x,
      gameMode: GameMode.singlePlayer,
      gameState: GameState.playing,
      winner: Player.none,
      playerXScore: 0,
      playerOScore: 0,
      drawCount: 0,
    );
  }

  GameModel copyWith({
    List<Player>? board,
    Player? currentPlayer,
    GameMode? gameMode,
    GameState? gameState,
    Player? winner,
    int? playerXScore,
    int? playerOScore,
    int? drawCount,
  }) {
    return GameModel(
      board: board ?? this.board,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      gameMode: gameMode ?? this.gameMode,
      gameState: gameState ?? this.gameState,
      winner: winner ?? this.winner,
      playerXScore: playerXScore ?? this.playerXScore,
      playerOScore: playerOScore ?? this.playerOScore,
      drawCount: drawCount ?? this.drawCount,
    );
  }
}
