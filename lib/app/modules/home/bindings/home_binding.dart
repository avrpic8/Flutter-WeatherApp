import 'package:flutter_weather/app/data/service/http_service.dart';
import 'package:flutter_weather/app/data/service/repository_imp.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(
        repository: RepositoryImp(service: HttpService()),
      ),
    );
  }
}
