import 'package:flutter/material.dart';
import 'package:whes_tablet_app/classes/styles.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:whes_tablet_app/classes/demo_localization.dart';
import 'package:whes_tablet_app/pages/splash_site.dart';
import 'classes/language_constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

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
              backgroundColor: Styles.PrimaryColor,
              valueColor: AlwaysStoppedAnimation<Color>(Styles.progressColor)),
        ),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "WHES TABLET",
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              iconTheme: Styles.iconThemeColor,
            ),
            iconTheme: Styles.iconThemeColor,
            primarySwatch: someThemeSwatch(Color(0xFFFFFFFF)),
            primaryColor: Color(0xFFFFFFFF),
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
        home: Splashscreen(),
      );
    }
  }

  MaterialColor someThemeSwatch(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });

    return MaterialColor(color.value, swatch);
  }
}
