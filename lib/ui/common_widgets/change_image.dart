import 'package:demopuzzle/ui/screens/home_controller.dart';
import 'package:get/get.dart';

changeImage({required int value, required HomeController controller}) {
  controller.imagePieces = null;
  controller.moves = 0.obs;
  controller.time = 0.obs;
  controller.startGame=false;
  controller.timer?.cancel();
  controller.update();
  Future.delayed(const Duration(milliseconds: 300)).then((v) {
    controller.loadImage(image: controller.puzzleListView[value].image).then(
          (image) async {
        controller.imagePieces = await controller.splitImage(image);
        controller.update();

        controller.shufflePuzzle();
      },
    );
  });
}