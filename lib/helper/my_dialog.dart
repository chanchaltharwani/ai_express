import 'package:ai_express/features/custome_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialog {
      //info
  static void info(String msg) {
    Get.snackbar('Info', msg,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue.withOpacity(.8),
        colorText: Colors.white);
  }
     //succes
  static void success(String msg) {
    Get.snackbar('Success', msg,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(.8),
        colorText: Colors.white);
  }

//error
  static void error(String msg) {
    Get.snackbar('Error', msg,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(.8),
        colorText: Colors.white);
  }

  //loading dialog
    static void showLoadingDialog(){
    Get.dialog(const Center(child: CustomeLoading()));
    }
}
