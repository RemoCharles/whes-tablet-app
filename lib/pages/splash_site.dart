import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whes_tablet_app/classes/heritage_data.dart';
import 'package:whes_tablet_app/classes/styles.dart';
import 'package:whes_tablet_app/pages/index_site.dart';

class Splashscreen extends StatefulWidget {
  final heritageData = HeritageData.fetchAll();
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => IndexSite(heritages: widget.heritageData)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.PrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 50.0),
              child: Image.asset("assets/images/WHES_Website_Logo.png",
                  fit: BoxFit.none),
              alignment: Alignment.center,
            ),
            Container(
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Styles.progressColor))),
          ],
        ),
      ),
    );
  }
}
