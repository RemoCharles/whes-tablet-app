import 'package:flutter/material.dart';

class Styles {
  static const PrimaryColor = const Color(0xFFFFFFFF);
  static const _textSizeTitle = 30.0;
  static const _textSizeLowerTitle = 25.0;
  static const _textSizeText = 20.0;
  static const _textSizeButtonTitle = 25.0;
  static const _textColorText = Color(0xFF3C3C3B);
  static const _textColorLowerTitle = Color(0xFF3C3C3B);
  static const _textColorTitle = Color(0xFFC80B0E);
  static const _textColorButtonTitle = Color(0xFFC80B0E);
  static const _colorIcons = Color(0xFF3C3C3B);

  static final textLowerTitle = TextStyle(
      fontSize: _textSizeLowerTitle,
      color: _textColorLowerTitle,
      fontFamily: 'helvetica',
      fontWeight: FontWeight.w700);

  static final textTitle = TextStyle(
      fontSize: _textSizeTitle,
      color: _textColorTitle,
      fontFamily: 'helvetica',
      fontWeight: FontWeight.w700);

  static final textText = TextStyle(
      fontSize: _textSizeText,
      color: _textColorText,
      fontFamily: 'helvetica',
      fontWeight: FontWeight.w300);

  static final textButton = TextStyle(
      fontSize: _textSizeButtonTitle,
      color: _textColorButtonTitle,
      fontFamily: 'helvetica',
      fontWeight: FontWeight.w700);

  static final iconColor = IconThemeData(color: _colorIcons);

  static final tileHoverColor = Color(0xFFC80B0E);

  // static final blackColor = Color
}
