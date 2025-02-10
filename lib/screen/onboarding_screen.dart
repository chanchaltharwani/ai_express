import 'package:ai_express/model/onboard.dart';
import 'package:ai_express/screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../helper/global.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final c = PageController();
    final list = [
      //Onboarding 1
      Onboard(
          title: "Ask Me Anything",
          subtitle:
              "I can be your best friend & you can ask me anything & i will help you",
          lottie: "ai_ask_me"),

      //Onboarding 2
      Onboard(
          title: "Imagination To Reality",
          subtitle:
              "Just Imagine anything & let me know ,i will create something wonderful for you.",
          lottie: "ai_play"),
    ];
    return Scaffold(
        body: PageView.builder(
          controller: c,
            itemCount: list.length,
            itemBuilder: (context, index) {
              final isLast = index == list.length - 1;
              return Column(
                children: [
                  Lottie.asset("assets/lottie/${list[index].lottie}.json",
                      height: mq.height * .6,),
                  //title
                  Text(
                    list[index].title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        letterSpacing: .5),
                  ),

                  //subtitle
                  SizedBox(height: mq.height * .01),
                  SizedBox(
                    width: mq.width * .7,
                    child: Text(
                      list[index].subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13.5,
                          letterSpacing: .5,
                          color: Colors.black54),
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
                          width: i == index ? 15 : 10,
                          //width: 10,
                          height: 8,
                          decoration: BoxDecoration(
                              color: i == index ? Colors.blue : Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
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
                      onPressed: () {

                        if(isLast){
                          Get.off(()=>const Homescreen());
                        //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Homescreen()));


                        }
                        else{
                          c.nextPage(duration: Duration(microseconds: 1500), curve: Curves.ease);
                        }

                      },
                      child:  Text(
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                          isLast ? "Finish" : "Next"
                      )
                  ),
                  const Spacer(flex: 2),
                ],
              );
            }));
  }
}
