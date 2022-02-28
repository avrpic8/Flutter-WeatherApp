import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';
import 'package:flutter_weather/app/data/service/repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Repository repository;

  final loading = false.obs;
  final currentWeatherList = <WeatherData>[].obs;

  HomeController({required this.repository});

  @override
  void onInit() async {
    super.onInit();

    //WeatherData data =
        //await getWeatherByCoordinate(lat: '32.6572', lon: '51.6776');
    
  }

  RxBool dataIsReady() {
    if (loading.value) {
      return false.obs;
    } else {
      return true.obs;
    }
  }

  Future<void> getWeatherByCoordinate(
      {required String lat, required String lon}) async {
    loading.value = true;
    WeatherData weather =
        await repository.getWeatherByCoordinate(lat: lat, lon: lon);
    loading.value = false;
    currentWeatherList.add(weather);
  }

  Future<WeatherData> getDailyWeatherByCoordinate(
      {required String lat, required String lon}) async {
    loading.value = true;
    WeatherData weather =
        await repository.getDailyWeatherByCoordinate(lat: lat, lon: lon);
    loading.value = false;
    return weather;
  }
}
