import 'package:flutter_weather/app/modules/connection/connection_controller.dart';
import 'package:flutter_weather/app/modules/settings/controllers/settings_controller.dart';
import 'package:get/instance_manager.dart';

class ConnectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController());
    Get.lazyPut<ConnectionController>(() => ConnectionController());
  }
}
