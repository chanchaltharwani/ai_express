import 'package:ai_express/controllers/chat_controller.dart';
import 'package:ai_express/widget/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/global.dart';

class ChatbotFeature extends StatefulWidget {

  const ChatbotFeature({super.key});

  @override
  State<ChatbotFeature> createState() => _ChatbotFeatureState();
}

class _ChatbotFeatureState extends State<ChatbotFeature> {
  final _c = ChatController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat With Ai Express"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
                  controller: _c.textC,
              textAlign: TextAlign.center,
              onTapOutside: (e) => FocusScope.of(context).unfocus,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                  isDense: true,
                  hintText: "Ask Me anything you want...",
                  hintStyle: TextStyle(fontSize: 13),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)))),
            )),

            //for adding some space
            SizedBox(width: 8),

            //send button
            IconButton(
              onPressed: () {
                _c.askQuestions();

              },
              icon: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.rocket_launch_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            )
          ],
        ),
      ),
      body: Obx(
        ()=> ListView(
          physics:const  BouncingScrollPhysics(),
          controller: _c.scrollC,
          padding: EdgeInsets.only(top: mq.height * .02,bottom: mq.height *.01),
          children: _c.list.map((e)=>MessageCard(message: e,)).toList(),
        ),
      ),
    );
  }
}
