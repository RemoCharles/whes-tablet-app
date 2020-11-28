import 'package:flutter/material.dart';
import 'package:whes_tablet_app/classes/heritage.dart';
import 'package:whes_tablet_app/classes/styles.dart';
import 'package:whes_tablet_app/classes/language_constants.dart';
import 'package:whes_tablet_app/pages/heritage_detail_gallery_site.dart';
import 'package:whes_tablet_app/pages/heritage_detail_info_site.dart';

class HeritageDetail extends StatefulWidget {
  HeritageDetail({Key key, this.heritage}) : super(key: key);
  final Heritage heritage;

  @override
  _HeritageDetailState createState() => _HeritageDetailState();
}

class _HeritageDetailState extends State<HeritageDetail> {
  int _currentIndex = 0;
  List<Widget> _children = List<Widget>();

  @override
  void initState() {
    _children.add(HeritageDetailInfo(widget.heritage));
    _children.add(HeritageDetailGallery(widget.heritage));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(getTranslated(context, widget.heritage.titleDetail),
              style: Styles.textTitle)),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Styles.selectedIconColor,
          unselectedItemColor: Styles.unselectedIconColor,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: new Icon(
                  Icons.info,
                ),
                // ignore: deprecated_member_use
                title: new Text(
                  "Info",
                  style: Styles.textTab,
                )),
            BottomNavigationBarItem(
                icon: new Icon(
                  Icons.image,
                ),
                // ignore: deprecated_member_use
                title: new Text(getTranslated(context, "gallery_tab"),
                    style: Styles.textTab))
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
