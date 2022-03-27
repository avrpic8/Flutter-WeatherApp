import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_weather/app/modules/main/main_controller.dart';
import 'package:get/get.dart';

class BackGround extends StatelessWidget {
  BackGround({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final mainCtr = Get.find<MainController>();
  final homeCtr = Get.find<HomeController>();
  final double width;
  final double height;
  String path = '';
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (mainCtr.weatherList.isNotEmpty) {
          MainWeather weather =
              mainCtr.weatherList.elementAt(homeCtr.selectedPageIndex.value);
          int weatherId = weather.weatherData.current!.weather![0].id ?? 500;
          path = getWeatherBackgrounds(weatherId);
        }

        if (mainCtr.weatherList.isNotEmpty) {
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
