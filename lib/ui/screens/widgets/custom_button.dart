import 'package:demopuzzle/infrastructure/cosntant/color_constant.dart';
import 'package:demopuzzle/ui/common_widgets/common_inkwell.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.text});

   final GestureTapCallback onTap;
   final String text;
  @override
  Widget build(BuildContext context) {
    return CommonInkwell(
        onTap:onTap,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            decoration: BoxDecoration(

                color: ColorConstant.black,
                borderRadius: BorderRadius.circular(8)
            ),
            child:  Text(text,style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500
            ),)));
  }
}
