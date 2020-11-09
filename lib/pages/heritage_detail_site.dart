import 'package:flutter/material.dart';
import 'package:whes_tablet_app/classes/heritage.dart';
import 'package:whes_tablet_app/classes/styles.dart';
import 'package:whes_tablet_app/localization/language_constants.dart';

class HeritageDetail extends StatelessWidget {
  final Heritage heritage;
  HeritageDetail(this.heritage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(getTranslated(context, heritage.titleDetail),
                style: Styles.textTitle)),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, heritage),
        ));
  }

  List<Widget> _renderBody(BuildContext context, Heritage heritage) {
    var result = List<Widget>();
    result.add(_bannerImage(heritage.urlDetail, 170.0));
    return result;
  }

  Widget _bannerImage(String url, double height) {
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: Image.asset(url, fit: BoxFit.fitWidth),
    );
  }
}
