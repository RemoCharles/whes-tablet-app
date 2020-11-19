import 'package:flutter/material.dart';
import 'package:whes_tablet_app/classes/heritage.dart';

class HeritageDetailInfo extends StatelessWidget {
  final Heritage heritage;
  HeritageDetailInfo(this.heritage);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _renderBody(context, heritage),
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
    return result;
  }
}
