import 'package:flutter/material.dart';
import 'package:whes_tablet_app/classes/heritage.dart';
import 'package:whes_tablet_app/classes/styles.dart';
import 'package:whes_tablet_app/classes/language_constants.dart';

class HeritageDetailInfo extends StatelessWidget {
  final Heritage heritage;
  HeritageDetailInfo(this.heritage);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _bannerImage(heritage.urlDetail, 200.0),
        SingleChildScrollView(
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
                        _sectionTitle(getTranslated(context, heritage.title1)),
                        _sectionText(getTranslated(context, heritage.text1)),
                        _sectionTitle(
                            getTranslated(context, "didyouknow_title")),
                        Column(
                          children: <Widget>[
                            _sectionListTile(
                                getTranslated(context, heritage.text2)),
                            _sectionListTile(
                                getTranslated(context, heritage.text3))
                          ],
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _sectionPicture(heritage.urlQR),
                      ]))
            ],
          ),
        ),
      ],
    ));
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

  Widget _sectionListTile(String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
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

  Widget _sectionPicture(String url) {
    return Container(
        width: 300,
        height: 280,
        padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            url,
            fit: BoxFit.fill,
          ),
        ));
  }
}
