import 'package:demopuzzle/infrastructure/cosntant/color_constant.dart';
import 'package:demopuzzle/infrastructure/models/puzzle_list_model.dart';
import 'package:demopuzzle/ui/common_widgets/change_image.dart';
import 'package:demopuzzle/ui/common_widgets/common_inkwell.dart';
import 'package:demopuzzle/ui/screens/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopRowListView extends StatelessWidget {
  const TopRowListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                controller.puzzleListView.length,
                (index) {
                  PuzzleListModel puzzleData = controller.puzzleListView[index];
                  return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: CommonInkwell(
                        onTap: () {
                          controller.pageIndex.value = index;
                          controller.update();
                          changeImage(value: index, controller: controller);
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              puzzleData.image,
                              height: 50,
                              width: 50,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              puzzleData.puzzleName,
                              style: TextStyle(fontWeight: FontWeight.w500, color: ColorConstant.black, fontSize: 18),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              height: 8,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              width: 30,
                              decoration: BoxDecoration(
                                  color: controller.pageIndex.value == index ? ColorConstant.black : ColorConstant.grey,
                                  borderRadius: BorderRadius.circular(10)),
                            )
                          ],
                        ),
                      ));
                },
              ));
        });
  }
}
