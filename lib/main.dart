import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather/app/core/keys.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/data/models/oneCall/alert.dart';
import 'package:flutter_weather/app/data/models/oneCall/current.dart';
import 'package:flutter_weather/app/data/models/oneCall/daily.dart';
import 'package:flutter_weather/app/data/models/oneCall/feels_like.dart';
import 'package:flutter_weather/app/data/models/oneCall/temp.dart';
import 'package:flutter_weather/app/data/models/oneCall/weather.dart';
import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';
import 'package:flutter_weather/app/modules/connection/connection_binding.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/routes/app_pages.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent));

  /// init database
  await initHive();

  // certificate for http protocol
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      initialBinding: ConnectionBinding(),
      getPages: AppPages.routes,
      scrollBehavior: AppScrollBehavior(),
      theme: getLightTheme(),
    );
  }
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MainWeatherAdapter());
  Hive.registerAdapter(WeatherDataAdapter());
  Hive.registerAdapter(CurrentAdapter());
  Hive.registerAdapter(TempAdapter());
  Hive.registerAdapter(FeelsLikeAdapter());
  Hive.registerAdapter(WeatherAdapter());
  Hive.registerAdapter(DailyAdapter());
  Hive.registerAdapter(AlertAdapter());

  await Hive.openBox<MainWeather>(dbKey);
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

/// support scroll for web brousers
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
