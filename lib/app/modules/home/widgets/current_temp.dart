import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentTemp extends StatelessWidget {
  const CurrentTemp({
    Key? key,
    required this.currentTemp,
    required this.description,
  }) : super(key: key);

  final double? currentTemp;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${currentTemp!.kelvinToCelsius()}\u2103',
          style: tempCurrentWeather,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/weatherSvg/cloudy.svg',
              width: 34,
              height: 34,
              color: Colors.white,
            ),
            SizedBox(
              width: 8,
            ),
            Text(description.capitalize(),
                style: cityNameCurrentWeather.copyWith(fontSize: 20)),
          ],
        )
      ],
    );
  }
}
