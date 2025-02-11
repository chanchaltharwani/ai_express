import 'package:ai_express/controllers/image_controller.dart';
import 'package:ai_express/widget/custome_btn.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../helper/global.dart';

class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
 final _c = ImageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ai Image Creator"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
            top: mq.height * .02,
            bottom: mq.height * .01,
            left: mq.width * .04,
            right: mq.width * .04),
        children: [
          //text filed
          TextFormField(
             controller: _c.textC,
            textAlign: TextAlign.center,
            minLines: 2,
            maxLines: null,
            onTapOutside: (e) => FocusScope.of(context).unfocus,
            decoration: const InputDecoration(
                hintText:
                    "Imagine something Wonderful & Innovative \n Type here & I will Create for you ",
                hintStyle: TextStyle(fontSize: 13.5),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),

//ai image

          Container(
             height:  mq.height * .5,
              alignment: Alignment.center,
              child: Lottie.asset('assets/lottie/ai_play.json',
                  height: mq.height * .3)),

          //crete button
      CustomeBtn(onTap: (){}, text: 'Create'),

        ],
      ),
    );
  }
}
