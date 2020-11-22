import 'package:flutter/material.dart';
import 'package:whes_tablet_app/classes/demo_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String GERMAN = 'de';
const String FRENCH = 'fr';
const String ITALIAN = 'it';
const String ENGLISH = 'en';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "de";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case GERMAN:
      return Locale(GERMAN, 'DE');
    case FRENCH:
      return Locale(FRENCH, "FR");
    case ITALIAN:
      return Locale(ITALIAN, "IT");
    case ENGLISH:
      return Locale(ENGLISH, "EN");
    default:
      return Locale(GERMAN, 'DE');
  }
}

String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context).translate(key);
}
