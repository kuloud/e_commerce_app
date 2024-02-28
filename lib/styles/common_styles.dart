import 'package:flutter/material.dart';

const fontFamilyGillSans = 'gillSans'; // fontFamily: 'gillSans'

class LightTheme {
  static const primaryColor = Color(0xFFFDDC15);
  static const secondaryColor = Color(0xFF14C55D);

  static const secondColor = Color(0xFF6146A5);
  static const thirdColor = Color(0xFF46CF74);

  static const textColor = Color(0xFF000000);
  static const highlightTextColor = Color(0xFF6B51AF);
  static const labelTextColor = Color(0xFF929292);
  static const tabTextColor = textColor;
  static const tabSelectedTextColor = secondColor;
  static const buttonTextColor = Color(0xFF333333);

  static const pageBgColor = Color(0xFFF6F6F6);
  static const hintBgColor = Color(0xFFF4F4F4);
  static const cardBgColor = Color(0xFFFEFEFE);
  static const categoryBgColor = Color(0xFFFEE132);
  static const buttonBgColor = Color(0xFFFDFFF9);
  static const disableBgColor = Color(0xffD0D0D0);

  static const highlightColor = Color(0xffC1AA6E);

  static const iconColor = Color(0xFF000000);

  static const dividerColor = Color(0xFFECECEC);
}

class CommonStyle {
  static BoxDecoration pageBackground = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0, 0.4, 1],
      colors: [
        LightTheme.primaryColor,
        Color(0x00FDDC15),
        Color(0x00FDDC15),
      ],
    ),
  );

  static BoxDecoration appBarBackground = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0, 1],
      colors: [
        LightTheme.primaryColor,
        Color(0xFFF7F0C2),
      ],
    ),
  );
}
