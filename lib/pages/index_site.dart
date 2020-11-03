import 'package:flutter/material.dart';
import 'package:whes_tablet_app/classes/language.dart';
import 'package:whes_tablet_app/localization/language_constants.dart';
import 'package:whes_tablet_app/main.dart';
import 'package:whes_tablet_app/classes/styles.dart';
import 'package:whes_tablet_app/pages/about_us_site.dart';
import 'package:whes_tablet_app/pages/quiz_start.dart';
import 'package:whes_tablet_app/pages/unesco_site.dart';

class IndexSite extends StatefulWidget {
  IndexSite({Key key}) : super(key: key);

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
        actions: <Widget>[],
      ),
      // body: Container(
      //     decoration: BoxDecoration(
      //        image: DecorationImage(
      //            image: AssetImage("assets/images/karte_schweiz.png"),
      //          fit: BoxFit.scaleDown))),
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
        _drawerExpansionTile("Deutsch", context, Language("de")),
        _drawerExpansionTile("Francais", context, Language("fr")),
        _drawerExpansionTile("Italiano", context, Language("it")),
        _drawerExpansionTile("English", context, Language("en")),
      ],
    );
  }

  Widget _drawerExpansionTile(
      String text, BuildContext context, Language language) {
    return ListTile(
      title: Text(text, style: Styles.textText),
      onTap: () {
        _changeLanguage(language);
      },
    );
  }

  Widget _drawerHeader() {
    return DrawerHeader(
        child: Text('', style: Styles.textLowerTitle),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/WHES_Website_Logo.png"),
                fit: BoxFit.scaleDown)));
  }
}
