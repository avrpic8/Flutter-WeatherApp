import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';
import 'package:flutter_weather/app/data/service/repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var weather = WeatherData();

  final Repository repository;

  HomeController({required this.repository});

  @override
  void onInit() async {
    super.onInit();
    print('hi');
    weather = await getWeatherByCoordinate(lat: '32.6572', lon: '51.6776');
    //print(weather);
  }

  Future<WeatherData> getWeatherByCoordinate(
      {required String lat, required String lon}) async {
    var weather = await repository.getWeatherByCoordinate(lat: lat, lon: lon);
    return weather;
  }
}
