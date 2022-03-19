import 'package:flutter/services.dart';

import 'index.dart';

class ThemeConfig {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorConstants.scaffoldLightColor,
    primaryColor: ColorConstants.blue600,
    primaryColorDark: ColorConstants.blue600,
    errorColor: ColorConstants.red500,
    hoverColor: Colors.white54,
    dividerColor: ColorConstants.viewLineColor,
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(
      color: ColorConstants.appLayoutBackground,
      iconTheme: IconThemeData(color: ColorConstants.textPrimaryColor),
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    colorScheme: const ColorScheme.light(
      primary: ColorConstants.blue600,
    ),
    cardTheme: const CardTheme(color: ColorConstants.white),
    cardColor: ColorConstants.white,
    iconTheme: const IconThemeData(color: ColorConstants.textPrimaryColor),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: ColorConstants.white),
    textTheme: const TextTheme(
      button: TextStyle(color: ColorConstants.blue600),
      headline6: TextStyle(color: ColorConstants.textPrimaryColor),
      subtitle2: TextStyle(color: ColorConstants.textSecondaryColor),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorConstants.appBackgroundColorDark,
    highlightColor: ColorConstants.appBackgroundColorDark,
    errorColor: const Color(0xFFCF6676),
    appBarTheme: const AppBarTheme(
      color: ColorConstants.appBackgroundColorDark,
      iconTheme: IconThemeData(color: ColorConstants.black),
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
    ),
    primaryColor: ColorConstants.blue600,
    dividerColor: const Color(0xFFDADADA).withOpacity(0.3),
    primaryColorDark: ColorConstants.blue600,
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: ColorConstants.white),
    hoverColor: Colors.black12,
    fontFamily: 'Roboto',
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: ColorConstants.appBackgroundColorDark),
    primaryTextTheme: const TextTheme(
        headline6: TextStyle(color: ColorConstants.white),
        overline: TextStyle(color: ColorConstants.white)),
    cardTheme: const CardTheme(color: ColorConstants.cardBackgroundBlackDark),
    cardColor: ColorConstants.appSecondaryBackgroundColor,
    iconTheme: const IconThemeData(color: ColorConstants.white),
    textTheme: const TextTheme(
      button: TextStyle(color: ColorConstants.blue600),
      headline6: TextStyle(color: ColorConstants.white),
      subtitle2: TextStyle(color: Colors.white54),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme.dark(
      primary: ColorConstants.appBackgroundColorDark,
      onPrimary: ColorConstants.cardBackgroundBlackDark,
    ).copyWith(secondary: ColorConstants.white),
  );
}
