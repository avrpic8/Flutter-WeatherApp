import 'package:flutter_weather/app/data/models/currentCall/weather_data.dart';
import 'package:flutter_weather/app/data/service/repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var weather;
  final _loading = false.obs;
  final Repository repository;

  HomeController({required this.repository});

  @override
  void onInit() async {
    super.onInit();
    weather = await getWeatherByCoordinate(lat: '32.6572', lon: '51.6776');
  }

  bool dataIsReady() {
    if (_loading.value) {
      return false;
    } else {
      return true;
    }
  }

  Future<WeatherData> getWeatherByCoordinate(
      {required String lat, required String lon}) async {
    _loading.value = true;
    var weather = await repository.getWeatherByCoordinate(lat: lat, lon: lon);
    _loading.value = false;
    return weather;
  }
}
