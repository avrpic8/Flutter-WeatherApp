import 'package:flutter_weather/app/modules/citymanager/controllers/city_manager_controller.dart';
import 'package:get/instance_manager.dart';

class CityManagerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CityManagerController());
  }
}
