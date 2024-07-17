import 'package:demopuzzle/infrastructure/cosntant/color_constant.dart';
import 'package:demopuzzle/ui/screens/home_controller.dart';
import 'package:demopuzzle/ui/screens/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomButtonsView extends GetView<HomeController> {
  const BottomButtonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Moves: ${controller.moves}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 1,
                    color: ColorConstant.black,
                  ),
                  const SizedBox(width: 10),
                  Obx(
                    () => Text(
                      'Time: ${controller.time}s',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onTap: () {
                    controller.startGame=true;
                    controller.update();
                    controller.resetGame();
                  },
                  text: 'Start / Restart',
                ),
                const SizedBox(width: 10),
                CustomButton(
                  onTap: () {

                    controller.stopTimer();
                  },
                  text: 'Stop',
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (controller.startGame && (controller.isSolved() ||controller.gameOverText!=null) )
               Text(
              controller.gameOverText??  'Puzzle Solved!',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
