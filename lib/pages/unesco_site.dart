import 'package:flutter/material.dart';
import 'package:whes_tablet_app/classes/language_constants.dart';
import 'package:whes_tablet_app/classes/styles.dart';

class Unesco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'unesco_title'),
            style: Styles.textTitle),
      ),
      body: SingleChildScrollView(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 6,
              child: Material(
                elevation: 2.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _sectionTitle(getTranslated(context, "unesco_first_title")),
                    _sectionText(getTranslated(context, "unesco_first_text")),
                    _sectionTitle(
                        getTranslated(context, "unesco_second_title")),
                    _sectionText(getTranslated(context, "unesco_second_text")),
                    _sectionTitle(getTranslated(context, "unesco_third_title")),
                    _sectionText(getTranslated(context, "unesco_third_text"))
                  ],
                ),
              )),
          Expanded(
              flex: 4,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _sectionPicture("assets/images/unesco/canyon.jpg"),
                    _sectionPicture("assets/images/unesco/reef.jpg"),
                    _sectionPicture("assets/images/unesco/egypt.jpg"),
                  ]))
        ],
      )),
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
          textAlign: TextAlign.justify,
        ));
  }

  Widget _sectionPicture(String url) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset(
          url,
        ),
      ),
    );
  }
}
