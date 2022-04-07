import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/modules/settings/controllers/settings_controller.dart';
import 'package:get/get.dart';

class ForecastItem extends StatelessWidget {
  ForecastItem({
    Key? key,
    required this.dayIndex,
    required this.forecastData,
  }) : super(key: key);

  final int dayIndex;
  final MainWeather forecastData;
  final settingCtr = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    String iconPath = getWeatherIcons(
        forecastData.weatherData.daily![dayIndex].weather![0].id!);
    String imagePath = getWeatherBackgrounds(800);

    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          print('hello');
        },
        child: Container(
          width: Get.width * 0.36,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              // ClipRect(
              //   child: BackdropFilter(
              //     filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              //     child: Container(
              //       width: double.infinity,
              //       height: double.infinity,
              //       decoration: BoxDecoration(
              //           color: Colors.grey.shade200.withOpacity(0.5)),
              //     ),
              //   ),
              // ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        forecastData.weatherData.daily![dayIndex].dt!
                            .unixToDay(),
                        style: normalTextTheme.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      ),
                    ),
                    SvgPicture.asset(
                      iconPath,
                      width: 45,
                      height: 45,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        settingCtr.unitFlag
                            ? "${forecastData.weatherData.daily![dayIndex].temp!.day!.kelvinToFahrenheit()}\u2109"
                            : "${forecastData.weatherData.daily![dayIndex].temp!.day!.kelvinToCelsius()}\u2103",
                        style: normalTextTheme.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
