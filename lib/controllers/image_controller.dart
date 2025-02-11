import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class ImageController extends GetxController {
  final textC = TextEditingController();

  Future<void> askQuestions() async {

    if(textC.text.trim().isNotEmpty){

      textC.text = "";
    }

  }




}
