import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:google_fonts/google_fonts.dart';

/// Colors
final statusBarColor = HexColor.fromHex('#689F38');
final primaryColor = HexColor.fromHex('#8BC34A');
final secondryColor = HexColor.fromHex('#8BC34A');
final backgroundColor = HexColor.fromHex('#282828');

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
