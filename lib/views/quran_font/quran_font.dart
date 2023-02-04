import 'package:flutter/material.dart';
import 'package:quran_karim/core/color_manager.dart';
import 'package:quran_karim/core/helper_methods.dart';
import 'package:quran_karim/core/cache_helper.dart';
import 'package:quran_karim/views/nav_bar/view.dart';

class QuranFont extends StatefulWidget {
  const QuranFont({Key? key}) : super(key: key);

  @override
  State<QuranFont> createState() => _QuranFontState();
}

class _QuranFontState extends State<QuranFont> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          leading:
              BackButton(color: Theme.of(context).textTheme.bodyLarge?.color),
          elevation: 0.0,
          title: Text(
            "Font",
            style:
                TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Arabic Font Size:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Theme.of(context).textTheme.bodyLarge?.color),
                  ),
                  Slider(
                    value: arabicFontSize,
                    activeColor: ColorManager.orangeColor,
                    inactiveColor: ColorManager.orangeColor.withOpacity(0.5),
                    min: 20,
                    max: 40,
                    onChanged: (value) {
                      setState(() {
                        arabicFontSize = value;
                      });
                    },
                  ),
                  Text(
                    "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                    style: TextStyle(
                        fontFamily: 'quran', fontSize: arabicFontSize),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.orangeColor,
                          elevation: 0.0,
                        ),
                        onPressed: () {
                          setState(() {
                            arabicFontSize = 28;
                          });
                          saveSettings();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Reset',
                            style: TextStyle(
                                color: ColorManager.white, fontSize: 20),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.orangeColor,
                          elevation: 0.0,
                        ),
                        onPressed: () {
                          saveSettings();
                          navigateTo(
                              page: const NavBarView(), withHistory: false);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: ColorManager.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
