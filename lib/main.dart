import 'package:flutter/material.dart';
import 'package:whes_tablet_app/styles.dart';

void main() {
  return runApp(MaterialApp(
    title: 'WHES TABLET APP',
    theme: ThemeData(
        primaryColor: Styles.PrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity),
  ));
}
