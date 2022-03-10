import 'package:dio/dio.dart';
import 'package:flutter_weather/app/core/constants.dart';
import 'package:flutter_weather/app/data/models/geocoding/direct_geocoding.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';
import 'package:flutter_weather/app/data/service/repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Repository repository;

  final RxBool _loading = false.obs;
  final RxList _weatherDataList = <MainWeather>[].obs;
  final RxInt _selectedWeatherPageIndex = 0.obs;
  late DirectGeocoding geocodingData;

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

  Future<WeatherData> getWeatherByCoordinate(
      {required String lat, required String lon}) async {
    _loading.value = true;
    WeatherData weatherData = await repository.getCurrentWeatherByCoordinate(
        onError: (error) {
          print(error);
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

    _loading.value = false;
    return weatherData;
    //Get.snackbar('Success', 'Data has been successfully updated');
  }

  // void getWeatherByCoordinate({required String lat, required String lon}) {
  //   repository.getCurrentWeatherByCoordinate(
  //       beforeSend: () {
  //         _loading.value = true;
  //         print('before Send');
  //       },
  //       onSuccess: (weather) {
  //         print('success');
  //         _loading.value = false;
  //         _weatherDataList.add(MainWeather(cityName: geocodingData.localNames.uk!, weatherData: weatherData));
  //         Get.snackbar('Success', 'Data has been successfully updated');
  //       },
  //       onError: (error) {
  //         print(error);
  //         _loading.value = false;
  //         if (error is DioError) {
  //           if (error.type == DioErrorType.response) {
  //             if (error.response!.statusCode == notFoundError) {
  //               Get.snackbar('Error', 'Server error');
  //             }
  //           } else if (error.type == timeOutError) {
  //             print('hi');
  //             Get.snackbar('Error', 'Time out, please try later');
  //           }
  //         }
  //       },
  //       lat: lat,
  //       lon: lon);
  // }

  // void getCurrentWeatherByCoordinate(
  //     {required String lat, required String lon}) {
  //   repository.getCurrentWeatherByCoordinate(
  //       beforeSend: () {
  //         _loading.value = true;
  //         print('before Send');
  //       },
  //       onSuccess: (weather) {
  //         print('success');
  //         _loading.value = false;
  //         _weatherDataList.add(weather);
  //         Get.snackbar('Success', 'Data has been successfully updated');
  //       },
  //       onError: (error) {
  //         print(error);
  //         _loading.value = false;
  //         if (error is DioError) {
  //           if (error.type == DioErrorType.response) {
  //             if (error.response!.statusCode == notFoundError) {
  //               Get.snackbar('Error', 'Server error');
  //             }
  //           } else if (error.type == timeOutError) {
  //             print('hi');
  //             Get.snackbar('Error', 'Time out, please try later');
  //           }
  //         }
  //       },
  //       lat: lat,
  //       lon: lon);
  // }

  // void getDailyWeatherByCoordinate({required String lat, required String lon}) {
  //   repository.getDailyWeatherByCoordinate(
  //       beforeSend: () {
  //         _loading.value = true;
  //         print('before Send');
  //       },
  //       onSuccess: (weather) {
  //         print('success');
  //         _loading.value = false;
  //         _weatherDataList.add(weather);
  //       },
  //       onError: (error) {
  //         _loading.value = false;
  //         if (error is DioError) {
  //           if (error.type == DioErrorType.response) {
  //             if (error.response!.statusCode == notFoundError) {
  //               Get.snackbar('Error', 'Server error');
  //             }
  //           } else if (error.type == timeOutError) {
  //             print('hi');
  //             Get.snackbar('Error', 'Time out, please try later');
  //           }
  //         }
  //       },
  //       lat: lat,
  //       lon: lon);
  // }

  // void getWeatherByCityName({required String cityName}) {
  //   repository.getCoordinateByCityName(
  //       beforeSend: () {
  //         _loading.value = true;
  //       },
  //       onSuccess: (geoCoding) {
  //         geocodingData = geoCoding;
  //         getWeatherByCoordinate(
  //             lat: geocodingData.lat.toString(),
  //             lon: geocodingData.lon.toString());
  //       },
  //       onError: (error) {
  //         print(error);
  //         _loading.value = false;
  //         if (error is DioError) {
  //           if (error.type == DioErrorType.response) {
  //             if (error.response!.statusCode == notFoundError) {
  //               Get.snackbar('Error', 'Server error');
  //             }
  //           } else if (error.type == timeOutError) {
  //             print('hi');
  //             Get.snackbar('Error', 'Time out, please try later');
  //           }
  //         }
  //       },
  //       cityName: cityName);
  // }

  void getWeatherByCityName({required String cityName}) {
    repository.getCoordinateByCityName(
        beforeSend: () {
          _loading.value = true;
        },
        onSuccess: (geoCoding) async {
          geocodingData = geoCoding;
          WeatherData data = await getWeatherByCoordinate(
              lat: geocodingData.lat.toString(),
              lon: geocodingData.lon.toString());

          _weatherDataList.add(MainWeather(
              cityName: geocodingData.localNames.en!, weatherData: data));
        },
        onError: (error) {
          print(error);
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
        cityName: cityName);
  }
}
