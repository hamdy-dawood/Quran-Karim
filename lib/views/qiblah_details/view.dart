import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quran_karim/views/nav_bar/qiblah/qiblah.dart';

class QiblahDetails extends StatefulWidget {
  const QiblahDetails({Key? key}) : super(key: key);

  @override
  State<QiblahDetails> createState() => _QiblahDetailsState();
}

class _QiblahDetailsState extends State<QiblahDetails> {
  bool hasPermission = false;

  Future getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        hasPermission = true;
      } else {
        Permission.location.request().then((value) {
          setState(() {
            hasPermission = (value == PermissionStatus.granted);
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (hasPermission) {
          return const QiblahScreen();
        } else {
          return Scaffold(
            body: Center(
                child: Text(
              'Please Allow Location',
              style: TextStyle(
                fontSize: 22,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            )),
          );
        }
      },
      future: getPermission(),
    );
  }
}
