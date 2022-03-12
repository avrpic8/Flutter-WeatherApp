import 'package:flutter_weather/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_weather/app/modules/home/views/home_view.dart';
import 'package:flutter_weather/app/modules/search/bindings/search_binding.dart';
import 'package:flutter_weather/app/modules/search/views/search_view.dart';
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
      transition: Transition.downToUp
    ),
  ];
}
