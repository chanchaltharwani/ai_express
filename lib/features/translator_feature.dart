import 'package:ai_express/controllers/image_controller.dart';
import 'package:ai_express/controllers/translate_controller.dart';
import 'package:ai_express/features/custome_loading.dart';
import 'package:ai_express/helper/global.dart';
import 'package:ai_express/widget/custome_btn.dart';
import 'package:ai_express/widget/language_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({super.key});

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
  final _controller = TranslateController();
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
              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(
                  c: _controller,
                  s: _controller.from,
                )),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Container(
                  height: 50,
                  width: mq.width * .4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Obx(() => Text(_controller.from.isEmpty
                      ? "Auto"
                      : _controller.from.value)),
                ),
              ),

              //swipe language  button
              IconButton(
                onPressed: () {
                  _controller.swapLanguages();
                },
                icon:  Icon(CupertinoIcons.repeat),
                color: _controller.to.isNotEmpty && _controller.from.isNotEmpty ? Colors.blue :  Colors.grey,
              ),

              //to language
              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(
                  c: _controller,
                  s: _controller.to,
                )),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Container(
                  height: 50,
                  width: mq.width * .4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Obx(() => Text(
                      _controller.to.isEmpty ? "To" : _controller.to.value)),
                ),
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
              controller: _controller.textC,
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

          Obx(() => _translateResult()),
          SizedBox(
            height: mq.height * .04,
          ),

          // translate button
          CustomeBtn(
              onTap: () {
                _controller.translate();
              },
              text: 'Translate')
        ],
      ),
    );
  }

  //
  Widget _translateResult() => switch (_controller.status.value) {
        Status.none => SizedBox(),
        Status.complete => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mq.width * .04,
            ),
            child: TextFormField(
              controller: _controller.resultC,
              //minLines: 5,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
        Status.loading => Align(child: const CustomeLoading()),
      };
}
