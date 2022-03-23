import 'package:flutter_weather/app/modules/settings/controllers/settings_controller.dart';
import 'package:get/instance_manager.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.find<SettingsController>();
  }
}
