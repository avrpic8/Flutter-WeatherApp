import 'package:flutter_weather/app/modules/search/controllers/search_controller.dart';
import 'package:get/instance_manager.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchController());
  }
}
