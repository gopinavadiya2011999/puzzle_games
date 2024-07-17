import 'package:demopuzzle/infrastructure/cosntant/color_constant.dart';
import 'package:demopuzzle/ui/screens/home_controller.dart';
import 'package:demopuzzle/ui/screens/widgets/bottom_buttons_view.dart';
import 'package:demopuzzle/ui/screens/widgets/middle_page_view.dart';
import 'package:demopuzzle/ui/screens/widgets/top_row_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Puzzle Game',
                style: TextStyle(fontWeight: FontWeight.w700, color: ColorConstant.black),
              ),
            ),
            body: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TopRowListView(),
                SizedBox(height: 20),
                MiddlePageView(),
                BottomButtonsView()
              ],
            ),
          );
        });
  }


}
