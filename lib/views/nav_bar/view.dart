import 'package:flutter/material.dart';
import 'package:quran_karim/core/color_manager.dart';
import 'package:quran_karim/views/qiblah_details/view.dart';

import 'home/home.dart';
import 'more/more_page.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({
    Key? key,
  }) : super(key: key);

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int currentIndex = 0;
  List screens = const [
    HomePage(),
    QiblahDetails(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          selectedItemColor: ColorManager.orangeColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 25,
              ),
              label: '_____',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.compass_calibration,
                size: 25,
              ),
              label: '_____',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 25,
              ),
              label: '_____',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          elevation: 10.0,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
  Future<void> _selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
   await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NavBarView()),
    );
  }
}

