import 'package:dio/dio.dart' as myDio;
import 'package:flutter_weather/app/core/constants.dart';
import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';
import 'package:get/get.dart';

class HttpSerrvice extends GetxService {
  final myDio.Dio dio = myDio.Dio();

  HttpSerrvice() {
    dio
      ..options.connectTimeout = defaultConnectTimeout
      ..options.receiveTimeout = defaultReceiveTimeout;
  }

  Future<WeatherData> getWeatherByCoordinate(
      {required Map<String, dynamic> query,
      required Function(dynamic erro) onError}) async {
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

  // void getWeatherByCoordinate(
  //     {required Function() beforeSend,
  //     required Function(dynamic data) onSuccess,
  //     required Function(dynamic erro) onError,
  //     required Map<String, dynamic> query}) {
  //   dio.options.baseUrl = baseUrlOneCall;
  //   beforeSend();
  //   dio.get('/onecall', queryParameters: query).then((result) {
  //     onSuccess(result.data);
  //   }).catchError((error) {
  //     onError(error);
  //   });
  // }

  void getCoordianteByCityName(
      {required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic erro) onError,
      required Map<String, dynamic> query}) {
    dio.options.baseUrl = baseUrlGeoCoding;
    beforeSend();
    dio.get('/direct', queryParameters: query).then((result) {
      onSuccess(result.data);
    }).catchError((error) {
      onError(error);
    });
  }
}
