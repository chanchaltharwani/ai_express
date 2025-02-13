import 'package:ai_express/helper/global.dart';
import 'package:ai_express/helper/my_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver_updated/gallery_saver.dart';
import 'package:get/get.dart';
import '../apis/apis.dart';

// Loading status enum
enum Status { none, loading, complete }

class ImageController extends GetxController {
  final textC = TextEditingController();
  final status = Status.none.obs;
  final url = ''.obs;
  final imageList = <String>[].obs;

  Future<void> searchAiImage() async {
    String userInput = textC.text.trim();
    print("User Input: '$userInput'"); // 🔹 Debugging ke liye print karo

    if (userInput.isNotEmpty) {
      status.value = Status.loading;

      // ✅ Pexels API se images fetch kar rahe hain
      imageList.value = await Apis.searchImages(userInput);
      print("API Response: $imageList"); // 🔹 API response print karo

      if (imageList.isEmpty) {
        MyDialog.error('No images found. Try a different keyword!');
        status.value = Status.none;
        return;
      }

      // ✅ Pehli image ka URL select karo
      url.value = imageList.first;
      print("Selected Image URL: ${url.value}"); // 🔹 Debugging ke liye

      status.value = Status.complete;
    } else {
      MyDialog.info('Provide some beautiful image description');
    }
  }

  //
  void downloadImage() async {
    try {
      MyDialog.showLoadingDialog();
      await GallerySaver.saveImage(url.toString(),albumName: appName).then((success) {
        //
        Get.back();
        MyDialog.success("Image Download To Gallery");
      });
    } catch (e) {
      Get.back();
      print("downloadImageE :$e");
    }
  }

}
