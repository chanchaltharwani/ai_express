import 'package:ai_express/apis/apis.dart';
import 'package:ai_express/helper/pref.dart';
import 'package:ai_express/model/home_type.dart';
import 'package:ai_express/widget/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../helper/global.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnboarding = false;
  }

  @override
  Widget build(BuildContext context) {
    //initialize device size
    mq = MediaQuery.sizeOf(context);

    //Apis.getAnswer('Hiiii');
    return Scaffold(
        appBar: AppBar(

          title: const Text(
            appName,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.brightness_4_rounded,
                    size: 26,
                  )),
            )
          ],
        ),



        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * .04, vertical: mq.height * .015),
          child: ListView(
            children: HomeType.values.map((e) => HomeCard(homeType: e,)).toList(),
          )
          ),
        );
  }
}
