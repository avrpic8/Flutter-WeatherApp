import 'package:dio/dio.dart';
import 'package:flutter_weather/app/core/constants.dart';
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
  }

  RxBool dataIsReady() {
    if (loading.value) {
      return false.obs;
    } else {
      return true.obs;
    }
  }

  void getCurrentWeatherByCoordinate(
      {required String lat, required String lon}) {
    repository.getCurrentWeatherByCoordinate(
        beforeSend: () {
          loading.value = true;
          print('before Send');
        },
        onSuccess: (weather) {
          print('success');
          loading.value = false;
          currentWeatherList.add(weather);
        },
        onError: (error) {
          loading.value = false;
          if (error is DioError) {
            if (error.type == DioErrorType.response) {
              if(error.response!.statusCode == notFoundError) {
                Get.snackbar('Error', 'Server error');
              }
            }else if (error.type == timeOutError) {
              print('hi');
              Get.snackbar('Error', 'Time out, please try later');
            }
          }
        },
        lat: lat,
        lon: lon);
  }

  void getDailyWeatherByCoordinate({required String lat, required String lon}) {
    repository.getDailyWeatherByCoordinate(
        beforeSend: () {
          loading.value = true;
          print('before Send');
        },
        onSuccess: (weather) {
          print('success');
          loading.value = false;
          currentWeatherList.add(weather);
        },
        onError: (error) {
          loading.value = false;
          if (error is DioError) {
            if (error.type == DioErrorType.response) {
              if(error.response!.statusCode == notFoundError) {
                Get.snackbar('Error', 'Server error');
              }
            }else if (error.type == timeOutError) {
              print('hi');
              Get.snackbar('Error', 'Time out, please try later');
            }
          }
        },
        lat: lat,
        lon: lon);
  }
}
