import 'package:ai_express/screen/HomeScreen.dart';
import 'package:flutter/material.dart';

import '../helper/global.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //wait for some time on splash & then move on next screen
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Homescreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    //initialize device size
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
          child: Card(
        color: Colors.yellow,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: EdgeInsets.all(mq.width * .05),
          child: Image.asset(
            "assets/images/ai_express_logo.png",
            width: mq.width * .45,
          ),
        ),
      )),
    );
  }
}
