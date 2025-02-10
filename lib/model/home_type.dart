import 'package:flutter/cupertino.dart';

enum HomeType { aiChatBot, aiImage, aiTranslator }

extension MyHomeType on HomeType {
  //for title
  String get title => switch (this) {
        HomeType.aiChatBot => 'Ai ChatBot',
        HomeType.aiImage => 'Ai Image Creator',
        HomeType.aiTranslator => 'Language Translator',
      };

  //for lottie
  String get lottie => switch (this) {
        HomeType.aiChatBot => 'ai_hand_waving.json',
        HomeType.aiImage => 'ai_play.json',
        HomeType.aiTranslator => 'ai_ask_me.json',
      };

  //for alignment
  bool get leftAlign => switch (this) {
        HomeType.aiChatBot => true,
        HomeType.aiImage => false,
        HomeType.aiTranslator => true,
      };

    //for paddings
  EdgeInsets get padding => switch (this) {
    HomeType.aiChatBot => EdgeInsets.zero,
    HomeType.aiImage => EdgeInsets.all(20),
    HomeType.aiTranslator => EdgeInsets.zero,
  };
}
