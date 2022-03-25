import 'package:dio/dio.dart';

const int defaultConnectTimeout = 60 * 1000;
const int defaultReceiveTimeout = 60 * 1000;

/// Dio errors
const int notFoundError = 404;
const DioErrorType timeOutError = DioErrorType.connectTimeout;

/// Connection type
const int wifiInternet = 1;
const int noneInternet = 0;
const int mobileInternet = 2;

/// Auto update time
const int disable = 0;
const int oneHour = 1;
const int threeHour = 3;
const int fiveHour = 5;

const Map<String, int> autoUpdate = {
  'Disable': disable,
  'One Hour': oneHour,
  'Three Hour': threeHour,
  'Five Hour': fiveHour
};

/// Base url for api call
const String baseUrlOneCall = 'https://api.openweathermap.org/data/2.5';
const String baseUrlGeoCoding = 'http://api.openweathermap.org/geo/1.0';
