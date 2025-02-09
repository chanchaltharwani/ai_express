import 'package:ai_express/screen/HomeScreen.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    //initialize device size
    mq = MediaQuery.sizeOf(context);
    return const Scaffold(
      body: Center(
        child:Text("Welcome to Home Screen")
      )
    );
  }
}
