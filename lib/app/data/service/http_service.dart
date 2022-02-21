import 'package:dio/dio.dart';
import 'package:flutter_weather/app/core/constants.dart';
import 'package:flutter_weather/app/core/keys.dart';
import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';
import 'package:get/state_manager.dart';

class HttpSerrvice extends GetxService {
  final Dio dio = Dio();

  Future<WeatherData> getCurrentWeatherByCoordinate(
      {required String lat, required String lon}) async {
    Map<String, dynamic> query = {'lat': lat, 'lon': lon, 'appid': apiKey};
    late Map<String, dynamic> data;
    try {
      Response response =
          await dio.get(baseUrlCurrentWeather, queryParameters: query);
      if (response.statusCode == 200) {
        data = response.data;
      }
    } catch (e) {
      print(e.toString());
    }
    return WeatherData.fromJson(data);
  }
}
