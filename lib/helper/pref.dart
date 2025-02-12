import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Pref {
  static late Box _box;

  // **Hive Database Initialize Karne Ka Method**
  static Future<void> initialize() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path); // **Hive ko Initialize Karna Zaroori Hai**

    _box = await Hive.openBox('myData'); // **Box Open Karna Padega**
  }

  // **Onboarding Screen Status Get Karne Ka Method**
  static bool get showOnboarding =>
      _box.get('showOnboarding', defaultValue: true);

  // **Onboarding Screen Status Save Karne Ka Method**
  static set showOnboarding(bool value) => _box.put('showOnboarding', value);

  //for storing theme data

  static bool get isDarkMode => _box.get('isDarkMode') ?? false;
  static set isDarkMode(bool v) => _box.put('isDarkMode', v);

  static ThemeMode defaultTheme() {
    final data = _box.get('isDarkMode');
    print('data:$data');
    if (data == null) return ThemeMode.system;
    if (data == true) return ThemeMode.dark;
    return ThemeMode.light;
  }
}
