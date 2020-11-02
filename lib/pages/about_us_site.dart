import 'package:flutter/material.dart';
import 'package:whes_tablet_app/localization/language_constants.dart';
import 'package:whes_tablet_app/classes/styles.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'about_us_title'),
            style: Styles.textTitle),
      ),
    );
  }
}
