import 'package:flutter_weather/app/modules/citymanager/bindings/city_manager_binding.dart';
import 'package:flutter_weather/app/modules/citymanager/view/city_manager_view.dart';
import 'package:flutter_weather/app/modules/forecast/bindings/forecast_binding.dart';
import 'package:flutter_weather/app/modules/forecast/views/forecast_view.dart';
import 'package:flutter_weather/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_weather/app/modules/home/views/home_view.dart';
import 'package:flutter_weather/app/modules/search/bindings/search_binding.dart';
import 'package:flutter_weather/app/modules/search/views/search_view.dart';
import 'package:flutter_weather/app/modules/settings/views/settings_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.CITY_MANAGER,
      page: () => CityManagerView(),
      binding: CityManagerBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.FORECAST,
      page: () => ForecastView(),
      binding: ForecastBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
