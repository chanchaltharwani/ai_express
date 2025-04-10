import 'package:ai_express/helper/my_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../apis/apis.dart';
import '../model/message.dart';

class ChatController extends GetxController {
  final textC = TextEditingController();


  final scrollC = ScrollController();



  final list =  <Message>[Message(msg: "Hello , How i can help you? ", msgType: MessageType.bot)].obs;

  Future<void> askQuestions() async {

    if(textC.text.trim().isNotEmpty){
      //user
      list.add(Message(msg: textC.text, msgType: MessageType.user));
      list.add(Message(msg: "", msgType: MessageType.bot));
      _scrollDown();
        final res = await Apis.getAnswer(textC.text);



      //aibot
      list.removeLast();
      list.add(Message(msg: res, msgType: MessageType.bot));
      _scrollDown();
      textC.text = "";
    }
    else{
      MyDialog.info("Ask Something");
    }

  }


  // for moving to end message
void _scrollDown(){
    scrollC.animateTo(scrollC.position.maxScrollExtent, duration: Duration(microseconds: 500), curve: Curves.ease);
}


}
