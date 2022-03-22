import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class BackGround extends StatelessWidget {
  BackGround({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final homeCtr = Get.find<HomeController>();
  final double width;
  final double height;
  String path = '';
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (homeCtr.weatherList.isNotEmpty) {
          MainWeather weather =
              homeCtr.weatherList.elementAt(homeCtr.selectedPageIndex.value);
          int weatherId = weather.weatherData.current!.weather![0].id ?? 500;
          path = getWeatherBackgrounds(weatherId);
        }

        if (homeCtr.weatherList.isNotEmpty) {
          return Stack(
            children: [
              Image.asset(
                path,
                fit: BoxFit.cover,
                width: width,
                height: height,
              ),
              Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ],
          );
        } else {
          return Stack(
            children: [
              Container(
                color: Colors.black87,
              ),
            ],
          );
        }
      },
    );
  }
}
