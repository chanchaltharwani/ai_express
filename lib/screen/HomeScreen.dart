import 'package:ai_express/helper/pref.dart';
import 'package:ai_express/model/home_type.dart';
import 'package:ai_express/widget/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../helper/global.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final _isDarkMode = Pref.isDarkMode.obs;

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
                onPressed: () {
                  // dark and light theme logic
                  Get.changeThemeMode(
                      _isDarkMode.value ? ThemeMode.light : ThemeMode.dark);
                  _isDarkMode.value = !_isDarkMode.value;
                  Pref.isDarkMode = _isDarkMode.value;
                },
                icon: Obx(
                  () => Icon(
                    _isDarkMode.value
                        ? Icons.brightness_2_rounded
                        : Icons.brightness_5_rounded,
                    size: 26,
                  ),
                )),
          )
        ],
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * .04, vertical: mq.height * .015),
          child: ListView(
            children: HomeType.values
                .map((e) => HomeCard(
                      homeType: e,
                    ))
                .toList(),
          )),
    );
  }
}
