import 'package:flutter/material.dart';
import 'package:whes_tablet_app/localization/language_constants.dart';
import 'package:whes_tablet_app/classes/styles.dart';

class Unesco extends StatefulWidget {
  Unesco({Key key}) : super(key: key);

  @override
  _UnescoState createState() => _UnescoState();
}

class _UnescoState extends State<Unesco> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'unesco_title'),
            style: Styles.textTitle),
      ),
    );
  }
}
