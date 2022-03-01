import 'package:flutter_weather/app/data/provider/weather_api_provider.dart';
import 'package:flutter_weather/app/data/service/http_service.dart';
import 'package:flutter_weather/app/data/service/repository.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(
        repository: Repository(
          provider: WaetherApiProvider(httpSerrvice: HttpSerrvice()),
        ),
      ),
    );
  }
}
