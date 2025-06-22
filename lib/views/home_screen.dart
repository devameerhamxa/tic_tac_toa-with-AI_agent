import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toa/Controllers/game_controller.dart';
import 'package:tic_tac_toa/Controllers/theme_controller.dart';
import 'package:tic_tac_toa/models/game_model.dart';
import 'package:tic_tac_toa/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text(GameConstants.appName),
        actions: [
          Obx(() => IconButton(
                onPressed: themeController.toggleTheme,
                icon: Icon(
                  themeController.isDarkMode.value
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
              )),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.games,
                size: 120,
                color: Colors.purple,
              ),
              const SizedBox(height: 32),
              const Text(
                'Tic Tac Toe',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Choose your game mode',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _startGame(GameMode.singlePlayer),
                  icon: const Icon(Icons.smart_toy),
                  label: const Text('Player vs AI'),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _startGame(GameMode.twoPlayer),
                  icon: const Icon(Icons.people),
                  label: const Text('Two Players'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startGame(GameMode mode) {
    Get.put(GameController());
    final GameController controller = Get.find();
    controller.setGameMode(mode);
    Get.toNamed('/game');
  }
}
