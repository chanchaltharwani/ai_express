import 'package:ai_express/main.dart';
import 'package:ai_express/screen/HomeScreen.dart';
import 'package:ai_express/screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/global.dart';
import '../helper/pref.dart';
import '../widget/Custome_Loading.dart';

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
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (_) =>
      //         Pref.showOnboarding ? OnboardingScreen() : Homescreen()));

      Get.off(()=>Pref.showOnboarding ? OnboardingScreen() : Homescreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    //initialize device size
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.all(mq.width * .05),
                child: Image.asset(
                  "assets/images/ai_express_logo.png",
                  width: mq.width * .45,
                  color: Theme.of(context).buttonColor,
                ),
              ),
            ),
            Spacer(),
            CustomeLoading(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
