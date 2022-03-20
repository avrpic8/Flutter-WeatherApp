import 'package:flutter_weather/app/core/keys.dart';
import 'package:flutter_weather/app/data/service/http_service.dart';
import 'package:flutter_weather/app/data/service/local_service.dart';
import 'package:flutter_weather/app/data/service/repository_imp.dart';
import 'package:flutter_weather/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    final remoteService = Get.put(HttpService());
    final localService = Get.put(LocalService(box: Hive.box(dbKey)));
    final repository = Get.put(
      RepositoryImp(localService: localService, remoteService: remoteService),
    );

    Get.put(HomeController(repository: repository));
  }
}
