import 'package:dio/dio.dart';
import 'package:flutter_weather/app/core/constants.dart';
import 'package:flutter_weather/app/data/models/geocoding/direct_geocoding.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';
import 'package:flutter_weather/app/data/service/repository_imp.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RepositoryImp repository;

  final RxBool _loading = false.obs;
  final RxList<MainWeather> _weatherDataList = <MainWeather>[].obs;
  final RxInt _selectedWeatherPageIndex = 0.obs;

  HomeController({required this.repository});

  @override
  void onInit() async {
    super.onInit();
    List<MainWeather> weatherList = await getAllWeather();
    if (weatherList.isNotEmpty) {
      _weatherDataList.assignAll(weatherList);
    }
  }

  RxBool dataIsReady() {
    if (_loading.value) {
      return false.obs;
    } else {
      return true.obs;
    }
  }

  void _enableLoading() {
    _loading.value = true;
  }

  void _disableLoading() {
    _loading.value = false;
  }

  RxList<MainWeather> get weatherList => _weatherDataList;

  RxInt get selectedPageIndex => _selectedWeatherPageIndex;

  void getWeatherByCityName({required String cityName}) async {
    DirectGeocoding geocodingData = await repository.getCoordinateByCityName(
        onError: (error) {
          print(error);
          _disableLoading();
          if (error is DioError) {
            if (error.type == DioErrorType.response) {
              if (error.response!.statusCode == notFoundError) {
                Get.snackbar('Error', 'Server error');
              }
            } else if (error.type == timeOutError) {
              print('hi');
              Get.snackbar('Error', 'Time out, please try later');
            }
          } else {
            Get.snackbar('Sorry', 'Not found city');
          }
        },
        cityName: cityName);
    WeatherData data = await getWeatherByCoordinate(
        lat: geocodingData.lat.toString(), lon: geocodingData.lon.toString());
    MainWeather weather = MainWeather(cityName: cityName, weatherData: data);
    //repository.createOrUpdateWeather(weather);
    _weatherDataList.insert(0, weather);
    refreshDataBase();
  }

  Future<void> getWeatherByGpsData(
      {required String lat, required String lon}) async {
    DirectGeocoding geocodingData = await repository.getCityNameByCoordinate(
      onError: (error) {
        print(error);
        _disableLoading();
        if (error is DioError) {
          if (error.type == DioErrorType.response) {
            if (error.response!.statusCode == notFoundError) {
              Get.snackbar('Error', 'Server error');
            }
          } else if (error.type == timeOutError) {
            print('hi');
            Get.snackbar('Error', 'Time out, please try later');
          }
        } else {
          Get.snackbar('Sorry', 'Not found city');
        }
      },
      lat: lat,
      lon: lon,
    );
    WeatherData data = await getWeatherByCoordinate(lat: lat, lon: lon);
    MainWeather weather =
        MainWeather(cityName: geocodingData.localNames!.en, weatherData: data);
    //repository.createOrUpdateWeather(weather);
    _weatherDataList.insert(0, weather);
    refreshDataBase();
  }

  Future<WeatherData> getWeatherByCoordinate(
      {required String lat, required String lon}) async {
    _enableLoading();
    WeatherData weatherData = await repository.getWeatherByCoordinate(
        onError: (error) {
          _disableLoading();
          print(error);
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

    _disableLoading();
    Get.snackbar('Success', 'Data has been successfully updated');
    return weatherData;
  }

  Future<WeatherData> getCurrentWeatherByCoordinate(
      {required String lat, required String lon}) async {
    _enableLoading();
    WeatherData weatherData = await repository.getCurrentWeatherByCoordinate(
        onError: (error) {
          print(error);
          _disableLoading();
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

    _disableLoading();
    Get.snackbar('Success', 'Data has been successfully updated');
    return weatherData;
  }

  Future<WeatherData> getDailyWeatherByCoordinate(
      {required String lat, required String lon}) async {
    _enableLoading();
    WeatherData weatherData = await repository.getDailyWeatherByCoordinate(
        onError: (error) {
          print(error);
          _disableLoading();
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

    _disableLoading();
    Get.snackbar('Success', 'Data has been successfully updated');
    return weatherData;
  }

  void createOrUpdateWeather(MainWeather data) async {
    await repository.createOrUpdateWeather(data);
  }

  Future<List<MainWeather>> getAllWeather() async {
    List<MainWeather> result = await repository.getAllWeather();
    return result;
  }

  void refreshDataBase() async {
    final tempList = _weatherDataList.toList();
    await repository.deleteAllWeather();
    for (var item in tempList) {
      createOrUpdateWeather(item);
    }
  }
}
