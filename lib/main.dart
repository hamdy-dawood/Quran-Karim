import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_karim/views/splash/view.dart';

import 'core/cache_helper.dart';
import 'core/helper_methods.dart';
import 'provider/theme_provider.dart';
import 'views/constant/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await readJson();
      await getSettings();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Quran',
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: const SplashView(),
        );
      },
    );
  }
}
