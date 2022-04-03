import 'package:flutter_weather/app/modules/forecast/controllers/forecast_controller.dart';
import 'package:get/instance_manager.dart';

class ForecastBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ForecastController());
  }
}
