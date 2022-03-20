import 'package:flutter_weather/app/data/service/repository_imp.dart';
import 'package:flutter_weather/app/modules/citymanager/controllers/city_manager_controller.dart';
import 'package:get/instance_manager.dart';

class CityManagerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      CityManagerController(
        repository: Get.find<RepositoryImp>(),
      ),
    );
  }
}
