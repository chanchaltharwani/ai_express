import 'package:ai_express/helper/pref.dart';
import 'package:ai_express/widget/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            appName,
            style: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          actions: [Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.brightness_4_rounded,size: 26,color: Colors.blue,)),
          )],
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal:mq.width * .04 ,vertical:    mq.height * .015),
          child: ListView(children: const [
            HomeCard()
              ],
              ),
        )
    );
  }
}
