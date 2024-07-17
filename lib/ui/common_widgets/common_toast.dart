import 'package:demopuzzle/infrastructure/cosntant/color_constant.dart';
import 'package:fluttertoast/fluttertoast.dart';

showTopToast({required String msg}){
  Fluttertoast.showToast(
    msg:msg,
    fontSize: 16,
    backgroundColor: ColorConstant.black,
    textColor: ColorConstant.white,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
  );
}