import 'package:demopuzzle/infrastructure/cosntant/color_constant.dart';
import 'package:demopuzzle/ui/common_widgets/change_image.dart';
import 'package:demopuzzle/ui/screens/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiddlePageView extends StatelessWidget {
  const MiddlePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
         init: HomeController(),
        builder: (controller) => Expanded(
        child: PageView.builder(
          controller: controller.pageController,
          onPageChanged: (value) {
            controller.pageIndex.value = value;
            controller.update();
            changeImage(value: value,controller: controller);
          },
          itemCount: controller.puzzleListView.length,
          itemBuilder: (context, index) {
            return controller.imagePieces == null
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => controller.moveTile(index),
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      image: controller.tiles[index] == 15
                          ? null
                          : DecorationImage(
                        image: controller.imagePieces![controller.tiles[index]].image,
                        fit: BoxFit.cover,
                      ),
                      color: controller.tiles[index] == 15 ? ColorConstant.white.withOpacity(0.2) : null,
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                );
              },
              itemCount: controller.tiles.length,
            );
          },
        )));
  }
}
