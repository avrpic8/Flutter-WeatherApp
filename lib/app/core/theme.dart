import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:google_fonts/google_fonts.dart';

/// Colors
final primaryContainerColor = HexColor.fromHex('#303F9F');
final primaryColor = HexColor.fromHex('#3F51B5');
final secondryColor = HexColor.fromHex('#7C4DFF');
final onSecondryColor = Colors.white;
final backgroundColor = HexColor.fromHex('#C5CAE9');

final backgroundIconColor1 = HexColor.fromHex('#1e90ff');
final backgroundIconColor2 = HexColor.fromHex('#20bf6b');
final backgroundIconColor3 = HexColor.fromHex('#fed330');
final backgroundIconColor4 = HexColor.fromHex('#0a3d62');
final backgroundIconColor5 = HexColor.fromHex('#eb3b5a');

final Map<int, List<String>> gradientColors = {
  0: ['#ffafbd', '#ffc3a0'],
  1: ['#2193b0', '#6dd5ed'],
  2: ['#cc2b5e', '#753a88'],
  3: ['#ee9ca7', '#ffdde1'],
  4: ['#42275a', '#734b6d'],
  5: ['#bdc3c7', '#2c3e50'],
  6: ['#de6262', '#ffb88c'],
  7: ['#06beb6', '#48b1bf'],
  8: ['#dd5e89', '#f7bb97'],
  9: ['#614385', '#516395'],
  10: ['#eacda3', '#d6ae7b'],
  11: ['#02aab0', '#00cdac'],
  12: ['#000428', '#004e92'],
  13: ['#4ca1af', '#c4e0e5'],
  14: ['#141e30', '#243b55']
};

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
