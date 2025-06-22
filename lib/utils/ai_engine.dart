import 'dart:math';

import 'package:tic_tac_toa/models/game_model.dart';

class AIEngine {
  static int getBestMove(List<Player> board) {
    // First, try to win
    for (int i = 0; i < 9; i++) {
      if (board[i] == Player.none) {
        board[i] = Player.o;
        if (_checkWinner(board) == Player.o) {
          board[i] = Player.none;
          return i;
        }
        board[i] = Player.none;
      }
    }

    // Second, try to block player
    for (int i = 0; i < 9; i++) {
      if (board[i] == Player.none) {
        board[i] = Player.x;
        if (_checkWinner(board) == Player.x) {
          board[i] = Player.none;
          return i;
        }
        board[i] = Player.none;
      }
    }

    // Take center if available
    if (board[4] == Player.none) {
      return 4;
    }

    // Take corners
    List<int> corners = [0, 2, 6, 8];
    corners.shuffle();
    for (int corner in corners) {
      if (board[corner] == Player.none) {
        return corner;
      }
    }

    // Take any available spot
    List<int> available = [];
    for (int i = 0; i < 9; i++) {
      if (board[i] == Player.none) {
        available.add(i);
      }
    }

    if (available.isNotEmpty) {
      return available[Random().nextInt(available.length)];
    }

    return -1;
  }

  static Player _checkWinner(List<Player> board) {
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
}
