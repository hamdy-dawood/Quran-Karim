import 'package:flutter/material.dart';
import 'package:quran_karim/core/color_manager.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}


class MyThemes {
  static final darkTheme = ThemeData(
    platform: TargetPlatform.iOS,
    scaffoldBackgroundColor: ColorManager.black,
    primaryColor: ColorManager.black,
    colorScheme: const ColorScheme.dark(),
    appBarTheme: AppBarTheme(backgroundColor: ColorManager.black),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: ColorManager.white),
      bodyText2: const TextStyle(
        color: Color(0xffd8d8d8),
      ),
      headline1: const TextStyle(
        color: Color(0x801f2226),
      ),
      headline2: const TextStyle(
        color: Color(0xcc1f2226),
      ),
    ),
    iconTheme: IconThemeData(color: ColorManager.blueColor),
    listTileTheme: const ListTileThemeData(tileColor: Color(0xff202328)),
    cardColor: const Color(0x80202328),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Color(0xff202328)),
  );
  static final lightTheme = ThemeData(
      platform: TargetPlatform.iOS,
      scaffoldBackgroundColor: ColorManager.white,
      primaryColor: ColorManager.white,
      colorScheme: const ColorScheme.light(),
      appBarTheme: AppBarTheme(backgroundColor: ColorManager.white),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: ColorManager.black),
        bodyText2: const TextStyle(
          color: Color.fromARGB(196, 44, 44, 44),
        ),
        headline1: const TextStyle(
          color: Color.fromARGB(255, 253, 251, 240),
        ),
        headline2: const TextStyle(
          color: Color.fromARGB(255, 253, 247, 230),
        ),
      ),
      iconTheme: IconThemeData(color: ColorManager.blueColor),
      listTileTheme: ListTileThemeData(tileColor: ColorManager.grey),
      cardColor: const Color.fromARGB(255, 253, 251, 240),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: ColorManager.white));
}
