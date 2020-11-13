import 'package:flutter/material.dart';
import 'package:whes_tablet_app/classes/heritage_data.dart';
import 'package:whes_tablet_app/pages/index_site.dart';
import 'package:whes_tablet_app/classes/styles.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:whes_tablet_app/localization/demo_localization.dart';
import 'localization/language_constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  final heritageData = HeritageData.fetchAll();
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (this._locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red[800])),
        ),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "WHES TABLET APP",
        theme: ThemeData(
            iconTheme: Styles.iconThemeColor,
            primaryColor: Styles.PrimaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        locale: _locale,
        supportedLocales: [
          Locale("de", "DE"),
          Locale("fr", "FR"),
          Locale("it", "IT"),
          Locale("en", "EN")
        ],
        localizationsDelegates: [
          DemoLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        home: IndexSite(heritages: widget.heritageData),
      );
    }
  }
}
