import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../apis/apis.dart';
import '../model/message.dart';

class ChatController extends GetxController {
  final textC = TextEditingController();


  final list =  <Message>[Message(msg: "Hello , How i can help you? ", msgType: MessageType.bot)].obs;

  Future<void> askQuestions() async {

    if(textC.text.trim().isNotEmpty){
      //user
      list.add(Message(msg: textC.text, msgType: MessageType.user));
      list.add(Message(msg: "Please wait....", msgType: MessageType.bot));
        final res = await Apis.getAnswer(textC.text);


      //aibot
      list.removeLast();
      list.add(Message(msg: res, msgType: MessageType.bot));
      textC.text = "";
    }

  }



}
