import 'package:flutter/material.dart';
import 'package:whes_tablet_app/classes/heritage.dart';
import 'package:whes_tablet_app/classes/language.dart';
import 'package:whes_tablet_app/localization/language_constants.dart';
import 'package:whes_tablet_app/main.dart';
import 'package:whes_tablet_app/classes/styles.dart';
import 'package:whes_tablet_app/pages/about_us_site.dart';
import 'package:whes_tablet_app/pages/heritage_detail_site.dart';
import 'package:whes_tablet_app/pages/quiz_start.dart';
import 'package:whes_tablet_app/pages/unesco_site.dart';

class IndexSite extends StatefulWidget {
  IndexSite({Key key, this.heritages}) : super(key: key);
  final List<Heritage> heritages;

  @override
  _IndexSiteState createState() => _IndexSiteState();
}

class _IndexSiteState extends State<IndexSite> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  void _changeLanguage(Language languagecode) async {
    Locale _locale = await setLocale(languagecode.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'index_title'),
            style: Styles.textTitle),
      ),
      body: _backgroundContent(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(5),
          children: <Widget>[
            _drawerHeader(),
            _drawer(
                getTranslated(context, 'UNESCO Welterbe'), context, Unesco()),
            _drawer(getTranslated(context, 'Quiz'), context, QuizStart()),
            _drawer(getTranslated(context, 'Über uns'), context, AboutUs()),
            _drawerExpansion(getTranslated(context, 'Sprache'), context)
          ],
        ),
      ),
    );
  }

  Widget _drawer(String text, BuildContext context, Widget function) {
    return ListTile(
      title: Text(text, style: Styles.textLowerTitle),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => function));
      },
    );
  }

  Widget _drawerExpansion(String text, BuildContext context) {
    return ExpansionTile(
      title: Text(text, style: Styles.textLowerTitle),
      childrenPadding: EdgeInsets.fromLTRB(15, 5, 5, 5),
      children: <Widget>[
        _drawerExpansionTile("assets/images/deutschland.png", "Deutsch",
            context, Language("de")),
        _drawerExpansionTile("assets/images/frankreich.png", "Francais",
            context, Language("fr")),
        _drawerExpansionTile(
            "assets/images/italien.png", "Italiano", context, Language("it")),
        _drawerExpansionTile(
            "assets/images/england.png", "English", context, Language("en")),
      ],
    );
  }

  Widget _drawerExpansionTile(
      String icon, String text, BuildContext context, Language language) {
    return ListTile(
      leading: Image.asset(icon, width: 25, height: 25),
      title: Text(text, style: Styles.textText),
      onTap: () {
        _changeLanguage(language);
      },
    );
  }

  Widget _drawerHeader() {
    return Container(
      child: DrawerHeader(
          child: Text('', style: Styles.textLowerTitle),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/WHES_Website_Logo.png"),
                  fit: BoxFit.scaleDown))),
    );
  }

  Widget _backgroundContent() {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/karte_schweiz.png"),
            )),
        child: _iconContent());
  }

  Widget _iconContent() {
    return Stack(children: <Widget>[
      for (var heritage in widget.heritages) _iconBuilder(heritage)
    ]);
  }

  Widget _iconBuilder(Heritage heritage) {
    return Container(
        child: Positioned(
            bottom: heritage.bottomIcon,
            right: heritage.rightIcon,
            child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                              actions: <Widget>[
                                FlatButton(
                                    child: new Text(
                                      getTranslated(context, "button_more"),
                                      style: Styles.textText,
                                    ),
                                    onPressed: () =>
                                        _navigationToHeritageDetail(
                                            context, heritage))
                              ],
                              contentPadding: EdgeInsets.all(0.0),
                              content: _popUpBuilder(heritage.urlPopUp,
                                  heritage.titlePopUp, heritage.textPopUp)));
                },
                child: _iconDesign(heritage))));
  }

  Widget _iconDesign(Heritage heritage) {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Styles.PrimaryColor),
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  heritage.urlIcon,
                ))));
  }

  Widget _popUpBuilder(String url, String title, String text) {
    return Container(
        width: 300,
        height: 300,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _popUpPicture(url),
              _popUpTitle(getTranslated(context, title)),
              _popUpText(text),
            ]));
  }

  Widget _popUpTitle(String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(15.0, 25.0, 25.0, 10.0),
        child: Text(text,
            textAlign: TextAlign.left, style: Styles.textLowerTitle));
  }

  Widget _popUpText(String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 25.0, 15.0),
        child: Text(
          text,
          style: Styles.textText,
          textAlign: TextAlign.justify,
        ));
  }

  Widget _popUpPicture(String url) {
    return Container(
      width: 400,
      height: 100,
      padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(3.0), topRight: Radius.circular(3.0))),
    );
  }

  void _navigationToHeritageDetail(BuildContext context, Heritage heritage) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HeritageDetail(heritage),
        ));
  }
}
