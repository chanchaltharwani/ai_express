import 'package:ai_express/controllers/image_controller.dart';
import 'package:ai_express/widget/custome_btn.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lottie/lottie.dart';

import '../helper/global.dart';
import '../widget/Custome_Loading.dart';

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
            // 🔹 Ensure controller is assigned
            textAlign: TextAlign.center,
            minLines: 2,
            maxLines: null,
            onChanged: (val) => print("Current TextField Value: '$val'"),
            // 🔹 Debug text field
            decoration: const InputDecoration(
                hintText:
                    "Imagine something Wonderful & Innovative \n Type here & I will Create for you ",
                hintStyle: TextStyle(fontSize: 13.5),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),

          //ai image
          Container(
            height: mq.height * .4,
            margin: EdgeInsets.symmetric(vertical: mq.height * .015),
            alignment: Alignment.center,
            child: Obx(() => _aiImage()),
          ),

          //horizon tal scrool
          Obx(()=>  _c.imageList.isEmpty ? SizedBox() : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(bottom: mq.height * .03),
            physics: BouncingScrollPhysics(),
            child: Wrap(
              spacing: 10,
              children: _c.imageList
                  .map((e) => InkWell(
                onTap: (){
                  _c.url.value = e;
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: CachedNetworkImage(
                    imageUrl: e,
                    height: 100,
                    errorWidget: (context, url, error) => const SizedBox(),
                  ),
                ),
              ))
                  .toList(),
            ),
          ),  ),
          //crete button
          CustomeBtn(
              onTap: () {
                _c.searchAiImage();
              },
              text: 'Create'),
        ],
      ),
    );
  }

  Widget _aiImage() {
    print("Current Status: ${_c.status.value}"); // 🔹 Status print karo
    print("Final Image URL: ${_c.url.value}"); // 🔹 URL print karo

    return switch (_c.status.value) {
      Status.none =>
        Lottie.asset('assets/lottie/ai_play.json', height: mq.height * .3),
      Status.loading => CustomeLoading(),
      Status.complete => ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: CachedNetworkImage(
            imageUrl: _c.url.value,
            placeholder: (context, url) => CustomeLoading(),
            errorWidget: (context, url, error) => const SizedBox(),
          ),
        ),
    };
  }
}
