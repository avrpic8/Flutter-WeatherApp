import 'dart:math';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/data/models/oneCall/daily.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:get/get.dart';

class ForecastController extends GetxController {
  late MainWeather dataForecast;
  List<int> tempList = [];
  int maxTemp = 0;

  double get maxTempr {
    var maxMargin = tempList.reduce(max);
    return maxMargin + (maxMargin * 0.6);
  }

  @override
  void onInit() {
    super.onInit();
    dataForecast = Get.arguments;
    print(dataForecast.weatherData.daily!.length);

    List<Daily>? listDay = dataForecast.weatherData.daily;
    for (var item in listDay!) {
      var temp = int.parse(item.temp!.day!.kelvinToCelsius());
      tempList.add(temp);
    }

    print(maxTempr);
  }
}
