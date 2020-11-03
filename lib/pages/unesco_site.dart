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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _sectionTitle(getTranslated(context, "unesco_first_title")),
            _sectionText(getTranslated(context, "unesco_first_text"))
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
        child: Text(text,
            textAlign: TextAlign.left, style: Styles.textLowerTitle));
  }

  Widget _sectionText(String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
        child: Text(
          text,
          style: Styles.textText,
          textAlign: TextAlign.left,
        ));
  }
}
