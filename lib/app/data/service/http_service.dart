import 'package:dio/dio.dart' as myDio;
import 'package:flutter_weather/app/core/constants.dart';
import 'package:flutter_weather/app/data/models/geocoding/direct_geocoding.dart';
import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';
import 'package:get/get.dart';

class HttpService extends GetxService {
  final myDio.Dio dio = myDio.Dio();

  HttpService() {
    dio
      ..options.connectTimeout = defaultConnectTimeout
      ..options.receiveTimeout = defaultReceiveTimeout;
  }

  Future<WeatherData> getWeatherByCoordinate(
      {required Map<String, dynamic> query,
      required Function(dynamic error) onError}) async {
    dio.options.baseUrl = baseUrlOneCall;
    late Map<String, dynamic> data;
    try {
      myDio.Response response =
          await dio.get('/onecall', queryParameters: query);
      data = response.data;
    } catch (e) {
      onError(e);
    }
    return WeatherData.fromMap(data);
  }

  Future<DirectGeocoding> getCoordinateByCityName({
    required Map<String, dynamic> query,
    required Function(dynamic erro) onError,
  }) async {
    dio.options.baseUrl = baseUrlGeoCoding;
    late Map<String, dynamic> data;
    try {
      myDio.Response response =
          await dio.get('/direct', queryParameters: query);
      data = response.data[0];
    } catch (e) {
      onError(e);
    }
    return DirectGeocoding.fromMap(data);
  }

  Future<DirectGeocoding> getCityNameByCoordinate(
      {required Map<String, dynamic> query,
      required Function(dynamic error) onError}) async{
    dio.options.baseUrl = baseUrlGeoCoding;
    late Map<String, dynamic> data;
    try {
      myDio.Response response =
          await dio.get('/reverse', queryParameters: query);
      data = response.data[0];
    } catch (e) {
      onError(e);
    }
    return DirectGeocoding.fromMap(data);
  }
}
