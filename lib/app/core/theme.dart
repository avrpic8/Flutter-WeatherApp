import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:google_fonts/google_fonts.dart';

/// Colors
final primaryContainerColor = HexColor.fromHex('#303F9F');
final primaryColor = HexColor.fromHex('#3F51B5');
final secondryColor = HexColor.fromHex('#7C4DFF');
final onSecondryColor = Colors.white;
final backgroundColor = HexColor.fromHex('#C5CAE9');

///  Text widget themes  ///
final emptyTextTheme = GoogleFonts.lato(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

final cityNameCurrentWeather = GoogleFonts.lato(
  fontSize: 35,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

final tempCurrentWeather = GoogleFonts.lato(
  fontSize: 85,
  fontWeight: FontWeight.w300,
  color: Colors.white,
);

final wphCurrentWeather = GoogleFonts.lato(fontSize: 12, color: Colors.white);

final connectionStatus = GoogleFonts.lato(
  color: Colors.black,
  fontSize: 10,
  fontWeight: FontWeight.bold,
);

final hintTextSearchStyle = GoogleFonts.lato(
  color: Colors.black45,
  fontSize: 14,
  fontWeight: FontWeight.bold,
);

final normalTextTheme = GoogleFonts.lato(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: Colors.black12,
);

ThemeData getLightTheme() {
  return ThemeData(
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      primaryContainer: primaryContainerColor,
      secondary: secondryColor,
      onSecondary: onSecondryColor,
      background: backgroundColor,
    ),
  );
}
