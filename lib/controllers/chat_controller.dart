import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/message.dart';

class ChatController extends GetxController {
  final textC = TextEditingController();


  final list =  <Message>[].obs;

  void askQuestions(){

    if(textC.text.trim().isNotEmpty){
      //user
      list.add(Message(msg: textC.text, msgType: MessageType.user));

      //aibot
      list.add(Message(msg: "I recived Your Message", msgType: MessageType.bot));
      textC.text = "";
    }

  }



}
