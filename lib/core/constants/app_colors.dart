import 'package:flutter/material.dart';

class AppColors implements BaseColors {
  final Map<int, Color> _primary = {
    50: const Color.fromRGBO(218, 107, 255, 0.1),
    100: const Color.fromRGBO(218, 107, 255, 0.2),
    200: const Color.fromRGBO(218, 107, 255, 0.3),
    300: const Color.fromRGBO(218, 107, 255, 0.4),
    400: const Color.fromRGBO(218, 107, 255, 0.5),
    500: const Color.fromRGBO(218, 107, 255, 0.6),
    600: const Color.fromRGBO(218, 107, 255, 0.7),
    700: const Color.fromRGBO(218, 107, 255, 0.8),
    800: const Color.fromRGBO(218, 107, 255, 0.9),
    900: const Color.fromRGBO(218, 107, 255, 1.0),
  };

  @override
  MaterialColor get colorAccent => Colors.amber;

  @override
  MaterialColor get colorPrimary => MaterialColor(0xFFEFB7D2, _primary);

  @override
  Color get colorPrimaryText => const Color(0xff38937f);

  @override
  Color get colorSecondaryText => const Color(0xff3b3b3b);

  @override
  Color get colorAppbarTitle => const Color(0xff4f2b51);

  @override
  Color get colorLink => const Color(0xff7c06ec);

  @override
  Color get colorBG => const Color(0xffefefef);

  @override
  Color get countryBottomLabel => const Color(0x9dffc107);

  @override
  Color get countrySelectionBorderColor => const Color(0xffff69f8);

  static const Color primaryTextColor = Color(0xff38937f);
  static const Color blackTextStyle = Color(0xff000000);
}

abstract class BaseColors {
  //theme color
  MaterialColor get colorPrimary;

  MaterialColor get colorAccent;

  //text color
  Color get colorPrimaryText;

  Color get colorSecondaryText;

  Color get colorAppbarTitle;

  //Extra color
  Color get colorLink;

  Color get colorBG;

  Color get countryBottomLabel;

  Color get countrySelectionBorderColor;
}

//
// /// A class containing common colors used in the app.
// class AppColors {
//   AppColors._(); // Private constructor to prevent instantiation.
//
//   /// Common Colors
//   static const Color white = Color(0xFFFFFFFF);
//   static const Color black = Color(0xFF000000);
//   static const Color red = Color(0xFFD30000);
//   static const Color yellow = Color(0xFFFFAC33);
//   static const Color green = Color(0xFF2BEF83);
//
//   /// App Specific Colors
//   static const Color colorPrimary = Color(0xFFEFB7D2);
//   static const Color colorAccent = Colors.amber;
//   static const Color primaryTextColor = Color(0xff38937f);
//   static const Color secondaryTextColor = Color(0xff3b3b3b);
//   static const Color colorAppbarTitle = Color(0xff4f2b51);
//   static const Color colorLink = Color(0xff0082ff);
//   static const Color colorBG = Color(0xffefefef);
//   static const Color countryBottomLabel = Color(0x9dffc107);
//   static const Color countrySelectionBorderColor = Color(0xffb8deb2);
//   static const Color blackTextStyle = Color(0xff000000);
// }
