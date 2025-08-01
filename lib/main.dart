import 'package:ai_express/apis/app_write.dart';
import 'package:ai_express/helper/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'helper/pref.dart';
import 'screen/Splash_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Pref.initialize();
  //appwrite
  AppWrite.init();
  // for full screens and landscape mode
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

        themeMode: Pref.defaultTheme(),

        //dark
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 1,
            titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        //light theme

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

extension AppTheme on ThemeData {
  //light text color
  Color get lightTextColor =>
      brightness == Brightness.dark ? Colors.white70 : Colors.black54;


  // button color
  Color get buttonColor =>
      brightness == Brightness.dark ? Colors.cyan.withOpacity(.5) : Colors.blue;
}
