// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toa/models/game_model.dart';
import 'package:tic_tac_toa/utils/colors.dart';

class GameCell extends StatelessWidget {
  final int index;
  final Player player;
  final VoidCallback onTap;

  const GameCell({
    super.key,
    required this.index,
    required this.player,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? AppColors.surface : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Get.isDarkMode ? AppColors.neutral : Colors.grey[300]!,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              _getSymbol(),
              key: ValueKey(player),
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: _getColor(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getSymbol() {
    switch (player) {
      case Player.x:
        return 'X';
      case Player.o:
        return 'O';
      case Player.none:
        return '';
    }
  }

  Color _getColor() {
    switch (player) {
      case Player.x:
        return AppColors.playerX;
      case Player.o:
        return AppColors.playerO;
      case Player.none:
        return Colors.transparent;
    }
  }
}
