import 'package:dio/dio.dart';
import 'package:flutter_weather/app/core/constants.dart';
import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';
import 'package:flutter_weather/app/data/service/repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Repository repository;

  final RxBool _loading = false.obs;
  final RxList _weatherDataList = <WeatherData>[].obs;
  final RxInt  _selectedWeatherPageIndex = 0.obs;

  HomeController({required this.repository});

  @override
  void onInit() async {
    super.onInit();
  }

  RxBool dataIsReady() {
    if (_loading.value) {
      return false.obs;
    } else {
      return true.obs;
    }
  }

  RxList get weatherList => _weatherDataList;

  RxInt get selectedPageIndex => _selectedWeatherPageIndex;
  
  void getCurrentWeatherByCoordinate(
      {required String lat, required String lon}) {
    repository.getCurrentWeatherByCoordinate(
        beforeSend: () {
          _loading.value = true;
          print('before Send');
        },
        onSuccess: (weather) {
          print('success');
          _loading.value = false;
          _weatherDataList.add(weather);
          Get.snackbar('Success', 'Data has been successfully updated');
        },
        onError: (error) {
          _loading.value = false;
          if (error is DioError) {
            if (error.type == DioErrorType.response) {
              if (error.response!.statusCode == notFoundError) {
                Get.snackbar('Error', 'Server error');
              }
            } else if (error.type == timeOutError) {
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
          _loading.value = true;
          print('before Send');
        },
        onSuccess: (weather) {
          print('success');
          _loading.value = false;
          _weatherDataList.add(weather);
        },
        onError: (error) {
          _loading.value = false;
          if (error is DioError) {
            if (error.type == DioErrorType.response) {
              if (error.response!.statusCode == notFoundError) {
                Get.snackbar('Error', 'Server error');
              }
            } else if (error.type == timeOutError) {
              print('hi');
              Get.snackbar('Error', 'Time out, please try later');
            }
          }
        },
        lat: lat,
        lon: lon);
  }
}
