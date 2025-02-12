import 'package:ai_express/controllers/translate_controller.dart';
import 'package:ai_express/helper/global.dart';
import 'package:ai_express/widget/custome_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({super.key});

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
  final _c =  TranslateController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi Language Translator"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: mq.height * .02,
          bottom: mq.height * .01,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //from Language
              Container(
                height: 50,
                width: mq.width * .4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: const Text("Auto"),
              ),

              //swipe language  button
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.repeat),
                color: Colors.grey,
              ),

              //to language
              Container(
                height: 50,
                width: mq.width * .4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: const Text("To"),
              ),
            ],
          ),

          //text field for input
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mq.width * .04,
              vertical: mq.height * .035,
            ),
            child: TextFormField(
              controller: _c.textC,
              minLines: 5,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus,
              decoration: const InputDecoration(
                  hintText: "Translate Anything You want...",
                  hintStyle: TextStyle(fontSize: 13.5),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),

          // //text field for output

          if(_c.resultC.text.isNotEmpty)

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mq.width * .04,
            ),
            child: TextFormField(
              controller: _c.resultC,
              //minLines: 5,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          SizedBox(
            height: mq.height * .04,
          ),

          //button
          CustomeBtn(onTap: () {}, text: 'Translate')
        ],
      ),
    );
  }
}
