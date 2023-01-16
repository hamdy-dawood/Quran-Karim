import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_karim/core/color_manager.dart';
import 'package:quran_karim/provider/theme_provider.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
        activeColor: ColorManager.orangeColor,
        value: themeProvider.isDarkMode,
        onChanged: (value) {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.toggleTheme(value);
        });
  }
}
