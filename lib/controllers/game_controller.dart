import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toa/models/game_model.dart';
import 'package:tic_tac_toa/utils/ai_engine.dart';
import 'package:tic_tac_toa/utils/constants.dart';

class GameController extends GetxController {
  var game = GameModel.initial().obs;
  var isAnimating = false.obs;

  void setGameMode(GameMode mode) {
    game.value = game.value.copyWith(gameMode: mode);
    resetGame();
  }

  void makeMove(int index) {
    if (game.value.board[index] != Player.none ||
        game.value.gameState != GameState.playing ||
        isAnimating.value) {
      return;
    }

    // Make player move
    var newBoard = List<Player>.from(game.value.board);
    newBoard[index] = game.value.currentPlayer;

    game.value = game.value.copyWith(board: newBoard);

    // Check game state
    _checkGameState();

    // If game is still playing and it's single player mode, make AI move
    if (game.value.gameState == GameState.playing &&
        game.value.gameMode == GameMode.singlePlayer &&
        game.value.currentPlayer == Player.o) {
      _makeAIMove();
    }
  }

  void _makeAIMove() {
    isAnimating.value = true;

    Future.delayed(GameConstants.aiDelay, () {
      int aiMove = AIEngine.getBestMove(game.value.board);

      if (aiMove != -1) {
        var newBoard = List<Player>.from(game.value.board);
        newBoard[aiMove] = Player.o;
        game.value = game.value.copyWith(board: newBoard);
        _checkGameState();
      }

      isAnimating.value = false;
    });
  }

  void _checkGameState() {
    Player winner = _checkWinner();

    if (winner != Player.none) {
      game.value = game.value.copyWith(
        gameState: GameState.won,
        winner: winner,
      );
      _updateScore(winner);
      _showGameOverDialog();
    } else if (_isBoardFull()) {
      game.value = game.value.copyWith(
        gameState: GameState.draw,
        drawCount: game.value.drawCount + 1,
      );
      _showGameOverDialog();
    } else {
      // Switch player
      Player nextPlayer =
          game.value.currentPlayer == Player.x ? Player.o : Player.x;
      game.value = game.value.copyWith(currentPlayer: nextPlayer);
    }
  }

  Player _checkWinner() {
    List<Player> board = game.value.board;

    // Check rows
    for (int i = 0; i < 3; i++) {
      if (board[i * 3] != Player.none &&
          board[i * 3] == board[i * 3 + 1] &&
          board[i * 3] == board[i * 3 + 2]) {
        return board[i * 3];
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (board[i] != Player.none &&
          board[i] == board[i + 3] &&
          board[i] == board[i + 6]) {
        return board[i];
      }
    }

    // Check diagonals
    if (board[0] != Player.none &&
        board[0] == board[4] &&
        board[0] == board[8]) {
      return board[0];
    }

    if (board[2] != Player.none &&
        board[2] == board[4] &&
        board[2] == board[6]) {
      return board[2];
    }

    return Player.none;
  }

  bool _isBoardFull() {
    return !game.value.board.contains(Player.none);
  }

  void _updateScore(Player winner) {
    if (winner == Player.x) {
      game.value =
          game.value.copyWith(playerXScore: game.value.playerXScore + 1);
    } else if (winner == Player.o) {
      game.value =
          game.value.copyWith(playerOScore: game.value.playerOScore + 1);
    }
  }

  void _showGameOverDialog() {
    String title;
    String message;

    if (game.value.gameState == GameState.won) {
      if (game.value.gameMode == GameMode.singlePlayer) {
        title = game.value.winner == Player.x ? '🎉 You Won!' : '🤖 AI Won!';
        message = game.value.winner == Player.x
            ? 'Congratulations!'
            : 'Better luck next time!';
      } else {
        title = '🎉 Player ${game.value.winner == Player.x ? 'X' : 'O'} Won!';
        message = 'Congratulations to the winner!';
      }
    } else {
      title = '🤝 It\'s a Draw!';
      message = 'Good game!';
    }

    Get.dialog(
      AlertDialog(
        title: Text(title, textAlign: TextAlign.center),
        content: Text(message, textAlign: TextAlign.center),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              resetRound();
            },
            child: const Text('Play Again'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.back();
            },
            child: const Text('Main Menu'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  void resetRound() {
    game.value = game.value.copyWith(
      board: List.filled(9, Player.none),
      currentPlayer: Player.x,
      gameState: GameState.playing,
      winner: Player.none,
    );
  }

  void resetGame() {
    game.value = GameModel.initial().copyWith(gameMode: game.value.gameMode);
  }

  String getPlayerSymbol(Player player) {
    switch (player) {
      case Player.x:
        return 'X';
      case Player.o:
        return 'O';
      case Player.none:
        return '';
    }
  }

  String getCurrentPlayerName() {
    if (game.value.gameMode == GameMode.singlePlayer) {
      return game.value.currentPlayer == Player.x ? 'Your Turn' : 'AI Turn';
    } else {
      return 'Player ${getPlayerSymbol(game.value.currentPlayer)}';
    }
  }
}
