import 'package:flutter/material.dart';
import 'package:whes_tablet_app/classes/heritage.dart';
import 'package:whes_tablet_app/classes/styles.dart';
import 'package:whes_tablet_app/localization/language_constants.dart';

class HeritageDetailInfo extends StatelessWidget {
  final Heritage heritage;
  HeritageDetailInfo(this.heritage);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _renderBody(context, heritage)),
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
        padding: EdgeInsets.fromLTRB(25.0, 15.0, 500.0, 15.0),
        child: Text(
          text,
          style: Styles.textText,
          textAlign: TextAlign.justify,
        ));
  }

  Widget _sectionListTile(String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(25.0, 15.0, 500.0, 15.0),
      child: ListTile(
        leading: Text(
          "\u2022",
          style: Styles.textText,
          textAlign: TextAlign.justify,
        ),
        title: Text(
          text,
          style: Styles.textText,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  Widget _bannerImage(String url, double height) {
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: Image.asset(url, fit: BoxFit.fitWidth),
    );
  }

  List<Widget> _renderBody(BuildContext context, Heritage heritage) {
    var result = List<Widget>();
    result.add(_bannerImage(heritage.urlDetail, 200.0));
    result.add(_sectionTitle(getTranslated(context, heritage.title1)));
    result.add(_sectionText(getTranslated(context, heritage.text1)));
    result.add(_sectionTitle(getTranslated(context, "didyouknow_title")));
    result.add(
      Column(
        children: <Widget>[
          _sectionListTile(getTranslated(context, heritage.text2)),
          _sectionListTile(getTranslated(context, heritage.text3))
        ],
      ),
    );

    return result;
  }
}
