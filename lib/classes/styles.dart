import 'package:flutter/material.dart';

class Styles {
  static const PrimaryColor = const Color(0xFFFFFFFF);
  static const _textSizeTitle = 30.0;
  static const _textSizeLowerTitle = 25.0;
  static const _textSizeText = 20.0;
  static const _textSizeFlatButtonTitle = 18.0;
  static const _textSizeRaisedButtonTitle = 20.0;
  static const _textSizePopUpTitle = 23.0;
  static const _textSizeTabText = 14.0;
  static const _textColorText = Color(0xFF3C3C3B);
  static const _textColorLowerTitle = Color(0xFF3C3C3B);
  static const _textColorTitle = Color(0xFFC80B0E);
  static const _textColorButtonTitleFlat = Color(0xFFC80B0E);
  static const _textColorButtonTitleRaised = Color(0xFF3C3C3B);
  static const _colorIconsSelected = Color(0xFF3C3C3B);

  static final textPopUpTitle = TextStyle(
      fontSize: _textSizePopUpTitle,
      color: _textColorLowerTitle,
      fontFamily: 'helvetica',
      fontWeight: FontWeight.w700,
      height: 0.8);

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

  static final textButtonFlat = TextStyle(
      fontSize: _textSizeFlatButtonTitle,
      color: _textColorButtonTitleFlat,
      fontFamily: 'helvetica',
      fontWeight: FontWeight.w300);

  static final textButtonRaised = TextStyle(
      fontSize: _textSizeRaisedButtonTitle,
      color: _textColorButtonTitleRaised,
      fontFamily: 'helvetica',
      fontWeight: FontWeight.w300);

  static final textTab = TextStyle(
      fontSize: _textSizeTabText,
      color: _textColorText,
      fontFamily: 'helvetica',
      fontWeight: FontWeight.w300);

  static final iconThemeColor = IconThemeData(color: _colorIconsSelected);

  static final iconColor = Color(0xFF3C3C3B);

  static final selectedIconColor = Color(0xFFC80B0E);

  static final unselectedIconColor = Color(0xFF3C3C3B);

  static final buttonColor = Color(0xFFFFFFFF);

  static final tileHoverColor = Color(0xFFE48587);

  static final buttonBorderColor = Color(0xFF3C3C3B);

  static final progressColor = Color(0xFFC80B0E);
}
