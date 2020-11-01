import 'package:flutter/material.dart';
import 'package:whes_tablet_app/classes/language.dart';
import 'package:whes_tablet_app/localization/language_constants.dart';
import 'package:whes_tablet_app/main.dart';
import 'package:whes_tablet_app/classes/styles.dart';
import 'package:whes_tablet_app/pages/about_us_site.dart';

class IndexSite extends StatefulWidget {
  IndexSite({Key key}) : super(key: key);

  @override
  _IndexSiteState createState() => _IndexSiteState();
}

class _IndexSiteState extends State<IndexSite> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'index_title'),
            style: Styles.textTitle),
        actions: <Widget>[_languageButton()],
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/karte_schweiz.png"),
                  fit: BoxFit.scaleDown))),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            _drawerHeader(),
            _drawer(getTranslated(context, 'UNESCO Welterbe'), context, null),
            _drawer(getTranslated(context, 'Quiz'), context, null),
            _drawer(getTranslated(context, 'Über uns'), context, AboutUs()),
            _drawer(getTranslated(context, 'Sprache'), context, null)
          ],
        ),
      ),
    );
  }

  Widget _drawer(String text, BuildContext context, Widget function) {
    return ListTile(
      title: Text(text, style: Styles.textLowerTitle),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => function));
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

  Widget _languageButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<Language>(
        underline: SizedBox(),
        icon: Icon(
          Icons.language,
        ),
        onChanged: (Language language) {
          _changeLanguage(language);
        },
        items: Language.languageList()
            .map<DropdownMenuItem<Language>>(
              (e) => DropdownMenuItem<Language>(
                value: e,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      e.name,
                      style: Styles.textLowerTitle,
                    )
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
