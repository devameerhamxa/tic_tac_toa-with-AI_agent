import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toa/Controllers/game_controller.dart';
import 'package:tic_tac_toa/views/widgets/game_cell.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final GameController controller = Get.find();

    return Container(
      padding: const EdgeInsets.all(16),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Obx(() {
          final board = controller.game.value.board;

          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return GameCell(
                index: index,
                player: board[index], // Use the local variable
                onTap: () => controller.makeMove(index),
              );
            },
          );
        }),
      ),
    );
  }
}
