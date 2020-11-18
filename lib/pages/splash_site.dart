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
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => IndexSite(heritages: widget.heritageData)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.PrimaryColor,
      body: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Styles.progressColor))),
    );
  }
}
