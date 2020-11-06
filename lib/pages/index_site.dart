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
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        width: 1300,
        height: 800,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: <Widget>[
            Image.asset("assets/images/karte_schweiz.png"),
            _iconBuilder("assets/images/bellinzona.png", 100, 300, AboutUs())
          ],
        ),
      ),
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

  Widget _iconBuilder(
      String url, double bottom, double right, Widget function) {
    return Container(
        child: Positioned(
            bottom: bottom,
            right: right,
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => function));
                },
                child: Card(
                    elevation: 2.0,
                    shape: CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(url, width: 50, height: 50)))));
  }
}
