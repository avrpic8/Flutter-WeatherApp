import 'package:flutter_weather/app/core/keys.dart';
import 'package:flutter_weather/app/data/models/app_settings.dart';
import 'package:flutter_weather/app/data/service/http_service.dart';
import 'package:flutter_weather/app/data/service/local_service.dart';
import 'package:flutter_weather/app/data/service/repository_imp.dart';
import 'package:flutter_weather/app/modules/connection/connection_controller.dart';
import 'package:flutter_weather/app/modules/settings/controllers/settings_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ConnectionBinding extends Bindings {
  @override
  void dependencies() {
    final remoteService = Get.put(HttpService());
    final localService = Get.put(
      LocalService(
        weatherBox: Hive.box(dbWeatherKey),
        settingsBox: Hive.box(dbSettingsKey),
      ),
    );
    final repository = Get.put(
      RepositoryImp(localService: localService, remoteService: remoteService),
    );
    Get.put(SettingsController(repository: repository));
    Get.lazyPut<ConnectionController>(() => ConnectionController());
  }
}
