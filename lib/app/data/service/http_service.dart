import 'package:dio/dio.dart';
import 'package:flutter_weather/app/core/constants.dart';
import 'package:get/get.dart';

class HttpSerrvice extends GetxService {
  final Dio dio = Dio();

  HttpSerrvice() {
    dio
      ..options.baseUrl = baseUrlOneCall
      ..options.connectTimeout = defaultConnectTimeout
      ..options.receiveTimeout = defaultReceiveTimeout;
  }

  void get(
      {required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic erro) onError,
      required Map<String, dynamic> query}) {
    beforeSend();
    dio.get('/onecall', queryParameters: query).then((result) {
      onSuccess(result.data);
    }).catchError((error) {
      onError(error);
    });
  }
}
