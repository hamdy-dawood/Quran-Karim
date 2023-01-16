import 'package:flutter/material.dart';

import 'package:quran_karim/core/helper_methods.dart';
import 'package:quran_karim/core/cache_helper.dart';
import 'package:quran_karim/views/constant/logo_name.dart';
import 'package:quran_karim/views/quran_font/quran_font.dart';
import 'package:share_plus/share_plus.dart';

import 'theme_button.dart';

class MorePage extends StatefulWidget {
  const MorePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const SizedBox(
          height: 60,
        ),
        const LogoName(),
        const SizedBox(
          height: 40,
        ),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          leading: Icon(
            Icons.format_size,
            color: Theme.of(context).iconTheme.color,
          ),
          title: Text(
            'Font Size',
            style: TextStyle(
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          onTap: () {
            navigateTo(
              page: const QuranFont(),
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          leading: Icon(
            Icons.dark_mode,
            color: Theme.of(context).iconTheme.color,
          ),
          title: Text(
            'Dark Mode',
            style: TextStyle(
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          trailing: const ChangeThemeButton(),
        ),
        const SizedBox(
          height: 10,
        ),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          leading: Icon(
            Icons.share_outlined,
            color: Theme.of(context).iconTheme.color,
          ),
          title: Text(
            'Share App',
            style: TextStyle(
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          onTap: () {
            Share.share(
                ''' Quran app \n You can Download it from $quranAppUrl''');
          },
        ),
      ],
    );
  }
}
