import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toa/Controllers/game_controller.dart';
import 'package:tic_tac_toa/models/game_model.dart';
import 'package:tic_tac_toa/utils/colors.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final GameController controller = Get.find();

    return Obx(() => Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildScoreItem(
                  'X',
                  controller.game.value.playerXScore,
                  AppColors.playerX,
                  controller.game.value.gameMode == GameMode.singlePlayer
                      ? 'You'
                      : 'Player X',
                ),
                _buildScoreItem(
                  'Draw',
                  controller.game.value.drawCount,
                  AppColors.neutral,
                  'Draw',
                ),
                _buildScoreItem(
                  'O',
                  controller.game.value.playerOScore,
                  AppColors.playerO,
                  controller.game.value.gameMode == GameMode.singlePlayer
                      ? 'AI'
                      : 'Player O',
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildScoreItem(String symbol, int score, Color color, String label) {
    return Column(
      children: [
        Text(
          symbol,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          score.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
