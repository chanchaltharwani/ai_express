import 'package:ai_express/helper/my_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TranslateController extends GetxController {
  final textC = TextEditingController();
  final resultC = TextEditingController();

  final from = ''.obs;
  final to = ''.obs;

  Future<void> askQuestions() async {
    if (textC.text.trim().isNotEmpty) {
      // final res = await Apis.getAnswer(textC.text);

      textC.text = "";
    } else {
      MyDialog.info("Ask Something");
    }
  }
}
