import 'package:ai_express/helper/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'helper/pref.dart';
import 'screen/Splash_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Pref.initialize();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 1,
          backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.blue),
            titleTextStyle: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        home: SplashScreen());
  }
}
