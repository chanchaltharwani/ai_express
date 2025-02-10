import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../helper/global.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Lottie.asset("assets/lottie/ai_ask_me.json", height: mq.height * .6),
          //title
          Text(
            "Ask Me Anything",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: .5),
          ),

          //subtitle
          SizedBox(height: mq.height * .01),
          SizedBox(
            width: mq.width * .7,
            child: const Text(
              "I can be your best friend & you can ask me anything & i will help you",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.5, letterSpacing: .5, color: Colors.black54),
            ),
          ),
          //dots
          const Spacer(),
          Wrap(
            spacing: 10,
            children: [
              ...List.generate(
                2,
                (i) => Container(
                  width: 10,
                  height: 8,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
            ],
          ),
          const Spacer(),
          //button
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                  shape: const StadiumBorder(),
                  elevation: 0,
                  minimumSize: Size(mq.width * .5, 50)),
              onPressed: () {},
              child: const Text(
                "Next",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white),
              )),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
