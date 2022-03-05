import 'package:dio/dio.dart';

const int defaultConnectTimeout = 60 * 1000;
const int defaultReceiveTimeout = 60 * 1000;

const int notFoundError = 404;
const DioErrorType timeOutError = DioErrorType.connectTimeout;

/// Base url for api call
const baseUrlCurrentWeather = 'https://api.openweathermap.org/data/2.5/weather';
const baseUrlOneCall = 'https://api.openweathermap.org/data/2.5';
