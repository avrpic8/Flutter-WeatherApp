import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:get/get.dart';

class ForecastController extends GetxController {
  late MainWeather dataForecast;

  @override
  void onInit() {
    super.onInit();
    dataForecast = Get.arguments;
    print(dataForecast.weatherData.daily!.length);
  }
}
