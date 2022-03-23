import 'package:flutter/material.dart';
import 'package:flutter_weather/app/modules/settings/controllers/settings_controller.dart';
import 'package:flutter_weather/app/modules/settings/widgets/list_of_settings.dart';
import 'package:flutter_weather/app/widgets/my_app_bar.dart';
import 'package:get/state_manager.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Settings'),
      body: ListOfSettings(controller: controller),
    );
  }
}
