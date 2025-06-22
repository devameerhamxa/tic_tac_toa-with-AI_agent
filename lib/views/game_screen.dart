import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toa/Controllers/game_controller.dart';
import 'package:tic_tac_toa/Controllers/theme_controller.dart';
import 'package:tic_tac_toa/views/widgets/game_board.dart';
import 'package:tic_tac_toa/views/widgets/score_board.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GameController controller = Get.find();
    final ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        actions: [
          Obx(() => IconButton(
                onPressed: themeController.toggleTheme,
                icon: Icon(
                  themeController.isDarkMode.value
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
              )),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'reset_round') {
                controller.resetRound();
              } else if (value == 'reset_game') {
                controller.resetGame();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'reset_round',
                child: Text('Reset Round'),
              ),
              const PopupMenuItem(
                value: 'reset_game',
                child: Text('Reset Game'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const ScoreBoard(),
          const SizedBox(height: 16),
          Obx(() => Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (controller.isAnimating.value)
                        const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      if (controller.isAnimating.value)
                        const SizedBox(width: 12),
                      Text(
                        controller.getCurrentPlayerName(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          const Expanded(
            child: GameBoard(),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: controller.resetRound,
                    child: const Text('New Round'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(),
                    child: const Text('Main Menu'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
